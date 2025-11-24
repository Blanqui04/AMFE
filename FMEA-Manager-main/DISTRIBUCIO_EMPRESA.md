# Guia de Distribució Interna - AMFE Manager

## 📦 Per a Administradors IT

### Opció 1: Instal·lació Centralitzada (Recomanat)

#### A. Compartir l'instal·lador en xarxa

1. **Ubicar l'instal·lador**:
   ```
   installer_output\AMFE-Manager-Setup-1.0.0.exe
   ```

2. **Copiar a una ubicació compartida**:
   ```powershell
   # Exemple: compartir en servidor de fitxers
   Copy-Item "installer_output\AMFE-Manager-Setup-1.0.0.exe" -Destination "\\servidor\aplicacions\AMFE-Manager\"
   ```

3. **Distribuir per correu o intranet**:
   - Enviar enllaç: `\\servidor\aplicacions\AMFE-Manager\AMFE-Manager-Setup-1.0.0.exe`
   - O publicar a la intranet corporativa

#### B. Instal·lació silenciosa (per Group Policy o scripts)

```powershell
# Instal·lació silenciosa sense interfície
Start-Process -FilePath "\\servidor\aplicacions\AMFE-Manager\AMFE-Manager-Setup-1.0.0.exe" -ArgumentList "/VERYSILENT", "/SUPPRESSMSGBOXES", "/NORESTART" -Wait

# O des d'un script de desplegament
\\servidor\aplicacions\AMFE-Manager\AMFE-Manager-Setup-1.0.0.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
```

**Opcions d'instal·lació silenciosa:**
- `/VERYSILENT` - Instal·lació completament silenciosa
- `/SILENT` - Instal·lació amb barra de progrés
- `/SUPPRESSMSGBOXES` - Suprimeix missatges
- `/NORESTART` - No reinicia l'ordinador
- `/DIR="C:\Ruta\Personalitzada"` - Directori personalitzat

### Opció 2: Desplegament amb Group Policy (GPO)

1. **Crear un paquet MSI** (opcional, si es prefereix):
   - Utilitzar eines com Advanced Installer o WiX Toolset
   - Convertir l'instal·lador Inno Setup a MSI

2. **Desplegar via GPO**:
   - Computer Configuration → Policies → Software Settings → Software installation
   - Afegir nou paquet → seleccionar l'instal·lador
   - Configurar assignació o publicació

### Opció 3: Distribució per SCCM/MECM

```powershell
# Exemple de línia de comandes per SCCM
msiexec.exe /i "AMFE-Manager-Setup.msi" /qn /norestart
```

## 👥 Per a Usuaris Finals

### Instal·lació Manual

1. **Descarregar l'instal·lador** des de:
   - Servidor de fitxers: `\\servidor\aplicacions\AMFE-Manager\`
   - O enllaç proporcionat per IT

2. **Executar l'instal·lador**:
   - Doble clic a `AMFE-Manager-Setup-1.0.0.exe`
   - Seguir l'assistent d'instal·lació
   - Acceptar la ubicació per defecte: `C:\Program Files\AMFE Manager`

3. **Iniciar l'aplicació**:
   - Des del menú Inici: cercar "AMFE Manager"
   - O des de l'accés directe a l'escriptori

### Ubicacions Importants

- **Programa**: `C:\Program Files\AMFE Manager\`
- **Logs**: `%LOCALAPPDATA%\AMFE-Manager\logs\`
- **Dades d'usuari**: Els fitxers Excel es guarden on l'usuari triï

## 🔧 Manteniment i Actualitzacions

### Actualitzar a una Nova Versió

1. **Reconstruir l'instal·lador**:
   ```powershell
   # Des del directori del projecte
   .\build_installer_simple.ps1
   ```

2. **Distribuir la nova versió**:
   - L'instal·lador nou desinstal·larà la versió anterior automàticament
   - Les dades d'usuari es mantenen

### Desinstal·lació

**Manualment:**
- Panell de Control → Programes i característiques → AMFE Manager → Desinstal·lar

**Via script:**
```powershell
# Buscar i desinstal·lar
$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "AMFE Manager" }
if ($app) {
    $app.Uninstall()
}
```

## 🔐 Permisos i Seguretat

### Permisos Necessaris

- **Instal·lació**: Requereix permisos d'administrador
- **Execució**: No requereix permisos d'administrador
- **Logs**: Es guarden a `%LOCALAPPDATA%` (no requereix permisos especials)

### Política de Seguretat

- L'aplicació **NO** accedeix a Internet
- **NO** envia dades a servidors externs
- Tots els fitxers es processen localment
- Els logs contenen només informació de debug (no dades sensibles)

## 📊 Monitorització

### Verificar Instal·lació en Múltiples PCs

```powershell
# Script per verificar instal·lació en PCs de la xarxa
$computers = @("PC1", "PC2", "PC3")

