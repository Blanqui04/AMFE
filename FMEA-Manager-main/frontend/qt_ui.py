import os  # noqa: F401
from PyQt5.QtWidgets import (
    QMainWindow,
    QWidget,
    QLabel,
    QPushButton,
    QLineEdit,
    QApplication,
    QHBoxLayout,
    QVBoxLayout,
    QTreeWidget,
    QTreeWidgetItem,
    QGroupBox,
    QListWidget,
    QListWidgetItem,
    QProgressBar,
    QFileDialog,
    QMessageBox,
    QSplitter,
    QAbstractItemView,
    QSizePolicy
)
from PyQt5.QtCore import Qt, QThread, pyqtSignal
from PyQt5.QtGui import QFont, QIcon, QPixmap
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from backend.amfe_manager import AmfeManager
from typing import List


class AmfeCombinerApp(QMainWindow):
    """
    Main application window for AMFE Combiner (PyQt5)
    """

    def __init__(self):
        super().__init__()
        self.setWindowTitle("AMFE Combiner")
        self.setGeometry(100, 100, 1440, 960)
        self.amfe_manager = AmfeManager()
        self.init_ui()
        self.load_processes()

    def init_ui(self):
        main_widget = QWidget()
        self.setCentralWidget(main_widget)
        main_layout = QHBoxLayout(main_widget)

        # 🔷 Capçalera amb logo + títol centrat
        header_layout = QHBoxLayout()

        # Logotip
        logo_label = QLabel()
        logo_path = os.path.join("assets", "images", "logo_some.png")
        pixmap = QPixmap(logo_path)
        logo_label.setPixmap(pixmap.scaledToHeight(35, Qt.SmoothTransformation))
        logo_label.setMaximumHeight(40)
        logo_label.setSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed)

        # Títol real
        title_label = QLabel("AMFE Combiner")
        title_label.setFont(QFont("Segoe UI", 13, QFont.Bold))
        title_label.setStyleSheet("color: #2C3E50;")
        title_label.setAlignment(Qt.AlignRight)

        # Contenidors per fer el títol centrat
        left_container = QWidget()
        left_layout = QHBoxLayout()
        left_layout.setContentsMargins(0, 0, 0, 0)
        left_layout.addWidget(logo_label)
        left_container.setLayout(left_layout)

        right_container = QWidget()  # espai buit per compensar
        right_container.setFixedWidth(logo_label.sizeHint().width())

        header_layout.addWidget(left_container)
        header_layout.addWidget(title_label, stretch=1)

        header_widget = QWidget()
        header_widget.setMaximumHeight(50)
        header_widget.setLayout(header_layout)
        header_widget.setStyleSheet("background-color: #F7F9F9;")

        # 🔶 Layout principal amb splitter
        main_vlayout = QVBoxLayout()
        main_vlayout.addWidget(header_widget)

        splitter = QSplitter(Qt.Horizontal)
        left_panel = self.create_left_panel()
        right_panel = self.create_right_panel()
        splitter.addWidget(left_panel)
        splitter.addWidget(right_panel)
        splitter.setSizes([300, 700])

        main_vlayout.addWidget(splitter)
        main_layout.addLayout(main_vlayout)

        self.setStyle()


    def setStyle(self):
        self.setFont(QFont("Segoe UI", 10))
        self.setStyleSheet("""
            QMainWindow { background-color: #F7F9FB; }

            QGroupBox {
                border: 1px solid #D0D0D0;
                border-radius: 6px;
                margin-top: 1ex;
                font-weight: 600;
                padding: 10px;
            }

            QGroupBox::title {
                subcontrol-origin: margin;
                subcontrol-position: top left;
                padding: 0 10px;
                font-size: 12pt;
                color: #2C3E50;
            }

            QListWidget, QTreeWidget, QLineEdit {
                background-color: #FFFFFF;
                border: 1px solid #D0D0D0;
                border-radius: 4px;
                padding: 4px;
                font-size: 10pt;
            }

            QPushButton {
                background-color: #2C3E50;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 7px 14px;
                font-size: 10pt;
                font-weight: 500;
            }

            QPushButton:hover {
                background-color: #34495E;
            }

            QPushButton:pressed {
                background-color: #1C2833;
            }

            QPushButton#combineButton {
                background-color: #1ABC9C;
                font-size: 11pt;
                font-weight: 600;
            }

            QPushButton#combineButton:hover {
                background-color: #16A085;
            }

            QProgressBar {
                border: 1px solid #CCC;
                border-radius: 4px;
                background-color: #EDEDED;
                height: 20px;
                text-align: center;
                font-size: 9pt;
            }

            QProgressBar::chunk {
                background-color: #3498DB;
                width: 10px;
            }

            QLabel {
                color: #2C3E50;
            }

            QLineEdit::placeholder {
                color: #A0A0A0;
            }
        """)

    def create_left_panel(self) -> QWidget:
        panel = QWidget()
        layout = QVBoxLayout(panel)
        title = QLabel("Available Processes")
        title.setFont(QFont("Helvetica", 12, QFont.Bold))
        layout.addWidget(title)
        search_layout = QHBoxLayout()
        search_label = QLabel("Search:")
        self.search_input = QLineEdit()
        self.search_input.setPlaceholderText("Type to filter processes...")
        self.search_input.textChanged.connect(self.filter_processes)
        search_layout.addWidget(search_label)
        search_layout.addWidget(self.search_input)
        layout.addLayout(search_layout)
        self.process_list = QListWidget()
        self.process_list.setSelectionMode(QAbstractItemView.MultiSelection)
        self.process_list.itemSelectionChanged.connect(self.update_selected_list)
        layout.addWidget(self.process_list, 1)
        btn_layout = QHBoxLayout()
        self.select_all_btn = QPushButton("Select All")
        self.select_all_btn.clicked.connect(self.select_all)
        btn_layout.addWidget(self.select_all_btn)
        self.deselect_all_btn = QPushButton("Deselect All")
        self.deselect_all_btn.clicked.connect(self.deselect_all)
        btn_layout.addWidget(self.deselect_all_btn)
        layout.addLayout(btn_layout)
        return panel

    def create_right_panel(self) -> QWidget:
        panel = QWidget()
        layout = QVBoxLayout(panel)
        selected_group = QGroupBox("Selected Processes")
        selected_layout = QVBoxLayout(selected_group)
        self.selected_tree = QTreeWidget()
        self.selected_tree.setHeaderLabels(["Process", "Status", "Files"])
        self.selected_tree.setColumnWidth(0, 250)
        self.selected_tree.setColumnWidth(1, 100)
        self.selected_tree.setColumnWidth(2, 80)
        selected_layout.addWidget(self.selected_tree)
        layout.addWidget(selected_group)
        output_group = QGroupBox("Output Settings")
        output_layout = QVBoxLayout(output_group)
        file_layout = QHBoxLayout()
        file_label = QLabel("Output File:")
        self.output_path = QLineEdit()
        self.output_path.setPlaceholderText("Select output file location...")
        browse_btn = QPushButton("Browse...")
        browse_btn.clicked.connect(self.browse_output)
        file_layout.addWidget(file_label)
        file_layout.addWidget(self.output_path, 1)
        file_layout.addWidget(browse_btn)
        output_layout.addLayout(file_layout)
        self.progress_bar = QProgressBar()
        self.progress_bar.setRange(0, 100)
        self.progress_bar.setValue(0)
        output_layout.addWidget(self.progress_bar)
        self.status_label = QLabel("Ready")
        self.status_label.setAlignment(Qt.AlignCenter)
        output_layout.addWidget(self.status_label)
        self.combine_btn = QPushButton("Combine AMFEs")
        self.combine_btn.setObjectName("combineButton")
        self.combine_btn.clicked.connect(self.combine_amfes)
        output_layout.addWidget(self.combine_btn)
        layout.addWidget(output_group)
        graph_group = QGroupBox("Graph Generation")
        self.graph_layout = QVBoxLayout(graph_group)
        self.canvas = None
        placeholder = QLabel("No graph available. Combine AMFEs to generate one.")
        placeholder.setAlignment(Qt.AlignCenter)
        self.graph_layout.addWidget(placeholder)
        layout.addWidget(graph_group, 1)
        return panel

    def load_processes(self):
        self.process_list.clear()
        folder_icon = QIcon.fromTheme("folder")  # substitueix amb la ruta correcta
        for process in self.amfe_manager.available_processes:
            item = QListWidgetItem(folder_icon, process)
            self.process_list.addItem(item)

    def filter_processes(self):
        search_text = self.search_input.text().lower()
        for i in range(self.process_list.count()):
            item = self.process_list.item(i)
            item.setHidden(search_text not in item.text().lower())

    def select_all(self):
        for i in range(self.process_list.count()):
            if not self.process_list.item(i).isHidden():
                self.process_list.item(i).setSelected(True)

    def deselect_all(self):
        self.process_list.clearSelection()

    def update_selected_list(self):
        self.selected_tree.clear()
        selected_items = self.process_list.selectedItems()
        selected_processes = [item.text() for item in selected_items]

        valid_icon = QIcon("assets/valid_icon.png")
        invalid_icon = QIcon("assets/invalid_icon.png")

        for process in selected_processes:
            amfe_paths = self.amfe_manager.get_amfe_paths([process])
            files = self.amfe_manager.get_amfe_excels(amfe_paths)
            is_valid = files and self.amfe_manager.is_valid_excel(files[0])
            status = "Valid" if is_valid else "Invalid"
            icon = valid_icon if is_valid else invalid_icon
            item = QTreeWidgetItem([process, status, str(len(files))])
            item.setIcon(0, icon)
            self.selected_tree.addTopLevelItem(item)

    def browse_output(self):
        file_path, _ = QFileDialog.getSaveFileName(
            self, "Save Combined AMFE File", "", "Excel Files (*.xlsx);;All Files (*)"
        )
        if file_path:
            if not file_path.endswith(".xlsx"):
                file_path += ".xlsx"
            self.output_path.setText(file_path)

    def combine_amfes(self):
        selected_items = self.process_list.selectedItems()
        if not selected_items:
            QMessageBox.warning(self, "Warning", "Please select at least one process")
            return
        output_file = self.output_path.text()
        if not output_file:
            QMessageBox.warning(self, "Warning", "Please specify an output file")
            return
        selected_processes = [item.text() for item in selected_items]
        amfe_paths = self.amfe_manager.get_amfe_paths(selected_processes)
        self.status_label.setText("Combining AMFEs...")
        self.progress_bar.setValue(0)
        self.combine_btn.setEnabled(False)
        QApplication.processEvents()
        self.worker = AmfeWorker(self.amfe_manager, amfe_paths, output_file)
        self.worker.progress_signal.connect(self.update_progress)
        self.worker.finished_signal.connect(self.combine_finished)
        self.worker.start()

    def update_progress(self, value: int):
        self.progress_bar.setValue(value)

    def combine_finished(self, success: bool, message: str):
        self.combine_btn.setEnabled(True)
        if success:
            self.progress_bar.setValue(100)
            self.status_label.setText(f"Success! File saved to: {message}")
            QMessageBox.information(self, "Success", "AMFEs combined successfully!")
            self.show_graph()
        else:
            self.progress_bar.setValue(0)
            self.status_label.setText("Error occurred during combination")
            QMessageBox.critical(self, "Error", f"An error occurred:\n{message}")

    def show_graph(self):
        self.clear_graph_layout()
        try:
            risk_before = self.amfe_manager.get_risk_summary_data(
                self.output_path.text(), show="before"
            )
            risk_after = self.amfe_manager.get_risk_summary_data(
                self.output_path.text(), show="after"
            )
            chart_container = QWidget()
            chart_layout = QHBoxLayout(chart_container)
            chart_layout.setSpacing(20)
            fig_before = self.amfe_manager.display_risk_pie_chart(
                risk_before, "Initial Risk (Before Actions)"
            )
            canvas_before = FigureCanvas(fig_before)
            canvas_before.setMinimumSize(400, 400)
            chart_layout.addWidget(canvas_before)
            fig_after = self.amfe_manager.display_risk_pie_chart(
                risk_after, "Residual Risk (After Actions)"
            )
            canvas_after = FigureCanvas(fig_after)
            canvas_after.setMinimumSize(400, 400)
            chart_layout.addWidget(canvas_after)
            self.graph_layout.addWidget(chart_container)
        except Exception as e:
            error_label = QLabel(f"Could not generate graph: {str(e)}")
            error_label.setAlignment(Qt.AlignCenter)
            self.graph_layout.addWidget(error_label)

    def clear_graph_layout(self):
        while self.graph_layout.count():
            item = self.graph_layout.takeAt(0)
            widget = item.widget()
            if widget:
                widget.deleteLater()


class AmfeWorker(QThread):
    progress_signal = pyqtSignal(int)
    finished_signal = pyqtSignal(bool, str)

    def __init__(
        self, amfe_manager: AmfeManager, amfe_paths: List[str], output_file: str
    ):
        super().__init__()
        self.amfe_manager = amfe_manager
        self.amfe_paths = amfe_paths
        self.output_file = output_file

    def run(self):
        try:
            self.progress_signal.emit(30)
            result = self.amfe_manager.combine_amfe_data(
                self.amfe_paths, self.output_file
            )
            self.progress_signal.emit(80)
            if result:
                self.finished_signal.emit(True, self.output_file)
            else:
                self.finished_signal.emit(False, "Failed to create combined file")
        except Exception as e:
            self.finished_signal.emit(False, str(e))
        finally:
            self.progress_signal.emit(100)
