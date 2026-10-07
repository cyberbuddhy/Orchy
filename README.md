# Orchy 🤖

Three AI roles that plan before coding, then review the result. Better output than a single pass.

🔍 Plan → 🔨 Build → 🧐 Review

## ❓ What it does

1. **Plan** — asks up to 3 questions if your request is unclear, reads your code, writes a short plan. No code yet.
2. **Build** — implements only that plan, runs checks (tests/build).
3. **Review** — checks the result against the plan. Verdict: `APPROVE` or `REQUEST CHANGES` (1 fix retry max).

Every run ends with: goal, files changed, verification, verdict.

## 📦 Install

**opencode**
```bash
./install.sh          # this project → ./.opencode
./install.sh global   # all projects → ~/.config/opencode
```

**Claude Code**
```bash
./install.sh claude-project  # this project → ./.claude
./install.sh claude-global   # all projects → ~/.claude
```

**Any other AI** — no install. Paste `prompts/orchy.md` into the chat, or point it at `skills/orchy/SKILL.md`.

> Restart your AI session after installing.

## ▶️ Use

```text
/orchy "add GitHub login with tests"
```

That's it. Answer its questions if it asks, approve the plan, get reviewed code.

## 📁 Files

- `.opencode/` — native opencode setup
- `.claude/` — Claude Code setup
- `skills/orchy/SKILL.md` — portable core
- `prompts/orchy.md` — pasteable version
- `install.sh` — installer
