# Hermes AI Roadmap

## Phase 1: Runtime Foundation

Status: complete

- Keep active work under `D:\CodexProjects`.
- Run Hermes Agent as the orchestration shell.
- Route code execution through Codex app-server runtime.
- Verify local startup with `scripts/start-hermes.ps1 -CheckOnly`.

## Phase 2: Repository Operations

Status: in progress

- Keep `main` protected by verification checks.
- Track operational scripts in `scripts/`.
- Keep local machine-specific details out of public documentation when possible.
- Add release notes once the workflow becomes stable.

## Phase 3: Product Scaffold

Status: planned

- Decide whether Hermes AI should become a CLI, dashboard, gateway service, or mixed workflow.
- Add environment template only when real configurable values are introduced.
- Add tests around the first real app module.

## Phase 4: Automation

Status: planned

- Add GitHub issue templates.
- Add scheduled runtime health checks if needed.
- Add deployment only after the application boundary is defined.
