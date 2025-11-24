# 🚀 Script per Preparar GitHub Release

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Preparació de GitHub Release" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Llegeix la versió actual
$setupContent = Get-Content "setup.py" -Raw
if ($setupContent -match 'version="([^"]+)"') {
    $version = $matches[1]
    Write-Host "✓ Versió detectada: $version" -ForegroundColor Green
} else {
    Write-Host "✗ No s'ha pogut detectar la versió" -ForegroundColor Red
    exit 1
}

# Verifica que existeix l'instal·lador
$installerName = "AMFE-Manager-Setup-$version.exe"
$installerPath = "installer_output\$installerName"

if (-not (Test-Path $installerPath)) {
    Write-Host "✗ Instal·lador no trobat: $installerPath" -ForegroundColor Red
    Write-Host ""
    Write-Host "Executa primer build_all.ps1 per crear l'instal·lador" -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ Instal·lador trobat: $installerName" -ForegroundColor Green

# Calcula el checksum SHA256
Write-Host ""
Write-Host "Calculant checksum SHA256..." -ForegroundColor Yellow
$hash = Get-FileHash -Path $installerPath -Algorithm SHA256
$sha256 = $hash.Hash
Write-Host "✓ SHA256: $sha256" -ForegroundColor Green

# Mida del fitxer
$sizeInMB = [math]::Round((Get-Item $installerPath).Length / 1MB, 2)
Write-Host "✓ Mida: $sizeInMB MB" -ForegroundColor Green

# Verifica que el codi està committejat
Write-Host ""
Write-Host "Verificant estat del repositori Git..." -ForegroundColor Yellow

try {
    $gitStatus = git status --porcelain
    if ($gitStatus) {
        Write-Host "⚠ Hi ha canvis sense commitejar:" -ForegroundColor DarkYellow
        Write-Host $gitStatus -ForegroundColor Gray
        Write-Host ""
        $response = Read-Host "Vols continuar igualment? (s/n)"
        if ($response -ne "s") {
            Write-Host "Operació cancel·lada" -ForegroundColor Yellow
            exit 0
        }
    } else {
        Write-Host "✓ Repositori net, tot committejat" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠ No s'ha pogut verificar l'estat de Git" -ForegroundColor DarkYellow
}

# Crea el fitxer de notes del release
Write-Host ""
Write-Host "Creant notes del release..." -ForegroundColor Yellow

$releaseNotes = @"
# 🎉 AMFE-S Manager v$version

Primera versió oficial del gestor professional d'anàlisis AMFE (P-FMEA).

## 📥 Descàrrega i Instal·lació

### Per a Usuaris Finals

**Descarrega l'instal·lador:**
- 💿 **$installerName** ($sizeInMB MB)

**Instal·lació:**
1. Descarrega el fitxer
2. Fes doble clic sobre l'instal·lador
3. Segueix les instruccions a pantalla
4. Obre l'aplicació des del menú d'inici

**NO cal instal·lar Python ni cap dependència!**

📖 **[Manual d'Usuari](docs/MANUAL_USUARI.md)**

---

## ✨ Característiques Principals

- 📊 **Escaneig automàtic** de processos AMFE
- 📈 **Anàlisi de riscos** abans i després d'accions
- 🎨 **Gràfics professionals** de distribució de riscos
- 💾 **Exportació automàtica** de resultats
- 🌍 **Multiidioma:** Català, Anglès, Polonès
- 🖥️ **Interfície gràfica** intuïtiva amb PyQt5

---

## 📋 Requisits del Sistema

- **Sistema Operatiu:** Windows 10 o superior (64-bit)
- **Memòria RAM:** 4 GB (8 GB recomanat)
- **Espai en disc:** 500 MB lliures
- **Resolució:** 1280x720 o superior

---

## 📚 Documentació

- 📘 [Manual d'Usuari](docs/MANUAL_USUARI.md) - Guia completa en català
- 📗 [Guia de Distribució](docs/GUIA_DISTRIBUCIO.md) - Per desenvolupadors
- 🚀 [Quickstart](QUICKSTART.md) - Inici ràpid

---

## 🆕 Novetats d'aquesta versió

Vegeu el [CHANGELOG.md](CHANGELOG.md) per detalls complets.

---

## 🔐 Verificació

**SHA256 Checksum:**
``````
$sha256
``````

Per verificar la integritat del fitxer descarregat:
``````powershell
Get-FileHash -Path "$installerName" -Algorithm SHA256
``````

---

## 🐛 Reportar Problemes

Si trobes algun error, si us plau [obre un issue](https://github.com/Blanqui04/AMFE/issues).

---

## ⚖️ Llicència

Aquest projecte està llicenciat sota MIT License - consulta [LICENSE](LICENSE) per detalls.

---

**Data de publicació:** $(Get-Date -Format "dd/MM/yyyy")  
**Versió:** $version  
**Checksum SHA256:** Veure secció Verificació
"@

$releaseNotesPath = "installer_output\RELEASE_NOTES_v$version.md"
$releaseNotes | Out-File -FilePath $releaseNotesPath -Encoding UTF8

Write-Host "✓ Notes del release creades: $releaseNotesPath" -ForegroundColor Green

# Resum
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  ✓ PREPARACIÓ COMPLETADA" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "FITXERS PREPARATS PER AL RELEASE:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. Instal·lador:" -ForegroundColor Yellow
Write-Host "     $installerPath" -ForegroundColor White
Write-Host "     Mida: $sizeInMB MB" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  2. Notes del Release:" -ForegroundColor Yellow
Write-Host "     $releaseNotesPath" -ForegroundColor White
Write-Host ""
Write-Host "INFORMACIÓ DEL RELEASE:" -ForegroundColor Cyan
Write-Host "  • Versió: v$version" -ForegroundColor White
Write-Host "  • Tag: v$version" -ForegroundColor White
Write-Host "  • SHA256: $sha256" -ForegroundColor DarkGray
Write-Host ""
Write-Host "SEGÜENTS PASSOS:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. 🌐 Ves a GitHub:" -ForegroundColor White
Write-Host "     https://github.com/Blanqui04/AMFE/releases/new" -ForegroundColor Cyan
Write-Host ""
Write-Host "  2. 🏷️ Crea el tag:" -ForegroundColor White
Write-Host "     Tag version: v$version" -ForegroundColor Gray
Write-Host "     Target: main" -ForegroundColor Gray
Write-Host ""
Write-Host "  3. 📝 Títol del release:" -ForegroundColor White
Write-Host "     AMFE-S Manager v$version - Primera Versió" -ForegroundColor Gray
Write-Host ""
Write-Host "  4. 📄 Copia les notes del release:" -ForegroundColor White
Write-Host "     Des de: $releaseNotesPath" -ForegroundColor Gray
Write-Host ""
Write-Host "  5. 📦 Puja l'instal·lador:" -ForegroundColor White
Write-Host "     Arrossega: $installerPath" -ForegroundColor Gray
Write-Host ""
Write-Host "  6. ✅ Marca 'Set as the latest release'" -ForegroundColor White
Write-Host ""
Write-Host "  7. 🚀 Publica el release!" -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Premeu qualsevol tecla per obrir GitHub Releases..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Start-Process "https://github.com/Blanqui04/AMFE/releases/new"

Write-Host ""
Write-Host "✓ Pàgina de GitHub Releases oberta al navegador" -ForegroundColor Green
Write-Host ""
