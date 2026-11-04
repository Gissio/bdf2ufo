# Releases

## 1.8

- Every nonspacing or enclosing mark (Unicode category Mn or Me) is now in the GDEF mark glyph class, not only the marks with attachment anchors. U+0336, U+0340, U+0341, U+FE0E and U+FE0F were missing, which Fontspector reported as a `mark-chars` warning.
- When the `JITT` axis is enabled (variable, or with a non-zero default), `OS/2.usWinAscent` and `usWinDescent` now leave room for the largest jitter offset, so jittered elements are no longer clipped on Windows (Fontspector's `ascent` and `descent` failures). The offset of an element is limited to `MAX_JITTER_OFFSET` (one element), which the metrics add. Builds without `JITT` keep the metrics of the bitmap bounding box.
- In Turkish, Azerbaijani, Crimean Tatar, Gagauz and Tatar (`SMALL_CAPS_DOTTED_I_LANGUAGES`), `smcp` turns `i` into the dotted small cap of `İ`, taken from `c2sc`. The language systems are declared for all features, so `ccmp` and `c2sc` keep working in them. This fixes Shaperglot's "Small caps i should be dotted" warning.
- The bilabial click `ʘ` (U+0298), a lowercase letter without a capital, now has a `.sc` copy for `smcp`, as Shaperglot's "Small caps for Latin letters" check expects. Letters in `SMALL_CAPS_LOWERCASE` take part in small caps even without a capital.
- Glyphs whose elements overlap in at least one master (heavier weights, bleed, jitter) are marked with `public.truetype.overlap` in the default master, so the compiled `glyf` table has the overlap bit set. Rasterizers that fill with the non-zero rule, such as Apple's, then render the overlaps correctly. This fixes Fontspector's `no-overlaps-bit` warning. The default master is saved last, after all masters were checked.

## 1.7

- Added Latin and Cyrillic small caps (`smcp`, `c2sc`), taken from `.sc` glyphs, Unicode small capitals and lowercase letters drawn as small capitals (such as Cyrillic `в`, `к`, `т` or Latin `ø`, `ŋ`, `ə`). A script's lookup is only generated when its whole basic alphabet has small caps.
- Accented small caps are composed from their base small cap and the accents of the letter. Each accent attaches to the anchors that `custom_anchors` gives the small cap, so it sits on the small cap as on a lowercase letter. An accented small cap whose base lacks the anchor of an accent is not built.
- bdf2ufo warns about each small cap that lacks a base anchor (`top`, `bottom`, `ogonek`, `horn`) that its capital has.
- Added support for unencoded glyphs (`ENCODING -1`), which keep their BDF glyph name. `custom_anchors` can be keyed by glyph name.
- Added `-v` (`--verbose`); by default, only warnings and errors are printed.
- `ď`, `ľ`, `Ľ`, `ť` and `ģ` now decompose with combining commas (U+0313, U+0312) instead of modifier letters.
- Greek symbol letters (`ϐ ϑ ϕ ϖ`…) are no longer decomposed.
- Custom anchors for a glyph that is not in the font fail with an error message instead of a traceback.
- The monospace check ignores zero-width format characters.
- Fixed the default superscript and subscript offsets, which also shifted them sideways.

## 1.6

- Added the `axis_maps` build configuration option, which maps user coordinates to design coordinates on any variable axis. The maps are written as `<map>` elements into the `.designspace` file and compile to an `avar` table. All axis values of the configuration (`default_axis_values`, `variable_axes` and `variable_instances`) are user coordinates, and the masters are built at the mapped design coordinates. For example, mapping `wght` 700 to 580 and 900 to 700 makes **Bold** lighter and moves the previous heaviest weight to **Black**.
- Set `usWeightClass` and `usWidthClass` of the masters and instances from their user space location.
- Checked that default axis values and instance locations lie within the range of their variable axis.

## 1.5.3

- Fixed empty pixel rows and columns in fonts rendered with hinting (Windows). When building with gftools builder, set `flattenComponents: false` in the config, or the fix is lost in static fonts.

## 1.5.2

- Adjusted default italic angle to 12 degrees.

## 1.5.1

- Added monospace verification and metrics.
- Fixed diacritic placement in precomposed glyphs.
- Fixed duplicate overlapping pixels in composed glyphs.
- Fixed the OS/2 WWS bit in the font metadata.

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
