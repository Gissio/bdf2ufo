![Project logo](docs/img/bdf2ufo_logo.png) 

# bdf2ufo

Converts .bdf pixel fonts to .ufo static and variable vector fonts.

## Features

* Automatically creates static and variable fonts.
* Supports five variable axes for controlling the pixels: element size (ESIZ), roundness (ROND), bleed (BLED), horizontal element spacing (XESP) and element jitter (EJIT). These allow to mimic the visual characteristics of LCD screens, CRT monitors and dot matrix printouts.
* Composes pixels from glyphs, reducing font size.
* Automatically decomposes glyphs, reducing font size.
* Automatically adds base-to-mark anchors.

## Examples

* Check out [Tiny5](https://github.com/Gissio/font_tiny5)!

## Building a font

1. If your source font is in .ttf or .otf vector format, convert it first to the .bdf pixel format. You can use the `otf2bdf` converter available at http://sofia.nmsu.edu/~mleisher/Software/otf2bdf/. Under macOS, install with [Homebrew](https://brew.sh/). Under Ubuntu, install with this command: `sudo apt install otf2bdf`.
2. Make sure [Python](https://www.python.org/) and [pip](https://pip.pypa.io/en/stable/installation/) are installed.
3. Install the bdf2ufo requirements: `pip install -r requirements.txt`
4. Create an empty folder for storing the .ufo masters.
5. Run bdf2ufo with the appropriate options. For usage help, try:

        python tools/bdf2ufo.py --help

6. Compile the .ufo files:

        gftools builder [masters-path]/[family-name]-config.yaml

## Tips

* Use the --verbose parameter to get extended info of the conversion.
* Use `--glyph-offset-x` to center the glyphs. Fractional values are allowed.
* The EJIT (element jitter) value specifies the jitter's variance in element units (uses a gaussian distribution function). Good values are around 0.05.
* To compile a static font, do not use `--variable-axis` nor `--variable-instance`; specify the axes' values with `--static-axes`.
* Undefined combining characters (0x300-0x36f) are automatically copied from other similar defined characters.
* For now, anchor marks are assigned at the center, bottom point of the combining glyphs.

## Additional resources

* [Bits'N'Picas](https://github.com/kreativekorp/bitsnpicas): bitmap font editor
* [FontDrop!](https://fontdrop.info/): online glyph viewer
* [Oh My Glyph](https://www.ohmyglyph.com/): online glyph copy+paste
