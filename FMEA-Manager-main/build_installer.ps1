# Script per crear l'instal·lador Windows
# Requereix Inno Setup: https://jrsoftware.org/isinfo.php

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AMFE-S-Manager - Installer Builder" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar que existeix l'executable
if (-not (Test-Path "dist\AMFE-Manager\AMFE-Manager.exe")) {
    Write-Host "✗ No s'ha trobat l'executable!" -ForegroundColor Red
    Write-Host "Si us plau, executa primer build_executable.ps1" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Premeu qualsevol tecla per sortir..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit 1
}

# Buscar Inno Setup
$innoSetupPaths = @(
    "${env:ProgramFiles(x86)}\Inno Setup 6\ISCC.exe",
    "${env:ProgramFiles}\Inno Setup 6\ISCC.exe",
    "${env:ProgramFiles(x86)}\Inno Setup 5\ISCC.exe",
    "${env:ProgramFiles}\Inno Setup 5\ISCC.exe"
)

$isccPath = $null
foreach ($path in $innoSetupPaths) {
    if (Test-Path $path) {
        $isccPath = $path
        break
    }
}

if (-not $isccPath) {
    Write-Host "✗ Inno Setup no està instal·lat!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Si us plau, descarrega i instal·la Inno Setup des de:" -ForegroundColor Yellow
    Write-Host "https://jrsoftware.org/isdl.php" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Premeu qualsevol tecla per obrir la pàgina de descàrrega..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Start-Process "https://jrsoftware.org/isdl.php"
    exit 1
}

Write-Host "✓ Inno Setup trobat: $isccPath" -ForegroundColor Green

# Crear carpeta de sortida
if (-not (Test-Path "installer_output")) {
    New-Item -ItemType Directory -Path "installer_output" | Out-Null
}

# Compilar l'instal·lador
Write-Host ""
Write-Host "Creant instal·lador..." -ForegroundColor Yellow
Write-Host "Això pot trigar uns minuts..." -ForegroundColor DarkYellow
Write-Host ""

& $isccPath "installer_setup.iss"

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✓ INSTAL·LADOR CREAT AMB ÈXIT!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    
    $installerFiles = Get-ChildItem "installer_output\*.exe"
    if ($installerFiles) {
        Write-Host "Instal·lador disponible a:" -ForegroundColor Cyan
        foreach ($file in $installerFiles) {
            Write-Host "  • $($file.FullName)" -ForegroundColor Cyan
            $sizeInMB = [math]::Round($file.Length / 1MB, 2)
            Write-Host "    Mida: $sizeInMB MB" -ForegroundColor DarkCyan
        }
        Write-Host ""
        Write-Host "Ja pots distribuir aquest instal·lador als usuaris finals!" -ForegroundColor Green
    }
} else {
    Write-Host ""
    Write-Host "✗ Error durant la creació de l'instal·lador" -ForegroundColor Red
}

Write-Host ""
Write-Host "Premeu qualsevol tecla per continuar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
