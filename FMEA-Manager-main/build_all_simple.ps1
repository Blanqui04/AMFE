# Script per construir executable i installer
# Versio simplificada sense caracters especials

$ErrorActionPreference = "Stop"
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  BUILD COMPLET: EXECUTABLE + INSTALLER" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Pas 1: Construir executable
Write-Host "[1/2] Construint executable..." -ForegroundColor Yellow
& .\build_executable_simple.ps1
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Error construint l'executable!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "[OK] Executable creat correctament!" -ForegroundColor Green
Write-Host ""

# Pas 2: Construir installer
Write-Host "[2/2] Construint installer..." -ForegroundColor Yellow
& .\build_installer_simple.ps1
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Error construint l'installer!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  BUILD COMPLET FINALITZAT!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Fitxers generats:" -ForegroundColor Cyan
Write-Host "  - dist\AMFE-Manager\AMFE-Manager.exe"
Write-Host "  - installer_output\AMFE-Manager-Setup-1.0.0.exe"
Write-Host ""
