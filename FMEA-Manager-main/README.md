# AMFE-S-Manager

## Project Overview

AMFE-S-Manager is a Python-based application designed to streamline the management, analysis, and visualization of P-FMEA (Process Failure Mode and Effects Analysis) data for manufacturing and quality assurance processes. The tool provides a user-friendly interface to scan, combine, and analyze AMFE Excel files from networked or local directories, generate risk distribution charts, and facilitate process improvement decisions.

### Key Features
- **Automatic Process Scanning:** Detects available process folders containing AMFE data.
- **Excel Data Aggregation:** Combines multiple AMFE Excel files, extracting relevant data while ignoring temporary or invalid files.
- **Risk Analysis:** Calculates and visualizes risk levels (High, Medium, Low) before and after mitigation actions.
- **Chart Generation:** Creates professional pie charts and summary graphics for risk distribution.
- **Internationalization (i18n):** Default language is Catalan, with support for Polish and English. Easily extensible to more languages using Babel.
- **Error Handling:** Robust validation and error reporting for file operations and data extraction.
- **Extensible Structure:** Modular design for future expansion, including GUI, reporting, and integration with other systems.

## Folder Structure

```
amfe-s-manager/
│
├── amfe_ui.py             # (Planned) User interface for interacting with the backend
├── requirements.txt       # Python dependencies
├── README.md              # Project documentation
│
├── backend/               # Backend logic and data processing modules
│   ├── __init__.py
│   ├── amfe_manager.py
│   ├── errors.py
│   ├── xl_cover_format.py # This we're doing!
│   └── xl_amfe_format.py
│
├── frontend/              # (Planned) Frontend UI components (e.g., for web or desktop GUI)
│   ├── __init__.py
│   ├── qt_ui.py
│   └── ui_main.py
│
├── config/                         # Utility scripts and helper functions
│   ├── README.md
│   └── settings.example.yaml       # Not in use rn
│
├── utilities/             # Utility scripts and helper functions
│   ├── __init__.py
│   └── logger.py      # Not in use rn
│
├── data/                  # (Optional) Sample data, templates, or output files
│   └── .gitkeep
│
├── logs/                  # 
│
├── docs/                  # 
│   └── formatting.txt
│
├── scripts/
│
├── assets/                # (Optional) Images, icons, or other static resources
│   ├── docs/
│   ├── fonts/    
│   ├── icons/    
│   └── images/    
│       └── logo_some.png/    
│
├── i18n/                  # Translation files and Babel message catalogs
│   ├── README.md
│   ├── ca/LC_MESSAGES/    # Catalan translations (default)
│   ├── en/LC_MESSAGES/    # English translations
│   └── pl/LC_MESSAGES/    # Polish translations
│
└── tests/                 # (Planned) Unit and integration tests
    └── __init__.py
```

## Internationalization (i18n)
- **Default language:** Catalan
- **Supported languages:** Polish, English
- **Translation management:**
  - All user-facing strings should be wrapped for translation (e.g., using `gettext` or Babel extraction tags).
  - Use Babel to extract, update, and compile translation files in the `i18n/` directory.
  - To add a new language: `pybabel init -i messages.pot -d i18n -l <lang>`
  - To update translations: `pybabel extract -o messages.pot .` and `pybabel update -i messages.pot -d i18n`
  - To compile: `pybabel compile -d i18n`

## Future Functionalities
- **Graphical User Interface (GUI):** A desktop or web-based UI for easier interaction.
- **Batch Reporting:** Automated generation of PDF/Excel reports summarizing risk analysis.
- **User Authentication:** Secure access for multiple users or roles.
- **Database Integration:** Store and retrieve AMFE data from a database.
- **Advanced Analytics:** Trend analysis, custom risk metrics, and exportable dashboards.
- **Localization:** Multi-language support for international teams.

## 📦 Instal·lació per a Usuaris Finals

**L'aplicació està disponible com un instal·lador professional per Windows:**

### Descàrrega des de GitHub Releases

[![GitHub release](https://img.shields.io/github/v/release/Blanqui04/AMFE)](https://github.com/Blanqui04/AMFE/releases)

1. **Descarrega l'instal·lador:**
   - Ves a [GitHub Releases](https://github.com/Blanqui04/AMFE/releases/latest)
   - Descarrega `AMFE-Manager-Setup-X.X.X.exe`

2. **Instal·la:**
   - Fes doble clic sobre el fitxer descarregat
   - Segueix les instruccions de l'assistent
   - L'aplicació s'obrirà automàticament després d'instal·lar

3. **Utilitza:**
   - Troba l'aplicació al menú d'inici: **AMFE-S Manager**
   - O fes clic a la icona de l'escriptori

**✅ No cal instal·lar Python ni cap dependència!**

📖 **Manual complet:** Consulta [`docs/MANUAL_USUARI.md`](docs/MANUAL_USUARI.md)

---

## 🛠️ Per a Desenvolupadors

### Instal·lació des del codi font

1. **Clona el repositori:**
   ```sh
   git clone https://github.com/Blanqui04/AMFE.git
   cd AMFE/FMEA-Manager-main
   ```

2. **Crea entorn virtual:**
   ```sh
   python -m venv venv
   .\venv\Scripts\Activate.ps1  # Windows
   ```

3. **Instal·la dependències:**
   ```sh
   pip install -r requirements.txt
   ```

4. **Executa l'aplicació:**
   ```sh
   python amfe_ui.py
   ```

### 🚀 Crear instal·lador per distribuir

```powershell
# Build automàtic complet (recomanat)
.\build_all.ps1

# O pas a pas:
.\build_executable.ps1    # Crea l'executable
.\build_installer.ps1     # Crea l'instal·lador
```

📋 **Guia completa:** Consulta `docs/GUIA_DISTRIBUCIO.md`
3. **Run the main script:**
   ```sh
   python amfe.py
   ```

## Requirements
See `requirements.txt` for the full list of dependencies.

## License
MIT License

## Contact
For questions or contributions, please open an issue or contact the maintainer.
