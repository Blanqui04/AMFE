# Release Checklist - AMFE Manager

## Abans de crear una Release

### 1. Preparació del codi
- [ ] Tots els tests passen correctament
- [ ] No hi ha errors de linting (flake8, black)
- [ ] La documentació està actualitzada
- [ ] El fitxer CHANGELOG.md està actualitzat amb els canvis
- [ ] Les traduccions estan compilades (`pybabel compile -d i18n -D messages`)
- [ ] La versió està actualitzada a:
  - [ ] `installer_setup.iss` (línies AppVersion i OutputBaseFilename)
  - [ ] `amfe_ui.py` o fitxer principal (si hi ha variable de versió)
  - [ ] `README.md` (si fa referència a la versió)

### 2. Build local
- [ ] Executar `.\cleanup_repo.ps1` per netejar builds anteriors
- [ ] Executar `.\build_all_simple.ps1` per crear executable i installer
- [ ] Verificar que l'executable funciona:
  - [ ] Es pot executar des de `dist\AMFE-Manager\AMFE-Manager.exe`
  - [ ] No hi ha errors de dependències
  - [ ] La interfície es mostra correctament
  - [ ] Les funcionalitats principals funcionen
- [ ] Verificar que l'installer funciona:
  - [ ] L'installer es pot executar sense errors
  - [ ] La instal·lació es completa correctament
  - [ ] L'aplicació instal·lada funciona des de Program Files
  - [ ] Els logs es creen a `%LOCALAPPDATA%\AMFE-Manager\logs\`
  - [ ] No hi ha PermissionError
  - [ ] La desinstal·lació funciona correctament

### 3. Commit i Push
```powershell
# Afegir tots els canvis
git add .

# Commit amb missatge descriptiu
git commit -m "Release v1.0.0: [Descripció breu dels canvis]"

# Push al repositori
git push origin main
```

### 4. Crear Tag
```powershell
# Crear tag amb versió semàntica
git tag -a v1.0.0 -m "Release v1.0.0: [Descripció]"

# Push del tag (això activarà el workflow de GitHub Actions)
git push origin v1.0.0
```

## Crear Release a GitHub (Manual)

Si no uses GitHub Actions automàtic:

### 1. Anar a GitHub Releases
1. Ves a https://github.com/Blanqui04/AMFE/releases
2. Fes clic a **"Draft a new release"**

### 2. Configurar la Release
- **Tag**: Selecciona el tag `v1.0.0` (o crea'n un de nou)
- **Release title**: `AMFE Manager v1.0.0`
- **Description**: 
  ```markdown
  ## AMFE Manager v1.0.0
  
  ### 📥 Instal·lació
  1. Descarrega `AMFE-Manager-Setup-1.0.0.exe`
  2. Executa l'installer (doble clic)
  3. Segueix les instruccions de l'assistent
  4. Busca "AMFE Manager" al menú d'inici
  
  ### ✨ Novetats
  - [Llista de canvis i millores]
  - [Noves funcionalitats]
  - [Correccions de bugs]
  
  ### 🔧 Correccions
  - [Bug fixes específics]
  
  ### 📋 Requisits
  - Windows 10 o superior
  - ~100 MB d'espai lliure
  
  ### 📝 Notes
  - Els logs es guarden automàticament a `%LOCALAPPDATA%\AMFE-Manager\logs\`
  - Consulta [INSTALLACIO.md](INSTALLACIO.md) per instruccions detallades
  
  ### 🔗 Links
  - [Documentació completa](README.md)
  - [Guia d'instal·lació](INSTALLACIO.md)
  - [Reportar problemes](https://github.com/Blanqui04/AMFE/issues)
  ```

### 3. Pujar l'installer
- Fes clic a **"Attach binaries"**
- Selecciona `installer_output\AMFE-Manager-Setup-1.0.0.exe`
- Espera que es pugi completament

### 4. Publicar
- [ ] Revisa tota la informació
- [ ] Si és una versió beta: marca **"This is a pre-release"**
- [ ] Fes clic a **"Publish release"**

## Després de la Release

### 1. Verificació
- [ ] L'installer es pot descarregar correctament
- [ ] La mida del fitxer és correcta (~100 MB)
- [ ] El link de descàrrega funciona
- [ ] Les release notes es mostren correctament

### 2. Comunicació
- [ ] Actualitzar el README.md amb link a la última release
- [ ] Notificar als usuaris (si escau)
- [ ] Actualitzar documentació externa (si escau)

### 3. Monitorització
- [ ] Revisar GitHub Issues per problemes reportats
- [ ] Estar disponible per suport durant les primeres 24-48h
- [ ] Preparar hotfix si es detecten problemes crítics

## Versionat Semàntic

Seguir el format `vMAJOR.MINOR.PATCH`:

- **MAJOR** (v2.0.0): Canvis incompatibles amb versions anteriors
- **MINOR** (v1.1.0): Nova funcionalitat compatible amb versions anteriors
- **PATCH** (v1.0.1): Correccions de bugs compatibles

Exemples:
- `v1.0.0` - Primera release oficial
- `v1.0.1` - Correccions de bugs menors
- `v1.1.0` - Nova funcionalitat (export PDF, nova UI, etc.)
- `v2.0.0` - Canvi major (nova arquitectura, canvi de base de dades, etc.)

## Rollback

Si cal fer rollback per problema crític:

```powershell
# Eliminar el tag localment
git tag -d v1.0.0

# Eliminar el tag remotament
git push origin :refs/tags/v1.0.0
```

Després:
1. Elimina la Release des de GitHub (botó "Delete")
2. Corregeix el problema
3. Crea una nova versió (v1.0.1)

## Hotfix urgent

Per bugs crítics que requereixen solució immediata:

```powershell
# Crear branch hotfix
git checkout -b hotfix-v1.0.1

# Fer els canvis necessaris
# ... editar fitxers ...

# Commit
git commit -am "Hotfix v1.0.1: Correcció de [problema crític]"

# Merge a main
git checkout main
git merge hotfix-v1.0.1

# Tag i push
git tag -a v1.0.1 -m "Hotfix v1.0.1: Correcció de [problema crític]"
git push origin main
git push origin v1.0.1

# Eliminar branch hotfix
git branch -d hotfix-v1.0.1
```

## Notes importants

⚠️ **Abans de pujar a production**:
- Testeja SEMPRE en un entorn de test
- Comprova que l'installer funciona en un PC net (sense Python instal·lat)
- Verifica que no hi ha PermissionError amb usuaris estàndard (no admin)
- Comprova que els logs es creen correctament a AppData

✅ **Bones pràctiques**:
- Mantén un CHANGELOG.md actualitzat
- Documenta tots els canvis importants
- Inclou screenshots a les release notes si hi ha canvis visuals
- Proporciona instruccions clares d'instal·lació
- Respon ràpidament als issues reportats després d'una release
