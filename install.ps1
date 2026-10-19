$ErrorActionPreference = "Stop"
$source = Split-Path -Parent $MyInvocation.MyCommand.Path
$dest = Join-Path $HOME ".copilot\skills"
$names = @("pr-approval-pack", "servicenow-cr-draft", "change-closure-report")
New-Item -ItemType Directory -Force -Path $dest | Out-Null
foreach ($name in $names) {
    $target = Join-Path $dest $name
    if (Test-Path -LiteralPath $target) {
        throw "Refusing overwrite: $target. Review and remove/rename the existing skill before reinstalling."
    }
}
foreach ($name in $names) {
    $from = Join-Path (Join-Path $source "skills") $name
    Copy-Item -LiteralPath $from -Destination $dest -Recurse
    Write-Host "Installed: $(Join-Path $dest $name)"
}
Write-Host "No workspaces, repositories, CI pipelines, or ServiceNow records were changed."
