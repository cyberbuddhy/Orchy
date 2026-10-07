#!/usr/bin/env bash
set -euo pipefail
# Instala el council en modo proyecto (./.opencode) o global (~/.config/opencode)
MODE="${1:-project}"
SRC="$(cd "$(dirname "$0")" && pwd)"

if [ "$MODE" = "global" ]; then
  DEST="$HOME/.config/opencode"
  mkdir -p "$DEST/agents" "$DEST/commands"
  cp "$SRC/.opencode/agents/council-"*.md "$DEST/agents/"
  cp "$SRC/.opencode/commands/council.md" "$DEST/commands/"
  echo "Instalado en $DEST. Reinicia opencode."
else
  DEST="$PWD"
  mkdir -p "$DEST/.opencode/agents" "$DEST/.opencode/commands"
  cp "$SRC/.opencode/agents/council-"*.md "$DEST/.opencode/agents/"
  cp "$SRC/.opencode/commands/council.md" "$DEST/.opencode/commands/"
  echo "Instalado en $DEST/.opencode. Reinicia opencode."
fi
