import sys

# Entry point for AMFE-S Manager
# Delegates to frontend.ui_main.main() which handles QApplication lifecycle
from frontend.ui_main import main

if __name__ == "__main__":
    main()
