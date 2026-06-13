$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$requiredFiles = @(
    "README.md",
    "AGENTS.md",
    "HERMES_CODEX_RUNTIME.md",
    ".gitignore",
    ".gitattributes"
)

$requiredDirs = @(
    "scripts",
    ".github\workflows",
    "docs"
)

$failures = New-Object System.Collections.Generic.List[string]

foreach ($file in $requiredFiles) {
    $path = Join-Path $repoRoot $file
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $failures.Add("Missing file: $file")
    }
}

foreach ($dir in $requiredDirs) {
    $path = Join-Path $repoRoot $dir
    if (-not (Test-Path -LiteralPath $path -PathType Container)) {
        $failures.Add("Missing directory: $dir")
    }
}

$secretTerms = @(
    'sk-[A-Za-z0-9_\-]{20,}',
    'ghp_[A-Za-z0-9_]{20,}',
    'github_pat_[A-Za-z0-9_]{20,}',
    ('access_' + 'token'),
    ('refresh_' + 'token'),
    ('OPENAI_' + 'API_KEY'),
    ('GITHUB_' + 'TOKEN')
)
$secretPattern = '(' + ($secretTerms -join '|') + ')'
$scanFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Force |
    Where-Object {
        $_.FullName -notmatch '\\.git\\' -and
        $_.FullName -notmatch '\\node_modules\\' -and
        $_.FullName -notmatch '\\dist\\' -and
        $_.FullName -notmatch '\\build\\'
    }

foreach ($file in $scanFiles) {
    $matches = Select-String -LiteralPath $file.FullName -Pattern $secretPattern -CaseSensitive:$false -ErrorAction SilentlyContinue
    if ($matches) {
        $relative = $file.FullName.Substring($repoRoot.Length).TrimStart('\')
        $failures.Add("Potential secret-like text in: $relative")
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "PASS repository verification"
