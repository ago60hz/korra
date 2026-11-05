# Korra controls

Everything lives in the right-hand panel. Drag on the preview to move the piece, Shift-drag to turn it, scroll to resize, arrow keys nudge. Drop an image on the preview to test the piece on your design.

## Source

| Control | Notes |
| --- | --- |
| Text | Up to 40 characters, Enter for a second line. Short words look best. |
| Font | Searchable list. Bundled: Fraunces, Cinzel Decorative, Playfair Display, Archivo Black, Bagel Fat One, UnifrakturMaguntia, Georgia. Chromium browsers also list installed fonts after a permission prompt. Heavy faces carve best. |
| Tracking / Leading | Letter spacing and line spacing. Leading only matters with two lines. |
| SVG or PNG | Reduced to black and white: black becomes the form. Use Threshold for what counts as black, Clean up to remove specks, Invert to swap form and space. Solid logos work best; thin hairlines get lost. |

## Material and finish

| Material | Finishes | Extra sliders |
| --- | --- | --- |
| Rock | Sandstone, Limestone, Basalt, Terracotta | Surface detail, Edge wear |
| Metal | Chrome, Silver, Ancient silver, Bronze (verdigris), Gunmetal | Wear, Corrosion, Dust |
| Glass | Clear, Frosted, Smoke, Bottle green, Amber | none beyond Roughness |
| Liquid | Mercury, Water, Honey, Ink | Melt, Flow |

All materials have Roughness. "Studio reflections on metal" (Light section) adds a studio environment so metal has something to reflect; leave it on unless the scene photo should do the lighting.

## Shape

- **Bevel**: how rounded the edges are. Low is crisp and cast, high is puffy.
- **Thickness**: depth of the slab.

## Light

Light direction, height, strength, colour (2000K warm to 9000K cool), Rim light, and Light from scene (how much an uploaded design lights the piece).

## Scene, frame, placement

- **Background**: White, Black, a custom colour, or Upload design (your poster or a photo).
- **Cast shadow on backdrop**: grounds the piece on the background.
- **Frame**: Fit window, 1:1, 4:5, 9:16, 16:9, or Design (the uploaded image's ratio). Sets the shape of scene PNG and video exports.
- **Placement**: Size, drag mode (Move/Turn), "Centre the piece".

## Motion

Pause/resume the slow turn. Turn (sway degrees), Tilt, Loop length (2 to 12 s). Video exports exactly one seamless loop of this motion.

## Export

| Option | Result |
| --- | --- |
| Transparent + 2K or 4K | PNG trimmed to the piece, long side = 2048 or 4096 px. Best for Canva, Figma and websites. |
| With scene + 2K or 4K | PNG of the piece on the chosen background, at the chosen Frame ratio. |
| Export video | Seamless MP4 loop (H.264, 30 fps) from the current motion settings. Needs a Chromium browser. Falls back to WebM where MP4 encoding is unavailable. |

## Starting recipes

- **Sandstone relic**: Rock, Sandstone, Fraunces, Bevel high (about 60%), Edge wear 30%, light direction around -48°, height about 26°, White background.
- **Heavy chrome**: Metal, Chrome, Archivo Black, Bevel low to mid, Thickness about 45%, Studio reflections on, Dust 10 to 15%.
- **Old bronze**: Metal, Bronze, Cinzel Decorative, Corrosion 50%, Wear 65%.
- **Glass over a poster**: Glass, Clear or Smoke, Upload design as the background, Frame set to Design.
- **Mercury drip**: Liquid, Mercury, Melt about 35%, Flow about 40%, Black background.
