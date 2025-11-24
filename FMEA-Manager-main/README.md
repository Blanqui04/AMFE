# AMFE Manager 🚀

Gestor professional de FMEA (Failure Mode and Effects Analysis) amb interfície gràfica i sistema d'instal·lació automàtica per a Windows.

[![GitHub release](https://img.shields.io/github/v/release/Blanqui04/AMFE)](https://github.com/Blanqui04/AMFE/releases/latest)
[![Windows](https://img.shields.io/badge/Platform-Windows%2010%2B-blue)](https://github.com/Blanqui04/AMFE/releases)

## 📥 Descàrrega i Instal·lació

### Per a usuaris finals

**👉 [Descarrega l'última versió](https://github.com/Blanqui04/AMFE/releases/latest)** ⬅️

1. Descarrega `AMFE-Manager-Setup-X.X.X.exe`
2. Executa l'installer (doble clic)
3. Segueix l'assistent d'instal·lació
4. Troba l'aplicació al menú d'inici o escriptori

📖 **Guia completa**: [INSTALLACIO.md](INSTALLACIO.md)

### Requisits del sistema

- ✅ Windows 10 o superior (64-bit)
- ✅ ~100 MB d'espai lliure
- ✅ 4 GB RAM (recomanat 8 GB)
- ✅ **No requereix Python instal·lat**

## ✨ Funcionalitats

- 📊 **Gestió completa** de fitxers AMFE/FMEA (P-FMEA)
- 🖥️ **Interfície gràfica** intuïtiva amb PyQt5
- 📈 **Generació automàtica** de gràfics i reports
- 💾 **Export a Excel** amb formatació professional
- 🌍 **Suport multiidioma** (Català, Anglès, Polonès)
- 📝 **Sistema de logging** automàtic
- 🎨 **Formats estàndard** AMFE aplicats automàticament
- 🔒 **Gestió segura** de permisos i dades
- 📊 **Anàlisi de risc** (Alt, Mitjà, Baix) abans i després de mitigació
- 🔍 **Escaneig automàtic** de carpetes de procés
- 📦 **Agregació de dades** de múltiples fitxers Excel

## 🚀 Inici ràpid

### Opció 1: Installer (Recomanat per usuaris finals)

1. **Descarrega** des de [Releases](https://github.com/Blanqui04/AMFE/releases)
2. **Executa** l'installer
3. **Obre** l'aplicació des del menú d'inici

### Opció 2: Des del codi font (Desenvolupadors)

```bash
# Clonar el repositori
git clone https://github.com/Blanqui04/AMFE.git
cd AMFE/FMEA-Manager-main

# Crear entorn virtual
python -m venv venv
venv\Scripts\activate

# Instal·lar dependències
pip install -r requirements.txt

# Compilar traduccions
pybabel compile -d i18n -D messages

# Executar aplicació
python amfe_ui.py
```

## 💻 Desenvolupament

### Build de l'executable i installer

```powershell
# Netejar builds anteriors
.\cleanup_repo.ps1

# Build complet (executable + installer)
.\build_all_simple.ps1

# Només executable
.\build_executable_simple.ps1

# Només installer (requereix executable existent)
.\build_installer_simple.ps1
```

### Estructura del projecte

```
FMEA-Manager-main/
├── amfe_ui.py                  # Punt d'entrada de l'aplicació
├── requirements.txt            # Dependències Python
├── installer_setup.iss         # Configuració Inno Setup
├── amfe_manager.spec           # Configuració PyInstaller
│
├── backend/                    # Lògica del negoci
│   ├── amfe_manager.py        # Gestor principal AMFE
│   ├── errors.py              # Gestió d'errors
│   ├── xl_amfe_format.py      # Formatació Excel AMFE
│   └── xl_cover_format.py     # Formatació portada
│
├── frontend/                   # Interfície d'usuari
│   ├── qt_ui.py               # Interfície PyQt5
│   └── ui_main.py             # Finestra principal
│
├── utilities/                  # Utilitats
│   └── logger.py              # Sistema de logging
│
├── i18n/                       # Traduccions (ca, en, pl)
├── config/                     # Configuració
├── docs/                       # Documentació
│
├── build_all_simple.ps1        # Script build complet
├── build_executable_simple.ps1 # Build executable
├── build_installer_simple.ps1  # Build installer
└── cleanup_repo.ps1            # Neteja builds
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
