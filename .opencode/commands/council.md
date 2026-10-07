---
description: Run the AI Council (Planner -> Builder -> Critic) on your request
agent: council-orchestrator
---

Run the full council pipeline on this request:

$ARGUMENTS

Follow the orchestrator workflow strictly:
1. Invoke @council-planner via the Task tool with the request above. Relay any clarifying questions to me.
2. Pass the approved plan to @council-builder for implementation.
3. Pass plan + build summary to @council-critic for review.
4. If APPROVE, summarize. If REQUEST CHANGES, do at most one fix-and-re-review loop, then report to me.

Always end with: goal, files changed, verification results, and critic verdict.
