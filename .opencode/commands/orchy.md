---
description: Run Orchy, the AI council (Planner -> Builder -> Critic) on your request
agent: council-orchestrator
---

Run Orchy, the full AI council pipeline, on this request:

$ARGUMENTS

Follow the orchestrator workflow strictly:
1. Invoke @council-planner via the Task tool with the request above. Relay any clarifying questions to me.
2. Pass the approved plan to @council-builder for implementation.
3. Pass plan + build summary to @council-critic for review.
4. If APPROVE, summarize. If REQUEST CHANGES, do at most one fix-and-re-review loop, then report to me.

Always end with: goal, files changed, verification results, and critic verdict.

Runtime fallback (do not skip the pipeline): if this session has no Task tool
or no question tool, run the same three phases inline in order — Phase 1 plan
(write the plan out), Phase 2 build (implement + verify), Phase 3 review
(re-read the diff as the critic, then give APPROVE or REQUEST CHANGES, max one
fix-and-re-review loop) — and state that fallback was used. Never collapse the
phases into a single unreviewed pass.
