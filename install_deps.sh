#!/bin/bash
# GIMP Rembg - Install Dependencies
# Creates an isolated venv inside this folder with rembg installed

set -e

echo "============================================"
echo " GIMP Rembg - Install Dependencies"
echo "============================================"
echo ""

# Find Python
PYTHON=""
for cmd in python3 python; do
    if command -v $cmd &> /dev/null; then
        PYTHON=$cmd
        break
    fi
done

if [ -z "$PYTHON" ]; then
    echo "ERROR: Python not found!"
    echo "Install Python 3.8+ first."
    exit 1
fi

echo "Using: $PYTHON"
echo ""

# Remove old venv
if [ -d venv ]; then
    echo "Removing old venv..."
    rm -rf venv
fi

# Create venv
echo "Creating isolated environment..."
$PYTHON -m venv venv

# Install deps
echo "Installing rembg and dependencies..."
venv/bin/pip install --upgrade pip
venv/bin/pip install pillow onnxruntime rembg

# Verify
echo ""
echo "Verifying..."
venv/bin/python -c "import rembg; print('rembg', rembg.__version__, 'OK')"

echo ""
echo "============================================"
echo " Done! Restart GIMP."
echo " Then: Filters > Remove Background (AI)..."
echo "============================================"
