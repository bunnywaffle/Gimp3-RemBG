@echo off
REM install_deps.bat — Install rembg into the plugin's venv
REM Run this if you prefer the terminal over Rembg > Setup... in GIMP.

set SCRIPT_DIR=%~dp0
set VENV_DIR=%SCRIPT_DIR%venv

echo === GIMP Rembg Setup ===

REM Check Python
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python not found. Install it from https://python.org
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version') do set PYVER=%%i
echo Using: python (%PYVER%)

REM Remove old venv
if exist "%VENV_DIR%" (
    echo Removing old venv...
    rmdir /s /q "%VENV_DIR%"
)

REM Create venv
echo Creating venv...
python -m venv "%VENV_DIR%"

REM Install
echo Upgrading pip...
"%VENV_DIR%\Scripts\pip.exe" install --upgrade pip

echo Installing rembg (this may take a few minutes)...
"%VENV_DIR%\Scripts\pip.exe" install pillow onnxruntime rembg

REM Verify
echo Verifying...
"%VENV_DIR%\Scripts\python.exe" -c "import rembg; print(f'rembg {rembg.__version__} installed!')"

echo.
echo Done! Restart GIMP and use Rembg ^> Remove Background...
pause
