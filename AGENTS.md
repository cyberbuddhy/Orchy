# AGENTS.md — Orchy

This repo ships the Orchy AI council (Planner → Builder → Critic).

- opencode (native, strictest): `.opencode/agents/council-*.md` + `.opencode/commands/orchy.md`. Run `/orchy <task>`.
- Claude Code (twin): `.claude/agents/orchy-*.md` + `.claude/commands/orchy.md`. Run `/orchy <task>`.
- Any other AI: follow `skills/orchy/SKILL.md`, or paste `prompts/orchy.md` into the chat.

Workflow everywhere: PLAN (read-only, ask up to 3 questions, output plan, STOP) → BUILD (implement approved plan verbatim + verify) → REVIEW (`APPROVE` or `REQUEST CHANGES`, max 1 fix loop). Always end with goal, files changed, verification results, and critic verdict.
