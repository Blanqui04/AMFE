# Script de construccio - AMFE-S Manager
# Genera l'executable de l'aplicacio

# Canviar al directori de l'script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AMFE-S-Manager - Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Directori de treball: $scriptPath" -ForegroundColor Cyan
Write-Host ""

# Comprova si Python esta installat
Write-Host "Verificant installacio de Python..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version 2>&1
    Write-Host "[OK] Python trobat: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Python no trobat. Si us plau, installa Python 3.8 o superior." -ForegroundColor Red
    pause
    exit 1
}

# Crear entorn virtual si no existeix
if (-not (Test-Path "venv")) {
    Write-Host ""
    Write-Host "Creant entorn virtual..." -ForegroundColor Yellow
    python -m venv venv
    Write-Host "[OK] Entorn virtual creat" -ForegroundColor Green
}

# Activar entorn virtual
Write-Host ""
Write-Host "Activant entorn virtual..." -ForegroundColor Yellow
& ".\venv\Scripts\Activate.ps1"
Write-Host "[OK] Entorn virtual activat" -ForegroundColor Green

# Installar dependencies
Write-Host ""
Write-Host "Installant dependencies..." -ForegroundColor Yellow
pip install --upgrade pip
pip install -r requirements.txt
pip install pyinstaller
Write-Host "[OK] Dependencies installades" -ForegroundColor Green

# Compilar traduccions
Write-Host ""
Write-Host "Compilant traduccions..." -ForegroundColor Yellow
if (Test-Path "i18n") {
    pybabel compile -d i18n
    Write-Host "[OK] Traduccions compilades" -ForegroundColor Green
} else {
    Write-Host "[WARN] Carpeta i18n no trobada" -ForegroundColor DarkYellow
}

# Netejar builds anteriors
Write-Host ""
Write-Host "Netejant builds anteriors..." -ForegroundColor Yellow
if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
if (Test-Path "dist") { Remove-Item -Recurse -Force "dist" }
Write-Host "[OK] Neteja completada" -ForegroundColor Green

# Construir executable
Write-Host ""
Write-Host "Construint executable amb PyInstaller..." -ForegroundColor Yellow
Write-Host "Aixo pot trigar uns minuts..." -ForegroundColor DarkYellow
pyinstaller amfe_manager.spec

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  BUILD COMPLETAT AMB EXIT!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "L'executable es troba a: dist\AMFE-Manager\" -ForegroundColor Cyan
    Write-Host "Executable: dist\AMFE-Manager\AMFE-Manager.exe" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Seguent pas: Executar build_installer.ps1 per crear l'installador" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "[ERROR] Error durant la construccio" -ForegroundColor Red
    pause
    exit 1
}

Write-Host ""
pause
