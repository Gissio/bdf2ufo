#!/bin/bash
if [ ! -d env ] ; then
  python -m venv env
  source env/bin/activate
  pip install -r requirements.txt
else
  source env/bin/activate
fi

# "Press Start 2P": variable fonts with static font instances examples
python scripts/bdf2ufo.py -v --designer 'Cody "CodeMan38" Boisclair' --designer-url 'https://github.com/codeman38/PressStart2P' --manufacturer CodeMan38 --manufacturer-url 'https://github.com/codeman38' --license 'This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: https://openfontlicense.org' --license-url 'https://openfontlicense.org' --strikeout-position 4 --strikeout-thickness 1 --underline-position 0 --underline-thickness 1 --notdef-codepoint 0xf100 --glyph-offset-x 0.5 --variable-axes ESIZ,ROND,BLED --variable-instance ,ESIZ=0.7,ROND=0.8,BLED=0.64 sources/Codeman38/PressStart2P-Regular.bdf build
gftools builder build/PressStart2P-Regular-config.yaml

# "Tecnica-53" and "Tecnica-55": variable fonts without static font instances examples
COMMON=('-v' '--designer' 'Davide Piscitelli' '--designer-url' 'https://www.behance.net/gallery/212230891/Tecnica-Typeface-Free-Font' '--manufacturer' 'Davide Piscitelli' '--manufacturer-url' 'https://davidepiscitelli.framer.ai/' '--license' 'This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: https://openfontlicense.org' '--license-url' 'https://openfontlicense.org' '--strikeout-position' '3' '--strikeout-thickness' '1' '--underline-position' '-1' '--underline-thickness' '1' '--notdef-codepoint' '0x0' '--axes-limits' 'XESP=0.5-0.83' '--glyph-offset-x' '0.5')

COMMON_VARIABLE=("${COMMON[@]}" '--variable-axes' 'ESIZ,XESP' --variable-instance ',ESIZ=0.67,XESP=0.67' '--static-axes' 'ROND=1')

python scripts/bdf2ufo.py "${COMMON_VARIABLE[@]}" sources/DavidePiscitelli/Tecnica-55.bdf build
gftools builder build/Tecnica-55-Regular-config.yaml

python scripts/bdf2ufo.py "${COMMON_VARIABLE[@]}" sources/DavidePiscitelli/Tecnica-53.bdf build
gftools builder build/Tecnica-53-Regular-config.yaml

# "Tecnica-53" and "Tecnica-55": static font instances examples
COMMON_VARIABLE=("${COMMON[@]}" '--static-axes' 'ESIZ=0.67,ROND=1,XESP=0.67,EJIT=0.05')

python scripts/bdf2ufo.py "${COMMON_VARIABLE[@]}" --style-name "Jitter Regular" sources/DavidePiscitelli/Tecnica-55.bdf build
gftools builder build/Tecnica-55-JitterRegular-config.yaml

python scripts/bdf2ufo.py "${COMMON_VARIABLE[@]}" --style-name "Jitter Regular" sources/DavidePiscitelli/Tecnica-53.bdf build
gftools builder build/Tecnica-53-JitterRegular-config.yaml
