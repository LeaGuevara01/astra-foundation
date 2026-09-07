[CmdletBinding()]
param()
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$files=Get-ChildItem (Join-Path $root 'skills') -Filter SKILL.md -Recurse
if($files.Count -ne 5){throw 'Expected five skills'}
foreach($file in $files){
 $body=Get-Content -LiteralPath $file.FullName -Raw
 if($body -notmatch '(?s)^---\r?\nname: [a-z0-9-]+\r?\ndescription: .+?\r?\n---'){throw "Invalid skill frontmatter: $($file.FullName)"}
}
foreach($file in (Get-ChildItem (Join-Path $root 'scripts') -Filter *.ps1)){
 $tokens=$null;$parseErrors=$null
 [Management.Automation.Language.Parser]::ParseFile($file.FullName,[ref]$tokens,[ref]$parseErrors) | Out-Null
 if($parseErrors.Count){throw ($parseErrors | Out-String)}
}
Write-Output 'Foundation: five skill entrypoints and PowerShell syntax validated.'

