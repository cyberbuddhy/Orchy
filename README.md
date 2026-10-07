# Orchy — AI council (Planner → Builder → Critic)

Orchy is a 3-role AI council that handles prompts better than any single agent. Instead of jumping straight to code, it plans first, builds exactly what was planned, then reviews the diff before you see it.

**Pipeline:** Planner → Builder → Critic, coordinated by an orchestrator.

Works natively in **opencode** (strictest, with real permission isolation) and **Claude Code** (twin), plus any other AI via the portable skill or a pasteable prompt.

## What is it?

- **council-orchestrator** (primary agent, switch with Tab) — delegates and synthesizes. It does minimal direct work: it calls Planner, then Builder with the approved plan, then Critic with plan + build summary.
- **council-planner** (read-only) — clarifies vague prompts (up to 3 questions), explores the real codebase, and outputs a minimal actionable plan with acceptance criteria. Never writes code.
- **council-builder** — implements the plan task by task, runs checks (typecheck / tests / build), stays in scope, and reports what changed + how it was verified.
- **council-critic** (read-only) — reviews correctness, bugs, security, and scope drift against the plan with file:line evidence. Verdict is exactly `APPROVE` or `REQUEST CHANGES`. Max 1 fix-and-re-review loop without asking you.
- **`/orchy` command** — runs the whole pipeline on your request and always ends with: goal, files changed, verification results, and critic verdict.

## How to use it

### opencode — per project (recommended)

The `.opencode/` folder in this repo is already portable:

```bash
git clone https://github.com/cyberbuddhy/Orchy.git my-project
cd my-project
opencode
```

Inside opencode:

```text
/orchy "add GitHub login with tests"
# or: press Tab → council-orchestrator
```

Or install Orchy into an existing project:

```bash
/path/to/Orchy/install.sh
# installs into ./.opencode, then restart opencode
```

### opencode — global (all projects)

```bash
/path/to/Orchy/install.sh global
# copies agents + /orchy command to ~/.config/opencode, then restart opencode
```

> opencode loads config once at startup (no hot-reload). After installing or updating, quit and restart opencode.

### Claude Code (twin, ~95% identical behavior)

```bash
/path/to/Orchy/install.sh claude-project  # per project → ./.claude
/path/to/Orchy/install.sh claude-global   # all projects → ~/.claude
```

Then run `/orchy "add GitHub login with tests"`. Same pipeline, same `APPROVE / REQUEST CHANGES` verdict. Or copy manually: `.claude/agents/orchy-*.md` + `.claude/commands/orchy.md`.

### Any other AI (portable)

- Point it at `skills/orchy/SKILL.md` (standard Agent Skills format), or
- Paste `prompts/orchy.md` into any chat. No setup. Single-agent roleplay of the same 3 phases (no hard permission isolation, same checklist).

### The workflow

1. **PLAN:** Orchy calls `council-planner` with your raw request. If anything load-bearing is ambiguous (scope, framework, data model, auth, destructive actions), it asks you first.
2. **BUILD:** the approved plan is passed verbatim to `council-builder`. One build pass, no parallel Critic.
3. **REVIEW:** plan + build summary go to `council-critic`.
   - `APPROVE` → you get goal, files changed, verification, and sign-off.
   - `REQUEST CHANGES` → one fix pass by Builder + one re-review, or it stops and shows you plan + issues if the problem is fundamental.

Trivial requests (typo, single-line change) still run Planner-brief + Builder, with Critic folded into a 3-point self-check.

## Contents

- `.opencode/agents/council-*.md` — native opencode council (strictest, permission-enforced)
- `.opencode/commands/orchy.md` — `/orchy $ARGUMENTS` for opencode
- `.claude/agents/orchy-*.md` — Claude Code twin (~95% identical)
- `.claude/commands/orchy.md` — `/orchy $ARGUMENTS` for Claude Code
- `skills/orchy/SKILL.md` — tool-agnostic core (standard Agent Skills format)
- `prompts/orchy.md` — pasteable prompt for any AI chat
- `AGENTS.md` — router: which file each AI should use
- `opencode.json` — minimal, only `$schema`
- `install.sh` — installer: `project|global|claude-project|claude-global|all-project|all-global`

## Requirements

- opencode valid against https://opencode.ai/config.json