foreach ($pc in $computers) {
    $app = Invoke-Command -ComputerName $pc -ScriptBlock {
        Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
        Where-Object { $_.DisplayName -like "*AMFE Manager*" } |
        Select-Object DisplayName, DisplayVersion, InstallDate
    }
    
    if ($app) {
        Write-Host "$pc : INSTAL·LAT - Versió $($app.DisplayVersion)" -ForegroundColor Green
    } else {
        Write-Host "$pc : NO INSTAL·LAT" -ForegroundColor Red
    }
}
```

### Logs Centralitzats (Opcional)

Si es vol recollir logs per suport tècnic:
```powershell
# Copiar logs d'un usuari
$userAppData = "\\PC-Usuario\C$\Users\NomUsuari\AppData\Local\AMFE-Manager\logs\"
Copy-Item $userAppData -Destination "\\servidor\suport\logs\$env:USERNAME\" -Recurse
```

## 🆘 Suport i Troubleshooting

### Problemes Comuns

1. **Error "Access Denied" en iniciar**:
   - Verificar que els logs es poden crear a `%LOCALAPPDATA%`
   - Solució: usuari ha de tenir permisos a la seva carpeta AppData

2. **L'aplicació no inicia**:
   - Comprovar logs a: `%LOCALAPPDATA%\AMFE-Manager\logs\`
   - Verificar que .NET Framework està instal·lat

3. **Error en obrir fitxers Excel**:
   - Verificar que l'usuari té permisos de lectura/escriptura a la ubicació del fitxer

### Recol·lecció d'Informació per Suport

```powershell
# Recopilar informació de debug
$info = @{
    "Versió Windows" = (Get-WmiObject Win32_OperatingSystem).Caption
    "Versió App" = (Get-ItemProperty "C:\Program Files\AMFE Manager\AMFE-Manager.exe").VersionInfo.FileVersion
    "Logs Existeixen" = Test-Path "$env:LOCALAPPDATA\AMFE-Manager\logs"
    "Últim Log" = Get-ChildItem "$env:LOCALAPPDATA\AMFE-Manager\logs" -File | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty Name
}
$info | Format-Table
```

## 📝 Checklist de Desplegament

- [ ] Provar l'instal·lador en un PC de test
- [ ] Verificar que l'aplicació inicia correctament
- [ ] Comprovar permisos d'escriptura a `%LOCALAPPDATA%`
- [ ] Provar funcionalitats bàsiques (obrir Excel, generar AMFE)
- [ ] Copiar instal·lador a ubicació compartida
- [ ] Notificar usuaris amb instruccions
- [ ] Documentar procediment de suport
- [ ] Establir canal de suport (email, ticket, etc.)

## 🔄 Procés de Construcció (per Desenvolupadors)

Si necessiteu reconstruir l'aplicació:

1. **Clonar el repositori**:
   ```bash
   git clone https://github.com/Blanqui04/AMFE.git
   cd AMFE
   ```

2. **Construir l'instal·lador**:
   ```powershell
   # Opció ràpida (només instal·lador)
   .\build_installer_simple.ps1
   
   # Opció completa (executable + instal·lador)
   .\build_executable_simple.ps1
   .\build_installer_simple.ps1
   ```

3. **Ubicació del resultat**:
   - `installer_output\AMFE-Manager-Setup-1.0.0.exe`

## 📞 Contacte

Per a suport tècnic o preguntes sobre el desplegament, contactar amb:
- **IT Help Desk**: [inserir contacte]
- **Desenvolupador**: [inserir contacte]
