# Hermes Agent + Codex Runtime Guide

## Runtime Architecture

- Hermes Agent: session history, memory, gateway, skills, and orchestration.
- Codex app-server runtime: command execution, file edits, patching, sandboxing, and Codex plugin runtime.

## Local Paths

```text
Hermes home: D:\CodexProjects\.hermes
Hermes executable: D:\CodexProjects\.hermes\hermes-agent\venv\Scripts\hermes.exe
Codex native executable: D:\CodexProjects\.tools\codex-native\x86_64-pc-windows-msvc\bin\codex.exe
Project root: D:\CodexProjects\projects\hermes\2026-06\hermes-ai
```

## Commands

Check only:

```powershell
powershell -ExecutionPolicy Bypass -File D:\CodexProjects\scripts\start_hermes_codex_runtime.ps1 -CheckOnly
```

Interactive run:

```powershell
powershell -ExecutionPolicy Bypass -File D:\CodexProjects\scripts\start_hermes_codex_runtime.ps1
```

One-shot prompt:

```powershell
powershell -ExecutionPolicy Bypass -File D:\CodexProjects\scripts\start_hermes_codex_runtime.ps1 -Prompt "Respond with PASS only."
```

## Applied Configuration

Hermes config:

```yaml
model:
  provider: openai-codex
  default: gpt-5.5
  openai_runtime: codex_app_server
```

Codex config includes a Hermes-managed block for the `hermes-tools` MCP callback and `default_permissions = ":workspace"`.

## Verified State

- Codex CLI: `0.139.0`
- Hermes Agent: `0.16.0`
- Hermes auth: local verification passed
- D-only trusted audit: `NonDTrustedEntries = 0`
- Hermes one-shot through Codex runtime: `PASS`

## Windows Note

The npm extensionless `codex` shim can fail from Python subprocesses with `WinError 5`. The runtime launcher avoids this by putting the D-drive native `codex.exe` path first in `PATH`.
