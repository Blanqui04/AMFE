# Script PowerShell per executar AMFE-S Manager des del codi font
# Per a desenvolupadors / testing

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AMFE-S Manager - Launcher" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verifica si Python està disponible
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Python no trobat!" -ForegroundColor Red
    Write-Host "Si us plau, instal·la Python 3.8+ des de https://www.python.org/" -ForegroundColor Yellow
    pause
    exit 1
}

# Crea entorn virtual si no existeix
if (-not (Test-Path "venv")) {
    Write-Host ""
    Write-Host "Creant entorn virtual..." -ForegroundColor Yellow
    python -m venv venv
    Write-Host "✓ Entorn virtual creat" -ForegroundColor Green
}

# Activa entorn virtual
Write-Host "Activant entorn virtual..." -ForegroundColor Yellow
& ".\venv\Scripts\Activate.ps1"

# Instal·la/actualitza dependències
Write-Host "Verificant dependències..." -ForegroundColor Yellow
pip install -q -r requirements.txt
Write-Host "✓ Dependències verificades" -ForegroundColor Green

# Executa l'aplicació
Write-Host ""
Write-Host "Iniciant AMFE-S Manager..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

python amfe_ui.py

# Captura errors
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "ERROR: L'aplicació ha tingut un error" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    pause
}
