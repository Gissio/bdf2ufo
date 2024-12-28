#!/bin/bash
# python.exe tools/bdf2ufo.py --designer "Stefan Schmidt" --designer-url "https://github.com/Gissio/font_tiny5" --manufacturer "Stefan Schmidt Art" --manufacturer-url "https://www.stefanschmidtart.com/" --license "This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: https://openfontlicense.org" --license-url "https://openfontlicense.org" --strikeout-position 2 --strikeout-thickness 1 --underline-position -1 --underline-thickness 1 fonts/Tiny5/Tiny5-Regular.bdf build
gftools.exe builder build/config.yaml
