# Guia Ràpida: Primera Release a GitHub

## Pas 1: Preparar el repositori

```powershell
# Assegura't que estàs al directori correcte
cd C:\Github\AMFE\AMFE\FMEA-Manager-main

# Afegir tots els nous fitxers
git add .github/workflows/build-release.yml
git add INSTALLACIO.md
git add RELEASE_CHECKLIST.md
git add CHANGELOG.md
git add README.md

# Veure què s'afegirà
git status
```

## Pas 2: Commit dels canvis

```powershell
git commit -m "feat: Add professional installer and GitHub release workflow

- Add GitHub Actions workflow for automated releases
- Add complete installation guide (INSTALLACIO.md)
- Add release checklist (RELEASE_CHECKLIST.md)
- Add changelog (CHANGELOG.md)
- Update README with download links and better documentation
- Fix PermissionError by using %LOCALAPPDATA% for logs
- Remove duplicate logging code from amfe_manager.py
- Add build automation scripts (PowerShell)
- Add Inno Setup configuration for Windows installer
- Add PyInstaller configuration"
```

## Pas 3: Push al repositori

```powershell
# Push a main
git push origin main
```

## Pas 4: Crear el primer tag

```powershell
# Crear tag amb versió 1.0.0
git tag -a v1.0.0 -m "Release v1.0.0

First stable release with professional installer

Features:
- Professional Windows installer (~100 MB)
- Standalone executable (no Python required)
- Desktop and Start Menu shortcuts
- Logging to %LOCALAPPDATA%\AMFE-Manager\logs
- Multi-language support (Catalan, English, Polish)
- Complete user documentation
- Automatic GitHub release workflow

Bug Fixes:
- Fixed PermissionError when creating logs in Program Files
- Removed duplicate logging code

Technical:
- PyInstaller for executable bundling
- Inno Setup for professional installer
- PowerShell build automation
- GitHub Actions for CI/CD"

# Push del tag (això activarà el workflow automàtic!)
git push origin v1.0.0
```

## Pas 5: Crear Release Manual (si no uses GitHub Actions)

Si el workflow automàtic falla o prefereixes fer-ho manualment:

1. **Anar a GitHub**:
   - https://github.com/Blanqui04/AMFE/releases/new

2. **Configurar Release**:
   - **Tag**: v1.0.0
   - **Title**: `AMFE Manager v1.0.0 - Primera Release Oficial`
   - **Description**: (Copiar de CHANGELOG.md)

3. **Pujar fitxer**:
   - Fes clic a "Attach binaries"
   - Selecciona: `C:\Github\AMFE\AMFE\FMEA-Manager-main\installer_output\AMFE-Manager-Setup-1.0.0.exe`

4. **Publicar**:
   - Fes clic a "Publish release"

## Pas 6: Verificar la Release

```powershell
# Obrir la pàgina de releases
Start-Process "https://github.com/Blanqui04/AMFE/releases"
```

Verifica que:
- ✅ El tag v1.0.0 apareix
- ✅ El fitxer AMFE-Manager-Setup-1.0.0.exe es pot descarregar
- ✅ La mida és correcta (~100 MB)
- ✅ Les release notes es mostren correctament

## Pas 7: Provar la descàrrega

1. Descarrega l'installer des de GitHub Releases
2. Executa'l en un PC de prova
3. Verifica que funciona correctament
4. Comprova que els logs es creen a `%LOCALAPPDATA%\AMFE-Manager\logs\`

## Notes Importants

⚠️ **Abans de push el tag**:
- Assegura't que l'installer funciona
- Comprova que no hi ha errors de permisos
- Verifica que tots els fitxers estan commitejats

✅ **Després de la release**:
- Actualitza el README si cal
- Respon als issues que puguin sorgir
- Prepara hotfix si es detecten problemes crítics

## Següents versions

Per a versions futures (v1.0.1, v1.1.0, etc.):

1. Actualitza versió a `installer_setup.iss`:
   ```
   #define MyAppVersion "1.0.1"
   OutputBaseFilename=AMFE-Manager-Setup-1.0.1
   ```

2. Actualitza `CHANGELOG.md`

3. Commit i crea nou tag:
   ```powershell
   git tag -a v1.0.1 -m "Release v1.0.1: Bug fixes"
   git push origin v1.0.1
   ```

## Rollback (si cal)

Si hi ha un problema crític:

```powershell
# Eliminar tag localment
git tag -d v1.0.0

# Eliminar tag remotament
git push origin :refs/tags/v1.0.0
```

Després elimina la Release des de GitHub UI i crea una versió corregida.

## Ajuda

Si tens problemes:
- Consulta [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md)
- Consulta [GitHub Actions logs](https://github.com/Blanqui04/AMFE/actions)
- Revisa els [issues](https://github.com/Blanqui04/AMFE/issues)

---

**Bona sort amb la teva primera release! 🚀**
