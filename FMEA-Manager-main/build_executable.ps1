# Script de construcció per Windows
# Genera l'executable de l'aplicació AMFE-S-Manager

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AMFE-S-Manager - Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Comprova si Python està instal·lat
Write-Host "Verificant instal·lació de Python..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python trobat: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Python no trobat. Si us plau, instal·la Python 3.8 o superior." -ForegroundColor Red
    exit 1
}

# Crear entorn virtual si no existeix
if (-not (Test-Path "venv")) {
    Write-Host ""
    Write-Host "Creant entorn virtual..." -ForegroundColor Yellow
    python -m venv venv
    Write-Host "✓ Entorn virtual creat" -ForegroundColor Green
}

# Activar entorn virtual
Write-Host ""
Write-Host "Activant entorn virtual..." -ForegroundColor Yellow
& ".\venv\Scripts\Activate.ps1"
Write-Host "✓ Entorn virtual activat" -ForegroundColor Green

# Instal·lar dependències
Write-Host ""
Write-Host "Instal·lant dependències..." -ForegroundColor Yellow
pip install --upgrade pip
pip install -r requirements.txt
pip install pyinstaller
Write-Host "✓ Dependències instal·lades" -ForegroundColor Green

# Compilar traduccions
Write-Host ""
Write-Host "Compilant traduccions..." -ForegroundColor Yellow
if (Test-Path "i18n") {
    pybabel compile -d i18n
    Write-Host "✓ Traduccions compilades" -ForegroundColor Green
} else {
    Write-Host "⚠ Carpeta i18n no trobada, saltant compilació de traduccions" -ForegroundColor DarkYellow
}

# Netejar builds anteriors
Write-Host ""
Write-Host "Netejant builds anteriors..." -ForegroundColor Yellow
if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
if (Test-Path "dist") { Remove-Item -Recurse -Force "dist" }
Write-Host "✓ Neteja completada" -ForegroundColor Green

# Construir executable
Write-Host ""
Write-Host "Construint executable amb PyInstaller..." -ForegroundColor Yellow
Write-Host "Això pot trigar uns minuts..." -ForegroundColor DarkYellow
pyinstaller amfe_manager.spec

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✓ BUILD COMPLETAT AMB ÈXIT!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "L'executable es troba a: dist\AMFE-Manager\" -ForegroundColor Cyan
    Write-Host "Executable: dist\AMFE-Manager\AMFE-Manager.exe" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Següent pas: Executar build_installer.ps1 per crear l'instal·lador" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "✗ Error durant la construcció" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Premeu qualsevol tecla per continuar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
