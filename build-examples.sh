#!/bin/bash
if [ ! -d env ] ; then
  python -m venv env
fi

source env/bin/activate

pip install -r requirements.txt

python scripts/bdf2ufo.py -v --designer "Stefan Schmidt" --designer-url "https://github.com/Gissio/font_tiny5" --manufacturer "Stefan Schmidt Art" --manufacturer-url "https://www.stefanschmidtart.com/" --license "This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: https://openfontlicense.org" --license-url "https://openfontlicense.org" --strikeout-position 2 --strikeout-thickness 1 --underline-position -2 --underline-thickness 1 --notdef-codepoint 0x0 --axes ESIZ,ROND,BLED --instance ",ESIZ=1,ROND=0,BLED=0" --instance "LCD,ESIZ=0.85,ROND=0,BLED=0" --instance "CRT,ESIZ=0.7,ROND=0.8,BLED=0.6" --instance "DotMatrix,ESIZ=0.85,ROND=0.8,BLED=0" sources/Tiny5/Tiny5-Regular.bdf build
gftools builder build/config.yaml

python scripts/bdf2ufo.py -v --designer "Stefan Schmidt" --designer-url "https://github.com/Gissio/font_tiny5" --manufacturer "Stefan Schmidt Art" --manufacturer-url "https://www.stefanschmidtart.com/" --license "This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: https://openfontlicense.org" --license-url "https://openfontlicense.org" --strikeout-position 2 --strikeout-thickness 1 --underline-position -2 --underline-thickness 1 --notdef-codepoint 0x0 --axes ESIZ,ROND,BLED --instance ",ESIZ=1,ROND=0,BLED=0" --instance "LCD,ESIZ=0.85,ROND=0,BLED=0" --instance "CRT,ESIZ=0.7,ROND=0.8,BLED=0.6" --instance "DotMatrix,ESIZ=0.85,ROND=0.8,BLED=0" sources/Tiny5/Tiny5-Bold.bdf build
gftools builder build/config.yaml

python scripts/bdf2ufo.py -v --notdef-codepoint 0xf100 --axes ESIZ,ROND,BLED --instance ",ESIZ=0.85,ROND=0.8,BLED=0.6" sources/Codeman38/PressStart2P-Regular.bdf build
gftools builder build/config.yaml

python scripts/bdf2ufo.py -v --notdef-codepoint 0x0 --axes ESPX,ESPY --instance ",ESPY=0.5" --location "ROND=1" sources/DavidePiscitelli/Tecnica-55.bdf build
gftools builder build/config.yaml

python scripts/bdf2ufo.py -v --notdef-codepoint 0x0 --axes ESPX,ESPY --instance ",ESPY=0.5" --location "ROND=1" sources/DavidePiscitelli/Tecnica-53.bdf build
gftools builder build/config.yaml
