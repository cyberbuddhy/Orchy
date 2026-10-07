# AGENTS.md — Orchy

This repo ships the Orchy AI council (Planner → Builder → Critic).

- opencode (native, strictest): `.opencode/agents/council-*.md` + `.opencode/commands/orchy.md`. Run `/orchy <task>`.
- Claude Code (twin): `.claude/agents/orchy-*.md` + `.claude/commands/orchy.md`. Run `/orchy <task>`.
- Any other AI: follow `skills/orchy/SKILL.md`, or paste `prompts/orchy.md` into the chat.

Workflow everywhere: PLAN (read-only, ask up to 3 questions, output plan, STOP) → BUILD (implement approved plan verbatim + verify) → REVIEW (`APPROVE` or `REQUEST CHANGES`, max 1 fix loop). Always end with goal, files changed, verification results, and critic verdict.

## Installing Orchy (for AI agents)

If the user asks you to install Orchy into their project, do exactly this. Do not improvise paths.

1. Find the Orchy source: the repo you are reading right now (contains `.opencode/`, `.claude/`, `install.sh`). Call it `$ORCHY`.
2. Detect the target platform:
   - opencode project → target dir is the project root (`$DEST/.opencode/`)
   - opencode global → `$HOME/.config/opencode/`
   - Claude Code project → `$DEST/.claude/`
   - Claude Code global → `$HOME/.claude/`
3. Copy (never move) the files:
   - opencode: `$ORCHY/.opencode/agents/council-*.md` → `<target>/agents/`, `$ORCHY/.opencode/commands/orchy.md` → `<target>/commands/`
   - Claude: `$ORCHY/.claude/agents/orchy-*.md` → `<target>/agents/`, `$ORCHY/.claude/commands/orchy.md` → `<target>/commands/`
   - Or run: `bash $ORCHY/install.sh <project|global|claude-project|claude-global|all-project|all-global>`
4. Verify with `ls <target>/agents <target>/commands` (or `glob`). You must see `orchy*` files on both sides.
5. Tell the user to restart their AI session — config loads at startup, no hot-reload.
6. Never commit secrets, never alter file contents during install, never install into unrelated directories.
