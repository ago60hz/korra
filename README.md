# Korra

Type a word, or drop in a logo, and Korra casts it as a heavy 3D relic: carved rock, cast metal, glass or liquid. Export a transparent PNG or a seamless looping video for Canva, websites, posters and video.

It is one HTML file and an agent skill, so Claude or Codex can open it for you and tell you which settings to use. Or just open the HTML yourself.

## Install in 30 seconds

Pick **one**.

### A. One line (Mac, Linux, Windows)

Mac / Linux. Installs for Claude Code and/or Codex, whichever you have:

```bash
curl -fsSL https://raw.githubusercontent.com/ago60hz/korra/main/install.sh | sh
```

Windows (PowerShell):

```powershell
irm https://raw.githubusercontent.com/ago60hz/korra/main/install.ps1 | iex
```

Then restart your agent.

### B. Inside your agent

**Claude Code**

```
/plugin marketplace add ago60hz/korra
/plugin install korra@korra
```

**Codex**: type this in a Codex session:

```
$skill-installer install https://github.com/ago60hz/korra/tree/main/skills/korra
```

### C. Any other agent (Cursor, Gemini CLI, and so on)

```bash
npx skills add ago60hz/korra
```

### D. By hand

Download this repo, then copy the `skills/korra` folder to:

| Agent | Folder |
| --- | --- |
| Claude Code | `~/.claude/skills/korra` |
| Codex | `~/.codex/skills/korra` |

No agent at all? Skip the install and open [`skills/korra/Korra.html`](skills/korra/Korra.html) in your browser.

## Use it

Ask your agent in plain words:

> Open Korra and make my logo in bronze, then tell me how to export it for Canva.
>
> Make "RELIC" look like carved sandstone.
>
> I need a chrome wordmark on a black background, 4K.

The agent starts Korra on your machine, opens your browser, and walks you through the settings. To launch it yourself:

```bash
python3 skills/korra/scripts/serve.py      # Windows: py skills/korra/scripts/serve.py
```

## Quick tutorial

1. **Source.** Type a short word (one or two lines), or switch to **SVG or PNG** for a logo. Black becomes the form.
2. **Material.** Choose Rock, Metal, Glass or Liquid, then a finish swatch (Sandstone, Chrome, Bronze, Mercury and more).
3. **Shape.** Bevel sets how rounded the edges are. Low looks cast, high looks puffy.
4. **Light.** Move the light direction and height until the edges catch.
5. **Scene.** White, Black, a colour, or **Upload design** to test on your poster. Glass and liquid refract what is behind them.
6. **Pose.** Drag to move, Shift-drag to turn, scroll to resize.
7. **Export.** Transparent PNG (2K or 4K) for design tools, "With scene" for a finished image, or **Export video** for a seamless loop.

Every control is covered in [`skills/korra/references/controls.md`](skills/korra/references/controls.md), with a few starting recipes.

## Good to know

- Needs internet on first load (Three.js and Google Fonts load from a CDN). Nothing you make leaves your machine.
- Use Chrome or Edge for video export. PNG export works in any browser.
- 4K export is heavy on older GPUs. Preview at 2K first.

## Update or remove

Run the same install command again to update. To remove:

```bash
curl -fsSL https://raw.githubusercontent.com/ago60hz/korra/main/install.sh | sh -s -- --uninstall --all
```

## What's in the repo

```
skills/korra/
  SKILL.md              what the agent reads
  Korra.html            the whole tool, one file
  scripts/serve.py      opens it on localhost
  references/controls.md
install.sh / install.ps1
.claude-plugin/         Claude Code plugin and marketplace
AGENTS.md               pointer for other agents
```

## Licence

MIT. See [LICENSE](LICENSE).
