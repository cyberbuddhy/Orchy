#!/usr/bin/env bash
set -euo pipefail
# Installs Orchy in project mode (./.opencode) or global (~/.config/opencode)
MODE="${1:-project}"
SRC="$(cd "$(dirname "$0")" && pwd)"

if [ "$MODE" = "global" ]; then
  DEST="$HOME/.config/opencode"
  mkdir -p "$DEST/agents" "$DEST/commands"
  cp "$SRC/.opencode/agents/council-"*.md "$DEST/agents/"
  cp "$SRC/.opencode/commands/orchy.md" "$DEST/commands/"
  echo "Installed in $DEST. Restart opencode."
else
  DEST="$PWD"
  mkdir -p "$DEST/.opencode/agents" "$DEST/.opencode/commands"
  cp "$SRC/.opencode/agents/council-"*.md "$DEST/.opencode/agents/"
  cp "$SRC/.opencode/commands/orchy.md" "$DEST/.opencode/commands/"
  echo "Installed in $DEST/.opencode. Restart opencode."
fi
