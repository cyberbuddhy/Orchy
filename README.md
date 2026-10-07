# Council Orchestrator for opencode

Pipeline Planner → Builder → Critic para tareas mejor que un solo agente.

## Contenido

- `.opencode/agents/council-orchestrator.md` — orquestador (primary, Tab para activarlo)
- `.opencode/agents/council-planner.md` — fase PLAN (read-only)
- `.opencode/agents/council-builder.md` — fase BUILD (implementa + verifica)
- `.opencode/agents/council-critic.md` — fase REVIEW (APPROVE / REQUEST CHANGES)
- `.opencode/commands/council.md` — comando `/council <tu pedido>`
- `opencode.json` — mínimo con `$schema`

## Uso en otra instancia

Opción A — como proyecto (recomendado):
```bash
git clone <tu-repo> mi-proyecto
cd mi-proyecto
# los archivos .opencode/ ya vienen incluidos
opencode
# dentro: /council "añade login con GitHub"
# o: Tab → council-orchestrator
```

Opción B — como global:
```bash
cp .opencode/agents/council-*.md ~/.config/opencode/agents/
cp .opencode/commands/council.md ~/.config/opencode/commands/
# reinicia opencode
```

> opencode carga la config al arrancar, no hace hot-reload. Tras copiar, sal y vuelve a entrar.

## Workflow

1. PLAN: planner aclara + explora repo + devuelve plan
2. BUILD: builder implementa el plan verbatim + verifica
3. REVIEW: critic revisa diff vs plan → APPROVE o REQUEST CHANGES (máx 1 loop fix sin preguntarte)

El resumen final siempre trae: goal, files changed, verification, critic verdict.

## Requisitos

- opencode válido contra https://opencode.ai/config.json
- `gh` opcional, solo para publicar este repo
