[CmdletBinding()]
param([Parameter(Mandatory)][string]$Destination)
$ErrorActionPreference='Stop'
$sourceRoot=Split-Path $PSScriptRoot -Parent
$target=[IO.Path]::GetFullPath($Destination)
if(Test-Path -LiteralPath $target){throw 'Destination already exists; choose a new directory. No existing files are overwritten.'}
New-Item -ItemType Directory -Path $target | Out-Null
New-Item -ItemType Directory -Path (Join-Path $target 'docs') | Out-Null
Copy-Item -LiteralPath (Join-Path $sourceRoot 'templates/AGENTS.md') -Destination (Join-Path $target 'AGENTS.md')
Copy-Item -LiteralPath (Join-Path $sourceRoot 'templates/HANDOFF.md') -Destination (Join-Path $target 'docs/HANDOFF.md')
Copy-Item -LiteralPath (Join-Path $sourceRoot 'templates/TASK.md') -Destination (Join-Path $target 'docs/TASK.md')
Copy-Item -LiteralPath (Join-Path $sourceRoot '.gitignore') -Destination (Join-Path $target '.gitignore')
Copy-Item -LiteralPath (Join-Path $sourceRoot '.gitattributes') -Destination (Join-Path $target '.gitattributes')
@{repository='astra-foundation';version=(Get-Content (Join-Path $sourceRoot 'VERSION') -Raw).Trim()} | ConvertTo-Json | Set-Content (Join-Path $target 'foundation-version.json') -Encoding utf8
& git init -b main $target
if($LASTEXITCODE -ne 0){throw 'git init failed'}
& git -C $target add .
& git -C $target commit -m 'chore: establish ASTRA foundation baseline'
if($LASTEXITCODE -ne 0){throw 'Baseline commit failed; configure Git identity and retry commit.'}
Write-Output $target

