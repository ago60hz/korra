---
name: korra
description: Turn a word, logo or SVG/PNG into a lit 3D relic (carved rock, cast metal, glass or liquid) and export it as a transparent PNG or a seamless looping MP4 for Canva, websites, posters and video. Use when the user asks for 3D text, a stone/chrome/bronze/glass/liquid logo or lettering, a "relic", a material render of a word or logo, or mentions Korra.
---

# Korra — material forge

Korra is a single-file browser tool (`Korra.html`, bundled next to this file). It turns flat text or a black-and-white shape into a heavy, lit 3D piece and exports it as an asset. There is no build step and nothing to install.

## 1. Open it

Run the launcher from this skill's folder. It serves `Korra.html` on localhost and opens the user's browser:

```bash
python3 scripts/serve.py          # Windows: py scripts/serve.py
```

- It prints the URL (for example `http://127.0.0.1:5231/`). Tell the user the URL in case the browser did not open.
- It keeps running until stopped. Run it in the background if your shell tool supports that, and stop it when the user is done.
- Add `--no-open` to only print the URL.
- No Python? Tell the user to open `Korra.html` directly in their browser (double-click). If the page stays on "Loading the 3D engine…", they need the localhost launcher instead (install Python, or run any static server in this folder).
- Needs internet on first load (Three.js and Google Fonts come from a CDN).
- Use Chrome or Edge for MP4 video export. PNG export works in any browser.

## 2. Help the user get the look

Korra is a visual, interactive tool, so do not claim to have rendered anything unless you drove the page yourself with a browser tool. Otherwise, give the user exact settings to try. Ask what they want it for (Canva, a site hero, a poster, a video), then recommend:

1. **Source**: short words look best (one to two lines, 40 characters max). For a logo, choose "SVG or PNG" (black = form, white = empty).
2. **Material**: Rock, Metal, Glass or Liquid, then a Finish swatch.
3. **Shape**: Bevel and Thickness decide whether it reads as carved stone or an inflated balloon. Heavy and cast usually means low-to-mid Bevel, mid Thickness.
4. **Light**: direction, height, strength and colour temperature.
5. **Export**: Transparent PNG for design tools, "With scene" for a finished image, Export video for a seamless loop.

Read `references/controls.md` for every control, the finishes, good starting recipes and the export options.

## 3. Tips worth passing on

- Realism comes from imperfection: add a little Edge wear (rock), or Wear, Corrosion and Dust (metal).
- Glass and Liquid refract what is behind them, so test them over the user's own design (Scene > Upload design).
- Dark finishes (Basalt, Gunmetal, Ink) want a light background. Bright chrome wants a darker one or a photo.
- 4K export is slow on weak GPUs. Preview at 2K first.
- If the page shows "Korra couldn't start", the browser lacks WebGL or the CDN is blocked. Try Chrome, or check the connection.

## Files

- `Korra.html`: the whole tool.
- `scripts/serve.py`: local launcher.
- `references/controls.md`: controls, finishes and recipes.
