# Instal·lació i Ús Ràpid - AMFE-S Manager

## Per a Usuaris Finals (sense coneixements tècnics)

### Instal·lació

1. **Descarrega l'instal·lador:**
   - Obre el fitxer: `AMFE-Manager-Setup-1.0.0.exe`

2. **Executa l'instal·lador:**
   - Fes doble clic sobre el fitxer
   - Segueix les instruccions a pantalla
   - Accepta quan Windows demani permisos

3. **Obre l'aplicació:**
   - Busca "AMFE-S Manager" al menú d'inici
   - O fes clic a la icona de l'escriptori

### Primers passos

1. Selecciona la carpeta on tens els teus arxius AMFE
2. Tria el procés a analitzar
3. Fes clic a "Combinar i Analitzar"
4. Revisa els gràfics generats

📖 **Manual complet:** Consulta `MANUAL_USUARI.md` per més detalls

---

## Per a Desenvolupadors / Administradors

### Requisits

- Windows 10+
- Python 3.8+
- Git (opcional)
- Inno Setup 6 (per crear instal·ladors)

### Instal·lació des del codi font

```powershell
# 1. Clona el repositori
git clone https://github.com/Blanqui04/AMFE.git
cd AMFE/FMEA-Manager-main

# 2. Crea entorn virtual
python -m venv venv
.\venv\Scripts\Activate.ps1

# 3. Instal·la dependències
pip install -r requirements.txt

# 4. Executa l'aplicació
python amfe_ui.py
```

### Crear instal·lador per distribuir

```powershell
# Opció 1: Build automàtic complet
.\build_all.ps1

# Opció 2: Pas a pas
.\build_executable.ps1    # 1. Crea l'executable
.\build_installer.ps1     # 2. Crea l'instal·lador
```

L'instal·lador es generarà a: `installer_output/AMFE-Manager-Setup-1.0.0.exe`

📖 **Guia completa:** Consulta `docs/GUIA_DISTRIBUCIO.md` per més detalls

---

## Estructura del Projecte

```
FMEA-Manager-main/
├── amfe_ui.py                 # Punt d'entrada de l'aplicació
├── backend/                   # Lògica de negoci
├── frontend/                  # Interfície d'usuari
├── docs/                      # Documentació
├── i18n/                      # Traduccions
├── assets/                    # Recursos gràfics
├── build_all.ps1              # Build automàtic complet
├── build_executable.ps1       # Crear executable
├── build_installer.ps1        # Crear instal·lador
├── amfe_manager.spec          # Configuració PyInstaller
├── installer_setup.iss        # Configuració Inno Setup
└── requirements.txt           # Dependències Python
```

---

## Documentació Disponible

- 📘 **MANUAL_USUARI.md** - Guia completa per usuaris finals
- 📗 **GUIA_DISTRIBUCIO.md** - Com crear i distribuir l'instal·lador
- 📕 **README.md** - Informació general del projecte
- 📔 **CHANGELOG.md** - Historial de canvis i versions

---

## Suport

- **Issues:** https://github.com/Blanqui04/AMFE/issues
- **Documentació:** `docs/` dins del projecte

---

## Llicència

MIT License - Consulta el fitxer LICENSE per més detalls
