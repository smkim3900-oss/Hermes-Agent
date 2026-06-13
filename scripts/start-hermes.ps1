param(
    [switch]$CheckOnly,
    [string]$Prompt = ""
)

$ErrorActionPreference = "Stop"

$runtimeLauncher = "D:\CodexProjects\scripts\start_hermes_codex_runtime.ps1"
if (-not (Test-Path -LiteralPath $runtimeLauncher)) {
    throw "Runtime launcher not found: $runtimeLauncher"
}

$projectRoot = Split-Path -Parent $PSScriptRoot
$argsList = @("-ProjectPath", $projectRoot)

if ($CheckOnly) {
    $argsList += "-CheckOnly"
}

if (-not [string]::IsNullOrWhiteSpace($Prompt)) {
    $argsList += @("-Prompt", $Prompt)
}

& powershell -ExecutionPolicy Bypass -File $runtimeLauncher @argsList
