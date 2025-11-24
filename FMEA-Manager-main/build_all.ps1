# Script complet de construcció - AMFE-S Manager
# Automatitza tot el procés: executable + instal·lador

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AMFE-S-Manager" -ForegroundColor Cyan
Write-Host "  Build Complet i Automàtic" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$ErrorActionPreference = "Stop"

# Funció per mostrar errors
function Show-Error {
    param($message)
    Write-Host ""
    Write-Host "✗ ERROR: $message" -ForegroundColor Red
    Write-Host ""
    Write-Host "Premeu qualsevol tecla per sortir..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit 1
}

# Funció per mostrar èxit
function Show-Success {
    param($message)
    Write-Host "✓ $message" -ForegroundColor Green
}

# Pas 1: Construcció de l'executable
Write-Host "FASE 1/2: Construcció de l'executable" -ForegroundColor Yellow
Write-Host "--------------------------------------" -ForegroundColor Yellow
Write-Host ""

if (Test-Path "build_executable.ps1") {
    try {
        & ".\build_executable.ps1"
        if ($LASTEXITCODE -ne 0) {
            Show-Error "La construcció de l'executable ha fallat"
        }
    } catch {
        Show-Error "Error executant build_executable.ps1: $_"
    }
} else {
    Show-Error "No s'ha trobat build_executable.ps1"
}

Write-Host ""
Write-Host "Esperant uns segons abans de continuar..." -ForegroundColor DarkYellow
Start-Sleep -Seconds 3
Write-Host ""

# Pas 2: Creació de l'instal·lador
Write-Host "FASE 2/2: Creació de l'instal·lador" -ForegroundColor Yellow
Write-Host "------------------------------------" -ForegroundColor Yellow
Write-Host ""

if (Test-Path "build_installer.ps1") {
    try {
        & ".\build_installer.ps1"
        if ($LASTEXITCODE -ne 0) {
            Show-Error "La creació de l'instal·lador ha fallat"
        }
    } catch {
        Show-Error "Error executant build_installer.ps1: $_"
    }
} else {
    Show-Error "No s'ha trobat build_installer.ps1"
}

# Resum final
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  ✓✓ BUILD COMPLET FINALITZAT ✓✓" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Mostrar fitxers generats
Write-Host "FITXERS GENERATS:" -ForegroundColor Cyan
Write-Host ""

if (Test-Path "dist\AMFE-Manager\AMFE-Manager.exe") {
    $exeSize = [math]::Round((Get-Item "dist\AMFE-Manager\AMFE-Manager.exe").Length / 1MB, 2)
    Write-Host "  📦 Executable:" -ForegroundColor Yellow
    Write-Host "     dist\AMFE-Manager\AMFE-Manager.exe" -ForegroundColor White
    Write-Host "     Mida: $exeSize MB" -ForegroundColor DarkGray
    Write-Host ""
}

if (Test-Path "installer_output") {
    $installers = Get-ChildItem "installer_output\*.exe" -ErrorAction SilentlyContinue
    if ($installers) {
        Write-Host "  💿 Instal·lador(s):" -ForegroundColor Yellow
        foreach ($installer in $installers) {
            $installerSize = [math]::Round($installer.Length / 1MB, 2)
            Write-Host "     $($installer.FullName)" -ForegroundColor White
            Write-Host "     Mida: $installerSize MB" -ForegroundColor DarkGray
        }
        Write-Host ""
    }
}

Write-Host "SEGÜENTS PASSOS:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. 🧪 Testa l'instal·lador en un PC net" -ForegroundColor White
Write-Host "  2. 📋 Verifica que tot funciona correctament" -ForegroundColor White
Write-Host "  3. 📤 Distribueix l'instal·lador als usuaris" -ForegroundColor White
Write-Host ""

Write-Host "DOCUMENTACIÓ:" -ForegroundColor Cyan
Write-Host "  • Manual d'usuari: docs\MANUAL_USUARI.md" -ForegroundColor White
Write-Host "  • Guia de distribució: docs\GUIA_DISTRIBUCIO.md" -ForegroundColor White
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Premeu qualsevol tecla per sortir..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
