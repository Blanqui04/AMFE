# Script de Neteja del Repositori
# Elimina fitxers innecessaris per a la distribució

Write-Host "Netejant fitxers innecessaris del repositori..." -ForegroundColor Cyan

# Directoris a eliminar
$dirsToRemove = @(
    "build",
    "dist", 
    "installer_output",
    "venv",
    ".venv",
    "__pycache__",
    "*.egg-info",
    ".pytest_cache",
    ".mypy_cache"
)

# Fitxers a eliminar
$filesToRemove = @(
    "*.pyc",
    "*.pyo",
    "*.log",
    ".DS_Store",
    "Thumbs.db",
    "desktop.ini"
)

# Eliminar directoris
foreach ($dir in $dirsToRemove) {
    if ($dir -like "*\**") {
        # Patr ó amb wildcards
        Get-ChildItem -Path . -Directory -Recurse -Include ($dir -replace '.*\\','') -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force
    } else {
        if (Test-Path $dir) {
            Write-Host "[ELIMINANT] $dir" -ForegroundColor Yellow
            Remove-Item $dir -Recurse -Force
        }
    }
}

# Eliminar fitxers
foreach ($file in $filesToRemove) {
    Get-ChildItem -Path . -File -Recurse -Include $file -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Host "[ELIMINANT] $($_.FullName)" -ForegroundColor Yellow
        Remove-Item $_.FullName -Force
    }
}

# Neteja de logs locals (si existeixen)
if (Test-Path "logs") {
    Write-Host "[ELIMINANT] logs/" -ForegroundColor Yellow
    Remove-Item "logs" -Recurse -Force
}

Write-Host ""
Write-Host "[OK] Neteja completada!" -ForegroundColor Green
Write-Host "El repositori està net i llest per a commit/push" -ForegroundColor Green
