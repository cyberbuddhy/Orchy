# <img src="assets/orchy.png" width="60" alt="Orchy"> Orchy

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

🤖 AI installing this for the user? Follow `AGENTS.md` exactly.

## ▶️ Use

```text
/orchy make a website for a potato farmer
```

That's it. Answer its questions if it asks, approve the plan, get reviewed code.

### 🥔 Example: Earl's Spuds

Prompt:

```text
/orchy make a website for a potato farmer
```

Result: [`examples/potato-farmer/`](examples/potato-farmer/) — a one-page site for **Earl Thompson**, 63, third-generation Idaho farmer who ate a raw Russet at age six and never looked back. He names one potato per harvest (this year's is Kevin; Kevin has a shelf). Includes his story, the season lineup, and a working order form. Open `index.html` in a browser.

## 📁 Files

- `.opencode/` — native opencode setup
- `.claude/` — Claude Code setup
- `skills/orchy/SKILL.md` — portable core
- `prompts/orchy.md` — pasteable version
- `install.sh` — installer
- `assets/orchy.png` — orca logo
- `examples/potato-farmer/` — demo site built the Orchy way
