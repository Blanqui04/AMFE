# Script per crear l'installador Windows amb Inno Setup

# Canviar al directori de l'script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AMFE-S-Manager - Installer Builder" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar que existeix l'executable
if (-not (Test-Path "dist\AMFE-Manager\AMFE-Manager.exe")) {
    Write-Host "[ERROR] No s'ha trobat l'executable!" -ForegroundColor Red
    Write-Host "Si us plau, executa primer build_executable_simple.ps1" -ForegroundColor Yellow
    Write-Host ""
    pause
    exit 1
}

Write-Host "[OK] Executable trobat" -ForegroundColor Green

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
    Write-Host "[ERROR] Inno Setup no esta installat!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Si us plau, descarrega i installa Inno Setup des de:" -ForegroundColor Yellow
    Write-Host "https://jrsoftware.org/isdl.php" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Premeu qualsevol tecla per obrir la pagina de descarrega..."
    pause
    Start-Process "https://jrsoftware.org/isdl.php"
    exit 1
}

Write-Host "[OK] Inno Setup trobat: $isccPath" -ForegroundColor Green

# Crear carpeta de sortida
if (-not (Test-Path "installer_output")) {
    New-Item -ItemType Directory -Path "installer_output" | Out-Null
}

# Compilar l'installador
Write-Host ""
Write-Host "Creant installador..." -ForegroundColor Yellow
Write-Host "Aixo pot trigar uns minuts..." -ForegroundColor DarkYellow
Write-Host ""

& $isccPath "installer_setup.iss"

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  INSTALLADOR CREAT AMB EXIT!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    
    $installerFiles = Get-ChildItem "installer_output\*.exe"
    if ($installerFiles) {
        Write-Host "Installador disponible a:" -ForegroundColor Cyan
        foreach ($file in $installerFiles) {
            Write-Host "  - $($file.FullName)" -ForegroundColor Cyan
            $sizeInMB = [math]::Round($file.Length / 1MB, 2)
            Write-Host "    Mida: $sizeInMB MB" -ForegroundColor DarkCyan
        }
        Write-Host ""
        Write-Host "Ja pots distribuir aquest installador als usuaris finals!" -ForegroundColor Green
    }
} else {
    Write-Host ""
    Write-Host "[ERROR] Error durant la creacio de l'installador" -ForegroundColor Red
}

Write-Host ""
pause
