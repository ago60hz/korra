# Korra

Type a word, or drop in a logo, and Korra turns it into a heavy 3D relic: carved rock, cast metal, glass or liquid. Export a transparent PNG or a looping video for Canva, websites, posters and video.

## How to use it

You don't install anything. Copy this link:

```
https://github.com/ago60hz/korra
```

Paste it into **Claude** or **Codex** and say what you want:

> Use this skill to make "RELIC" in bronze.

> Use this skill. I have a logo and I want it in chrome on a black background.

Your agent opens Korra in your browser and tells you which settings to use.

**Want it ready every time?** Paste the link and say: *"Install this skill for me."* After that you can just say "Open Korra" and skip the link.

## Make something in 7 steps

1. **Source.** Type a short word (one or two lines), or switch to **SVG or PNG** for a logo. Black becomes the form.
2. **Material.** Choose Rock, Metal, Glass or Liquid, then a finish (Sandstone, Chrome, Bronze, Mercury and more).
3. **Shape.** Bevel sets how rounded the edges are. Low looks cast, high looks puffy.
4. **Light.** Move the light direction and height until the edges catch.
5. **Scene.** White, Black, a colour, or **Upload design** to see it on your poster. Glass and liquid show what is behind them.
6. **Pose.** Drag to move, Shift-drag to turn, scroll to resize.
7. **Export.** **Export PNG** (transparent, 2K or 4K) for Canva and design tools, "With scene" for a finished image, or **Export video** for a looping clip.

Every control is explained in [`skills/korra/references/controls.md`](skills/korra/references/controls.md), with a few starting recipes.

## Good to know

- You need internet the first time it loads. Nothing you make leaves your computer.
- Use Chrome or Edge to export video. PNG export works in any browser.
- 4K export is slow on older computers. Try 2K first.

## No agent? Open it yourself

Download [`Korra.html`](skills/korra/Korra.html) and open it in Chrome. If it stays on "Loading the 3D engine…", ask Claude or Codex to open it for you.

## For agents

If a user gives you this repo's link:

1. Read `skills/korra/SKILL.md` and follow it. It says how to open and run Korra.
2. To use it once, get the repo (clone it, or download `https://github.com/ago60hz/korra/archive/refs/heads/main.tar.gz`) into a temporary folder and run `python3 skills/korra/scripts/serve.py` from it.
3. If the user asks to install it, run `sh install.sh` from the repo. It copies `skills/korra` into `~/.claude/skills/korra` and/or `~/.codex/skills/korra` for whichever you are. On Windows, copy that folder to the same place by hand. To remove it, delete that folder (or run `sh install.sh --uninstall --all`).
4. Tell the user to restart their agent after installing.

## What's in the repo

```
skills/korra/
  SKILL.md              what the agent reads
  Korra.html            the whole tool, one file
  scripts/serve.py      opens it on localhost
  references/controls.md
install.sh              optional: copies the skill into Claude Code / Codex
AGENTS.md               pointer for agents
```

## Licence

MIT. See [LICENSE](LICENSE).
