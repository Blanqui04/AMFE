# AMFE Manager - Distribució Interna

## 📦 Fitxer d'Instal·lació

L'instal·lador està disponible a:
```
installer_output\AMFE-Manager-Setup-1.0.0.exe
```

## 🚀 Distribució Ràpida

### Per Administradors IT:

1. **Copiar l'instal·lador a una ubicació compartida:**
   ```powershell
   Copy-Item "installer_output\AMFE-Manager-Setup-1.0.0.exe" -Destination "\\servidor\aplicacions\AMFE-Manager\"
   ```

2. **Instal·lació silenciosa (opcional):**
   ```powershell
   \\servidor\aplicacions\AMFE-Manager\AMFE-Manager-Setup-1.0.0.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
   ```

### Per Usuaris Finals:

1. Executar `AMFE-Manager-Setup-1.0.0.exe`
2. Seguir l'assistent d'instal·lació
3. L'aplicació es trobarà al menú Inici: "AMFE Manager"

## 📋 Requisits

- **Sistema**: Windows 10/11 (64-bit)
- **Permisos**: Administrador per instal·lar, usuari normal per executar
- **Espai**: ~150 MB

## 📚 Documentació Completa

Consulta **`DISTRIBUCIO_EMPRESA.md`** per a:
- Opcions de desplegament (GPO, SCCM, etc.)
- Troubleshooting
- Scripts de monitorització
- Procediments de suport

## 🔄 Reconstruir l'Instal·lador

Si necessites reconstruir:

```powershell
# 1. Reconstruir executable (amb els canvis al codi)
.\build_executable_simple.ps1

# 2. Crear nou instal·lador
.\build_installer_simple.ps1
```

L'instal·lador actualitzat estarà a: `installer_output\AMFE-Manager-Setup-1.0.0.exe`

## 🧹 Neteja del Repositori

Abans de fer commit/push:

```powershell
.\cleanup_repo.ps1
```

Això elimina:
- `build/` - Fitxers temporals de construcció
- `dist/` - Executables generats  
- `installer_output/` - Instal·ladors generats
- `venv/` - Entorn virtual (no necessari al repo)
- Fitxers `*.pyc`, `*.log`, etc.

## 📞 Suport

Per qüestions tècniques o problemes:
- Consulta els logs a: `%LOCALAPPDATA%\AMFE-Manager\logs\`
- Revisa `DISTRIBUCIO_EMPRESA.md` per troubleshooting
