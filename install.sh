#!/bin/sh
# Install the Korra skill for Claude Code and/or Codex.
#
#   curl -fsSL https://raw.githubusercontent.com/ago60hz/korra/main/install.sh | sh
#   ./install.sh                # installs for whichever of Claude Code / Codex you have
#   ./install.sh --claude       # Claude Code only
#   ./install.sh --codex        # Codex only
#   ./install.sh --all          # both, even if one isn't detected yet
#   ./install.sh --uninstall    # remove it again
set -eu

REPO="ago60hz/korra"
BRANCH="main"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}/skills"

want_claude=0; want_codex=0; uninstall=0; explicit=0
for a in "$@"; do
  case "$a" in
    --claude) want_claude=1; explicit=1 ;;
    --codex) want_codex=1; explicit=1 ;;
    --all) want_claude=1; want_codex=1; explicit=1 ;;
    --uninstall) uninstall=1 ;;
    -h|--help) sed -n '2,10p' "$0"; exit 0 ;;
    *) echo "Unknown option: $a" >&2; exit 1 ;;
  esac
done

if [ "$explicit" = 0 ]; then
  [ -d "$(dirname "$CLAUDE_DIR")" ] && want_claude=1
  [ -d "$(dirname "$CODEX_DIR")" ] && want_codex=1
  if [ "$want_claude" = 0 ] && [ "$want_codex" = 0 ]; then
    echo "Couldn't find Claude Code or Codex, installing for Claude Code. Use --codex or --all to choose."
    want_claude=1
  fi
fi

if [ "$uninstall" = 1 ]; then
  [ "$want_claude" = 1 ] && rm -rf "$CLAUDE_DIR/korra" && echo "Removed $CLAUDE_DIR/korra"
  [ "$want_codex" = 1 ] && rm -rf "$CODEX_DIR/korra" && echo "Removed $CODEX_DIR/korra"
  exit 0
fi

# Use the local copy if this script sits inside a clone, otherwise download the repo.
here="$(cd "$(dirname "$0")" 2>/dev/null && pwd || true)"
tmp=""
if [ -n "$here" ] && [ -f "$here/skills/korra/SKILL.md" ]; then
  src="$here/skills/korra"
else
  command -v curl >/dev/null || { echo "curl is required." >&2; exit 1; }
  tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
  echo "Downloading Korra..."
  curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" | tar -xz -C "$tmp"
  src="$(echo "$tmp"/*/skills/korra)"
fi

install_to() {
  mkdir -p "$1"
  rm -rf "$1/korra"
  cp -R "$src" "$1/korra"
  echo "Installed to $1/korra"
}
[ "$want_claude" = 1 ] && install_to "$CLAUDE_DIR"
[ "$want_codex" = 1 ] && install_to "$CODEX_DIR"

echo
echo 'Done. Restart your agent, then ask it: "Open Korra and make my logo in bronze."'
