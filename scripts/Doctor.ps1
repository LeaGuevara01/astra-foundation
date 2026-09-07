[CmdletBinding()]
param([string]$ProjectRoot=(Get-Location).Path, [switch]$RequireDocker)
$ErrorActionPreference='Stop'
$report=[ordered]@{ checkedAt=(Get-Date).ToUniversalTime().ToString('o'); project=[IO.Path]::GetFullPath($ProjectRoot); tools=@(); dockerReady=$false; gitReady=$false }
foreach($name in @('git','node','npm.cmd','docker','codex')) {
 $tool=Get-Command $name -ErrorAction SilentlyContinue
 $version=$null
 if($tool){ $version=(& $tool.Source --version 2>&1 | Select-Object -First 1).ToString() }
 $report.tools+=@{name=$name;available=[bool]$tool;version=$version}
}
if(Get-Command git -ErrorAction SilentlyContinue){ & git -C $ProjectRoot rev-parse --verify HEAD 2>$null | Out-Null; $report.gitReady=($LASTEXITCODE -eq 0) }
if(Get-Command docker -ErrorAction SilentlyContinue){ & docker info --format '{{.ServerVersion}}' 2>$null | Out-Null; $report.dockerReady=($LASTEXITCODE -eq 0) }
$report | ConvertTo-Json -Depth 5
if($RequireDocker -and !$report.dockerReady){throw 'Docker engine is not ready. Start Docker Desktop and retry.'}

