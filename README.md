# Hermes AI

This repository is the D-drive canonical workspace for the Hermes AI runtime setup.

## Workspace

```text
D:\CodexProjects\projects\hermes\2026-06\hermes-ai
```

## Purpose

The project documents and validates a local workflow where:

- Hermes Agent is the main orchestration shell.
- Codex app-server runtime handles code execution, file edits, patching, sandboxing, and plugin runtime.
- All project work is kept under `D:\CodexProjects`.

## Quick Check

```powershell
powershell -ExecutionPolicy Bypass -File D:\CodexProjects\scripts\start_hermes_codex_runtime.ps1 -CheckOnly
```

## Current State

- Git repository initialized.
- D-only Codex trusted audit passed.
- Hermes Agent + Codex app-server runtime verified.
- GitHub remote is not configured yet.
