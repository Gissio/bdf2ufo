![Project logo](docs/img/bdf2ufo_logo.png) 

# bdf2ufo

Converts .bdf pixel fonts to .ufo static and variable vector fonts, which can then be converted to .ttf and .otf fonts.

## Features

* Static and variable font support.
* Variable font controls for pixel size, roundness and bleed control, simulating the appearance of LCD screens, CRT monitors and dot matrix printouts.
* Automatic glyph composition, reducing font size.
* Automatic glyph anchoring.

## Building a font

1. If your source font is in .ttf or .otf vector format, convert it first to the .bdf pixel format. You can use the `otf2bdf` converter available at http://sofia.nmsu.edu/~mleisher/Software/otf2bdf/. Under macOS, install with [Homebrew](https://brew.sh/). Under Ubuntu, install with this command: `sudo apt install otf2bdf`.
2. Install [Python](https://www.python.org/) and [pip](https://pip.pypa.io/en/stable/installation/). 
3. Install bdf2ufo requirements: `pip install -r requirements.txt`
4. Create a .ufo designspace folder.
5. Run bdf2ufo with the appropriate options. To get usage help, type:

    python bdf2ufo.py --help

6. Compile the .ufo designspace:

    gftools builder config.yaml

## Additional resources

* [Bits'N'Picas](https://github.com/kreativekorp/bitsnpicas): bitmap font editor
* [FontDrop!](https://fontdrop.info/): online glyph viewer
* [Oh My Glyph](https://www.ohmyglyph.com/): online glyph copy+paste