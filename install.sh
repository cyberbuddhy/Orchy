#!/usr/bin/env bash
set -euo pipefail
# Installs Orchy for opencode and/or Claude Code.
# Usage: ./install.sh [project|global|claude-project|claude-global|all-project|all-global]
MODE="${1:-project}"
SRC="$(cd "$(dirname "$0")" && pwd)"

install_opencode_project() {
  mkdir -p "$PWD/.opencode/agents" "$PWD/.opencode/commands"
  cp "$SRC/.opencode/agents/council-"*.md "$PWD/.opencode/agents/"
  cp "$SRC/.opencode/commands/orchy.md" "$PWD/.opencode/commands/"
  echo "opencode: installed in $PWD/.opencode. Restart opencode."
}

install_opencode_global() {
  mkdir -p "$HOME/.config/opencode/agents" "$HOME/.config/opencode/commands"
  cp "$SRC/.opencode/agents/council-"*.md "$HOME/.config/opencode/agents/"
  cp "$SRC/.opencode/commands/orchy.md" "$HOME/.config/opencode/commands/"
  echo "opencode: installed in $HOME/.config/opencode. Restart opencode."
}

install_claude_project() {
  mkdir -p "$PWD/.claude/agents" "$PWD/.claude/commands"
  cp "$SRC/.claude/agents/orchy-"*.md "$PWD/.claude/agents/"
  cp "$SRC/.claude/commands/orchy.md" "$PWD/.claude/commands/"
  echo "Claude Code: installed in $PWD/.claude. Restart session."
}

install_claude_global() {
  mkdir -p "$HOME/.claude/agents" "$HOME/.claude/commands"
  cp "$SRC/.claude/agents/orchy-"*.md "$HOME/.claude/agents/"
  cp "$SRC/.claude/commands/orchy.md" "$HOME/.claude/commands/"
  echo "Claude Code: installed in $HOME/.claude. Restart session."
}

case "$MODE" in
  project) install_opencode_project ;;
  global) install_opencode_global ;;
  claude-project) install_claude_project ;;
  claude-global) install_claude_global ;;
  all-project) install_opencode_project; install_claude_project ;;
  all-global) install_opencode_global; install_claude_global ;;
  *) echo "Usage: $0 [project|global|claude-project|claude-global|all-project|all-global]" >&2; exit 1 ;;
esac
