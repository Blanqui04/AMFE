@echo off
REM Script per executar AMFE-S Manager des del codi font
REM Per a desenvolupadors / testing

echo ========================================
echo   AMFE-S Manager - Launcher
echo ========================================
echo.

REM Verifica si existeix l'entorn virtual
if not exist "venv\" (
    echo Entorn virtual no trobat. Creant...
    python -m venv venv
    if errorlevel 1 (
        echo ERROR: No s'ha pogut crear l'entorn virtual
        pause
        exit /b 1
    )
    echo Entorn virtual creat!
)

REM Activa l'entorn virtual
echo Activant entorn virtual...
call venv\Scripts\activate.bat

REM Instal·la/actualitza dependències
echo Verificant dependències...
pip install -q -r requirements.txt

REM Executa l'aplicació
echo.
echo Iniciant AMFE-S Manager...
echo ========================================
echo.
python amfe_ui.py

REM Si hi ha error
if errorlevel 1 (
    echo.
    echo ========================================
    echo ERROR: L'aplicació ha tingut un error
    echo ========================================
    pause
)
