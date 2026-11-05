# Install the Korra skill for Claude Code and/or Codex on Windows.
#   irm https://raw.githubusercontent.com/ago60hz/korra/main/install.ps1 | iex
#   .\install.ps1 [-Claude] [-Codex] [-All] [-Uninstall]
param([switch]$Claude, [switch]$Codex, [switch]$All, [switch]$Uninstall)
$ErrorActionPreference = 'Stop'

$Repo = 'ago60hz/korra'; $Branch = 'main'
$ClaudeRoot = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME '.claude' }
$CodexRoot  = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
$Targets = @()
if ($All -or $Claude -or (-not $Codex -and (Test-Path $ClaudeRoot))) { $Targets += (Join-Path $ClaudeRoot 'skills') }
if ($All -or $Codex  -or (-not $Claude -and (Test-Path $CodexRoot)))  { $Targets += (Join-Path $CodexRoot 'skills') }
if (-not $Targets) { Write-Host "Couldn't find Claude Code or Codex, installing for Claude Code."; $Targets = @((Join-Path $ClaudeRoot 'skills')) }

if ($Uninstall) {
  foreach ($t in $Targets) { Remove-Item -Recurse -Force (Join-Path $t 'korra') -ErrorAction SilentlyContinue; Write-Host "Removed $t\korra" }
  return
}

$here = if ($PSScriptRoot) { $PSScriptRoot } else { '' }
$tmp = $null
if ($here -and (Test-Path (Join-Path $here 'skills\korra\SKILL.md'))) {
  $src = Join-Path $here 'skills\korra'
} else {
  $tmp = Join-Path ([IO.Path]::GetTempPath()) ("korra-" + [guid]::NewGuid())
  New-Item -ItemType Directory $tmp | Out-Null
  Write-Host 'Downloading Korra...'
  $zip = Join-Path $tmp 'korra.zip'
  Invoke-WebRequest "https://github.com/$Repo/archive/refs/heads/$Branch.zip" -OutFile $zip
  Expand-Archive $zip -DestinationPath $tmp
  $src = (Get-ChildItem $tmp -Directory | Select-Object -First 1).FullName + '\skills\korra'
}

foreach ($t in $Targets) {
  New-Item -ItemType Directory -Force $t | Out-Null
  $dest = Join-Path $t 'korra'
  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Recurse $src $dest
  Write-Host "Installed to $dest"
}
if ($tmp) { Remove-Item -Recurse -Force $tmp }
Write-Host "`nDone. Restart your agent, then ask it: `"Open Korra and make my logo in bronze.`""
