import sys
from PyQt5.QtWidgets import QApplication
from backend.amfe_manager import AmfeManager  # noqa: F401
from .qt_ui import AmfeCombinerApp

def main():
    app = QApplication(sys.argv)
    window = AmfeCombinerApp()
    window.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()
