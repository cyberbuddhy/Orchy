# Orchy for opencode

Orchy is a 3-role AI council for opencode that handles prompts better than any single agent. Instead of jumping straight to code, it plans first, builds exactly what was planned, then reviews the diff before you see it.

**Pipeline:** Planner → Builder → Critic, coordinated by an orchestrator.

## What is it?

- **council-orchestrator** (primary agent, switch with Tab) — delegates and synthesizes. It does minimal direct work: it calls Planner, then Builder with the approved plan, then Critic with plan + build summary.
- **council-planner** (read-only) — clarifies vague prompts (up to 3 questions), explores the real codebase, and outputs a minimal actionable plan with acceptance criteria. Never writes code.
- **council-builder** — implements the plan task by task, runs checks (typecheck / tests / build), stays in scope, and reports what changed + how it was verified.
- **council-critic** (read-only) — reviews correctness, bugs, security, and scope drift against the plan with file:line evidence. Verdict is exactly `APPROVE` or `REQUEST CHANGES`. Max 1 fix-and-re-review loop without asking you.
- **`/orchy` command** — runs the whole pipeline on your request and always ends with: goal, files changed, verification results, and critic verdict.

## How to use it

### Option A — per project (recommended)

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

### Option B — global (all projects)

```bash
/path/to/Orchy/install.sh global
# copies agents + /orchy command to ~/.config/opencode, then restart opencode
```

> opencode loads config once at startup (no hot-reload). After installing or updating, quit and restart opencode.

### The workflow

1. **PLAN:** Orchy calls `council-planner` with your raw request. If anything load-bearing is ambiguous (scope, framework, data model, auth, destructive actions), it asks you first.
2. **BUILD:** the approved plan is passed verbatim to `council-builder`. One build pass, no parallel Critic.
3. **REVIEW:** plan + build summary go to `council-critic`.
   - `APPROVE` → you get goal, files changed, verification, and sign-off.
   - `REQUEST CHANGES` → one fix pass by Builder + one re-review, or it stops and shows you plan + issues if the problem is fundamental.

Trivial requests (typo, single-line change) still run Planner-brief + Builder, with Critic folded into a 3-point self-check.

## Contents

- `.opencode/agents/council-orchestrator.md` — orchestrator (primary)
- `.opencode/agents/council-planner.md` — PLAN phase (read-only)
- `.opencode/agents/council-builder.md` — BUILD phase (implements + verifies)
- `.opencode/agents/council-critic.md` — REVIEW phase (APPROVE / REQUEST CHANGES)
- `.opencode/commands/orchy.md` — `/orchy $ARGUMENTS` command
- `opencode.json` — minimal, only `$schema`
- `install.sh` — project or global installer

## Requirements

- opencode valid against https://opencode.ai/config.json
- `gh` only needed to publish this repo
