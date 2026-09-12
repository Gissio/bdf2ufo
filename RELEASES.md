# Releases

## 1.5

- Added monospace font support.

## 1.4

- Replaced the **Slant*- (`slnt`) axis with an **Italic*- (`ital`) axis. The slant angle is now set with the new `italic_angle` build configuration option, which defaults to 8 degrees.
- Fixed the name records of the generated `.designspace` instances. Weight names and **Italic*- now stay in the style name and every other style name component moves to the family name, following the Google Fonts naming scheme, so gftools builder writes correct nameID 1, 2, 4, 6, 16 and 17 records. Italic instances were previously named "Family Italic Regular", and instances such as **Medium*- shared their nameID 1 and 2 records with **Regular**.
- Set the `italicAngle` of the masters from the `ital` axis, so italic instances get a correct `post` italic angle and `hhea` caret slope.
- Set `usWeightClass` and `usWidthClass` from the design space location of each master instead of from the style name of the source `.bdf` font.
- Named the masters after their design space location.
- Fixed the version string of fonts whose `FONT_VERSION` property starts with "Version ".

## 1.3.1

- Added Armenian support.

## 1.3

- Improved element drawing: the width (wdth) axis now scales elements appropriately.
- Improved master generation.

## 1.2.1

- Fixed combining marks drifting horizontally when using the width (wdth) axis.

## 1.2

- Added use_glyph_element option.

## 1.1

- Code factorization
- Renamed ESIZ to Weight axis.
- Renamed EJIT to JITT axis.
- Added Width and Slant axes.

## 1.0.2

- Fixed versionMajor, versionMinor.

## 1.0.1

- Added horizontal and vertical element spacing (ESPX, ESPY)
- Refactorized code.
- Minor fixes.

## 1.0.0

First release.
