@echo off
REM GIMP Rembg - Install Dependencies
REM Creates an isolated venv inside this folder with rembg installed

echo ============================================
echo  GIMP Rembg - Install Dependencies
echo ============================================
echo.

REM Check Python
python --version >nul 2>&1
if errorlevel 1 (
    python3 --version >nul 2>&1
    if errorlevel 1 (
        echo ERROR: Python not found!
        echo Install Python 3.8+ from https://python.org
        pause
        exit /b 1
    )
    set PYTHON=python3
) else (
    set PYTHON=python
)

echo Using: %PYTHON%
echo.

REM Remove old venv
if exist venv (
    echo Removing old venv...
    rmdir /s /q venv
)

REM Create venv
echo Creating isolated environment...
%PYTHON% -m venv venv
if errorlevel 1 (
    echo ERROR: Failed to create venv
    pause
    exit /b 1
)

REM Install deps
echo Installing rembg and dependencies...
venv\Scripts\pip.exe install --upgrade pip
venv\Scripts\pip.exe install pillow onnxruntime rembg
if errorlevel 1 (
    echo ERROR: pip install failed
    pause
    exit /b 1
)

REM Verify
echo.
echo Verifying...
venv\Scripts\python.exe -c "import rembg; print('rembg', rembg.__version__, 'OK')"

echo.
echo ============================================
echo  Done! Restart GIMP.
echo  Then: Filters > Remove Background (AI)...
echo ============================================
pause
