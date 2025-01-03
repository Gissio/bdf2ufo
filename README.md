![Project logo](docs/img/bdf2ufo_logo.png) 

# bdf2ufo

Converts `.bdf` pixel fonts to `.ufo` static and variable vector fonts.

## Features

* **Automated Font Generation**: Creates both static and variable fonts.
* **Variable Axes Support**: Includes five axes for pixel manipulation:
  * **Element size (ESIZ)**
  * **Roundness (ROND)**
  * **Bleed (BLED)**
  * **horizontal element spacing (XESP)**
  * **Element Jitter (EJIT)**
  
  These allow you to simulate the visual characteristics of LCD screens, CRT monitors and dot matrix printouts.

* **Glyph Composition**: Reduces font size by composing pixels from a pixel glyph.
* **Glyph Decomposition**: Automatically decomposes composed characters for further size reduction.
* **Anchor Creation**: Adds base-to-mark anchors automatically.

## Examples

* Check out **[Tiny5](https://github.com/Gissio/font_tiny5)**!

## Building a font

1. **Convert Source Font**
   - If your font is in `.ttf` or `.otf`, first convert to `.bdf`. Use `otf2bdf`:
     - macOS: Install via [Homebrew](https://brew.sh/): `brew install otf2bdf`
     - Ubuntu: `sudo apt install otf2bdf`
     - Windows: Download from [here](http://sofia.nmsu.edu/~mleisher/Software/otf2bdf/)

2. **Setup Environment**:
   - Ensure [Python](https://www.python.org/) and [pip](https://pip.pypa.io/en/stable/installation/) are installed.

3. **Install Dependencies**:
   - Run `pip install -r requirements.txt`

4. **Prepare Directory**:
   - Create an empty folder to hold your `.ufo` master files.

5. **Run bdf2ufo**:
   - For usage help, execute:

        python tools/bdf2ufo.py --help

6. **Compile .ufo files**:
   - Use `gftools`:

        gftools builder [masters-path]/[family-name]-config.yaml

## Tips

- **Verbose Output**: Use `--verbose` for detailed conversion logs.
- **Glyph Alignment**: Use `--glyph-offset-x` for precise glyph centering; supports fractional values.
- **Jitter Effect**: Set `EJIT` around 0.05 for a subtle jitter using a Gaussian distribution.
- **Static Fonts**: Omit `--variable-axis` and `--variable-instance`; use `--static-axes` to define axis values.
- **Combining Characters**: Undefined characters (U+0300 to U+036F) are auto-copied from similar defined glyphs.
- **Anchor Positioning**: Currently, anchors are placed at the glyph's center-bottom.

## Additional Resources

- **[Bits'N'Picas](https://github.com/kreativekorp/bitsnpicas)**: A bitmap font editor.
- **[FontDrop!](https://fontdrop.info/)**: An online glyph viewer.
- **[Oh My Glyph](https://www.ohmyglyph.com/)**: Copy and paste glyphs online.
