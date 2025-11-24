import logging
import os
from datetime import datetime
from pathlib import Path

def setup_logging(module_name: str) -> logging.Logger:
    # Utilitza AppData local per als logs (ubicació estàndard de Windows)
    appdata_dir = Path(os.getenv('LOCALAPPDATA', os.path.expanduser('~')))
    log_dir = appdata_dir / "AMFE-Manager" / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)

    log_filename = log_dir / f"{module_name}_{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}.log"

    logger = logging.getLogger(module_name)
    logger.setLevel(logging.DEBUG)

    formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")

    # File handler
    file_handler = logging.FileHandler(log_filename, mode='w', encoding='utf-8')
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)

    # Console handler
    console_handler = logging.StreamHandler()
    console_handler.setFormatter(formatter)
    logger.addHandler(console_handler)

    return logger
