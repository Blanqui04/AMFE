import sys
from PyQt5.QtWidgets import QApplication

# Legacy UI entry point (kept for compatibility)
from frontend.ui_main import main

if __name__ == "__main__":
    app = QApplication(sys.argv)
    main()
    sys.exit(app.exec_())
