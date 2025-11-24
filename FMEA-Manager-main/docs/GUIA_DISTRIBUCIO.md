# Guia de Distribució - AMFE-S Manager

## 📦 Com crear l'instal·lador per a usuaris finals

Aquesta guia explica com crear un instal·lador professional de l'aplicació AMFE-S Manager per distribuir-lo a usuaris finals sense coneixements tècnics.

---

## 🛠️ Prerequisites

Abans de començar, necessites:

1. **Python 3.8 o superior** instal·lat al sistema
   - Descarrega des de: https://www.python.org/downloads/
   - Marca l'opció "Add Python to PATH" durant la instal·lació

2. **Git** (opcional, si vols clonar el repositori)
   - Descarrega des de: https://git-scm.com/download/win

3. **Inno Setup 6** (per crear l'instal·lador Windows)
   - Descarrega des de: https://jrsoftware.org/isdl.php
   - Instal·la la versió completa (no la versió QuickStart)

---

## 📋 Procés complet de construcció

### Opció 1: Construcció automàtica (RECOMANADA)

Hem creat un script que automatitza tot el procés:

```powershell
# 1. Obre PowerShell a la carpeta del projecte
cd C:\Github\AMFE\AMFE\FMEA-Manager-main

# 2. Executa el script complet de build
.\build_all.ps1
```

Aquest script farà:
- ✓ Crear l'entorn virtual
- ✓ Instal·lar dependències
- ✓ Compilar traduccions
- ✓ Construir l'executable amb PyInstaller
- ✓ Crear l'instal·lador amb Inno Setup

### Opció 2: Construcció manual (pas a pas)

Si prefereixes més control o tens problemes amb el script automàtic:

#### Pas 1: Construir l'executable

```powershell
# Executa el script de build
.\build_executable.ps1
```

Aquest script:
- Crea un entorn virtual Python
- Instal·la totes les dependències
- Compila les traduccions
- Genera l'executable a `dist\AMFE-Manager\`

**Durada estimada:** 5-10 minuts

#### Pas 2: Crear l'instal·lador

```powershell
# Executa el script d'instal·lador
.\build_installer.ps1
```

Aquest script:
- Verifica que l'executable existeix
- Crea l'instal·lador amb Inno Setup
- Genera el fitxer .exe a `installer_output\`

**Durada estimada:** 2-5 minuts

---

## 📁 Estructura de fitxers generats

Després del build complet, tindràs:

```
FMEA-Manager-main/
│
├── dist/
│   └── AMFE-Manager/           # Executable i dependències
│       ├── AMFE-Manager.exe    # ← Executable principal
│       ├── i18n/               # Traduccions
│       ├── assets/             # Recursos
│       └── ...                 # DLLs i dependències
│
└── installer_output/
    └── AMFE-Manager-Setup-1.0.0.exe  # ← INSTAL·LADOR FINAL
```

---

## 🚀 Distribució als usuaris

### Fitxer a distribuir

**Només has de distribuir:**
```
installer_output/AMFE-Manager-Setup-1.0.0.exe
```

Aquest és un instal·lador autocontingut que inclou:
- ✓ L'aplicació completa
- ✓ Totes les dependències
- ✓ Traduccions
- ✓ Documentació
- ✓ Desinstal·lador

### Com l'usuari instal·la l'aplicació

L'usuari final només ha de:

1. **Descarregar** el fitxer `AMFE-Manager-Setup-1.0.0.exe`
2. **Fer doble clic** sobre el fitxer
3. **Seguir l'assistent** d'instal·lació (Next, Next, Install)
4. **Obrir l'aplicació** des del menú d'inici o l'escriptori

**No cal:**
- ❌ Instal·lar Python
- ❌ Instal·lar dependències
- ❌ Configurar res manualment
- ❌ Coneixements tècnics

---

## 🔍 Verificació de qualitat

Abans de distribuir, verifica:

### Test 1: Executable directe
```powershell
# Prova l'executable sense instal·lar
.\dist\AMFE-Manager\AMFE-Manager.exe
```
- ✓ L'aplicació s'obre sense errors
- ✓ La interfície es veu correctament
- ✓ Pots seleccionar directoris i processar dades

### Test 2: Instal·lador
```powershell
# Instal·la en un PC de test o màquina virtual
.\installer_output\AMFE-Manager-Setup-1.0.0.exe
```
- ✓ La instal·lació completa sense errors
- ✓ Es crea l'icona a l'escriptori
- ✓ L'aplicació apareix al menú d'inici
- ✓ L'aplicació funciona després d'instal·lar
- ✓ El desinstal·lador funciona correctament

---

## 🐛 Resolució de problemes

### Error: "Python no trobat"
**Solució:** Instal·la Python 3.8+ i marca "Add to PATH"

### Error: "PyInstaller falla"
**Solució:** 
```powershell
# Actualitza pip i reinstal·la PyInstaller
pip install --upgrade pip
pip install --upgrade pyinstaller
```

### Error: "Inno Setup no trobat"
**Solució:** Instal·la Inno Setup 6 des de https://jrsoftware.org/isdl.php

### L'executable no arranca
**Causes possibles:**
- Antivirus bloquejant el fitxer → Afegeix excepció
- Falta alguna DLL → Rebuilda amb `build_executable.ps1`
- Arxius corruptes → Neteja (`build`, `dist`) i rebuilda

### L'instal·lador dona error
**Verificacions:**
- ✓ L'executable existeix a `dist\AMFE-Manager\`
- ✓ El fitxer `installer_setup.iss` és correcte
- ✓ Tens permisos d'escriptura a `installer_output\`

---

## 📊 Mida dels fitxers

**Aproximacions:**
- Executable empaqutat: ~150-250 MB
- Instal·lador comprimit: ~80-120 MB
- Instal·lació completa: ~200-300 MB

*La mida pot variar segons les dependències i recursos inclosos.*

---

## 🔄 Actualitzacions

Per crear una nova versió:

1. **Actualitza el codi** amb els canvis necessaris
2. **Incrementa la versió** a:
   - `setup.py` → línia `version="X.X.X"`
   - `installer_setup.iss` → línia `#define MyAppVersion "X.X.X"`
3. **Rebuilda tot:**
   ```powershell
   .\build_all.ps1
   ```
4. **Distribueix** el nou instal·lador

---

## 📝 Checklist abans de distribuir

- [ ] Codi revisat i testat
- [ ] Versió actualitzada a tots els fitxers
- [ ] Build complet executat sense errors
- [ ] Executable testat en local
- [ ] Instal·lador testat en PC net
- [ ] Documentació actualitzada
- [ ] Canvis documentats (CHANGELOG)
- [ ] Antivirus verificat (no detecta falsos positius)

---

## 🎯 Bones pràctiques

✅ **Fer:**
- Versiona cada release (1.0.0, 1.0.1, etc.)
- Guarda els instal·ladors de cada versió
- Documenta els canvis en cada versió
- Testa en diferents versions de Windows
- Proporciona suport i documentació clara

❌ **Evitar:**
- Distribuir executables sense testar
- Canviar configuracions sense documentar
- Distribuir builds de desenvolupament
- Ignorar errors de l'antivirus

---

## 📞 Suport

Si tens problemes durant el procés de build:

1. **Revisa els logs** a la consola de PowerShell
2. **Comprova els requisits** (Python, Inno Setup)
3. **Neteja i rebuilda:**
   ```powershell
   Remove-Item -Recurse -Force build, dist, venv
   .\build_all.ps1
   ```
4. **Consulta la documentació** tècnica al README.md

---

**Versió de la guia:** 1.0.0  
**Data:** Novembre 2025  
**Autor:** AMFE Team
