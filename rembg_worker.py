#!/usr/bin/env python3
"""Worker script for rembg background removal. Called by the GIMP plugin.

Usage: rembg_worker.py <input.png> <output.png> [model]
"""

import sys
import os


def main():
    if len(sys.argv) < 3:
        print("Usage: rembg_worker.py <input> <output> [model]", file=sys.stderr)
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    model = sys.argv[3] if len(sys.argv) > 3 else "u2net"

    if not os.path.exists(input_file):
        print(f"Input not found: {input_file}", file=sys.stderr)
        sys.exit(1)

    try:
        from rembg import remove, new_session
        from PIL import Image
    except ImportError as e:
        print(f"Import error: {e}", file=sys.stderr)
        sys.exit(2)

    try:
        session = new_session(model)
        img = Image.open(input_file).convert("RGBA")
        result = remove(img, session=session)
        result.save(output_file)
        print("OK")
    except Exception as e:
        print(f"Processing error: {e}", file=sys.stderr)
        sys.exit(3)


if __name__ == "__main__":
    main()
