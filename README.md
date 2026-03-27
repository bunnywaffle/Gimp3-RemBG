# GIMP Rembg Plugin

AI background removal for GIMP 3.0+ using [rembg](https://github.com/danielgatis/rembg).

## Features

- Remove backgrounds with one click using AI
- 10 AI models for different use cases (people, art, objects, etc.)
- Two modes: Destructive (permanent) and Non-destructive (layer mask)
- Fully self-contained - installs into plugin folder, nothing touches system Python
- Cross-platform (Windows, macOS, Linux)

## Install

1. Download or clone this repo
2. Copy the `gimp_rembg` folder to your GIMP plugins directory:

   | OS | Path |
   |----|------|
   | Windows | `%APPDATA%\GIMP\3.2\plug-ins\` |
   | macOS | `~/Library/Application Support/GIMP/3.2/plug-ins/` |
   | Linux | `~/.config/GIMP/3.2/plug-ins/` |

3. Install dependencies (pick one):
   - **Windows:** Run `install_deps.bat` inside the plugin folder
   - **macOS/Linux:** Run `./install_deps.sh` inside the plugin folder
   - **Or in GIMP:** `Rembg > Setup...`

4. Restart GIMP

## Usage

1. Open an image, select a layer
2. Click **Rembg > Remove Background (Destructive)...** or **Rembg > Remove Background (Mask)...**
3. Select an AI model from the dropdown
4. Click **Run**

## Models

| Label | Best for |
|-------|----------|
| General | Works for most images |
| People | Portraits and selfies |
| Clothing | Fashion and apparel |
| Objects | Products and items |
| Art | Anime and illustrations |
| Silhouette | Clean object outlines |
| Complex | Busy backgrounds |
| Detailed | Fine edges and hair |
| High-res | Large detailed images |
| Hidden | Blended or camouflaged |

## Uninstall

Delete the `gimp_rembg` folder from your plugins directory.

## How It Works

The plugin uses a Python virtual environment (`venv/`) inside the plugin folder. The GIMP plugin (`gimp_rembg.py`) communicates with a worker script (`rembg_worker.py`) via subprocess - GIMP's own Python stays untouched.

## License

MIT
