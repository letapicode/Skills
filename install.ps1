# ==============================================================================
# System Design Master Brain - Universal 1-Line Installer (Windows PowerShell)
# ==============================================================================
# Usage:
#   irm https://raw.githubusercontent.com/<username>/SystemDesignSkill/main/install.ps1 | iex
#
# Or run locally from cloned repo:
#   .\install.ps1
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "   System Design Master Brain - Universal Installer   " -ForegroundColor Cyan
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host ""

$RepoRawUrl = if ($env:REPO_RAW_URL) { $env:REPO_RAW_URL } else { "https://raw.githubusercontent.com/OWNER/SystemDesignSkill/main" }
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path -ErrorAction SilentlyContinue

function Copy-Or-DownloadFile {
    param (
        [string]$Filename,
        [string]$DestinationPath
    )

    $parentDir = Split-Path -Parent $DestinationPath
    if (-not (Test-Path $parentDir)) {
        New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
    }

    if ($ScriptDir -and (Test-Path (Join-Path $ScriptDir $Filename))) {
        $srcFull = (Resolve-Path (Join-Path $ScriptDir $Filename)).Path
        $destFull = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($DestinationPath)
        if ($srcFull -ne $destFull) {
            Copy-Item $srcFull -Destination $DestinationPath -Force
        }
    } else {
        $url = "$RepoRawUrl/$Filename"
        Invoke-RestMethod -Uri $url -OutFile $DestinationPath
    }
}

# 1. Claude Code Skill (~/.claude/skills/system-design-master-brain)
$ClaudeDir = Join-Path $HOME ".claude\skills\system-design-master-brain"
Copy-Or-DownloadFile "SKILL.md" (Join-Path $ClaudeDir "SKILL.md")
Copy-Or-DownloadFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $ClaudeDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Write-Host "✔ Installed for Claude Code: $ClaudeDir" -ForegroundColor Green

# 2. Antigravity / Gemini Skill (~/.gemini/antigravity/skills/system-design-master-brain)
$GeminiDir = Join-Path $HOME ".gemini\antigravity\skills\system-design-master-brain"
Copy-Or-DownloadFile "SKILL.md" (Join-Path $GeminiDir "SKILL.md")
Copy-Or-DownloadFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $GeminiDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Write-Host "✔ Installed for Antigravity / Gemini: $GeminiDir" -ForegroundColor Green

# 3. Current Workspace (.cursorrules, .windsurfrules, .codeiumrules, CLAUDE.md, SKILL.md, SYSTEM_DESIGN_MASTER_BRAIN.md, .github/copilot-instructions.md)
$currentDir = Get-Location
$isProjectDir = (Test-Path ".git") -or (Test-Path "package.json") -or (Test-Path "go.mod") -or (Test-Path "Cargo.toml") -or (Test-Path "requirements.txt") -or (Test-Path "pyproject.toml") -or (Test-Path "pom.xml") -or (Test-Path "build.gradle")
if ($isProjectDir) {
    Copy-Or-DownloadFile ".cursorrules" (Join-Path $currentDir ".cursorrules")
    Copy-Or-DownloadFile ".windsurfrules" (Join-Path $currentDir ".windsurfrules")
    Copy-Or-DownloadFile ".codeiumrules" (Join-Path $currentDir ".codeiumrules")
    Copy-Or-DownloadFile "CLAUDE.md" (Join-Path $currentDir "CLAUDE.md")
    Copy-Or-DownloadFile "SKILL.md" (Join-Path $currentDir "SKILL.md")
    Copy-Or-DownloadFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $currentDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
    Copy-Or-DownloadFile ".github/copilot-instructions.md" (Join-Path $currentDir ".github\copilot-instructions.md")
    Write-Host "✔ Installed workspace rules & 26-module playbook for Cursor, Windsurf, Codeium, Claude Code, and Codex/Copilot in: $currentDir" -ForegroundColor Green
}

Write-Host ""
Write-Host "Installation Complete! (26 Modules + 45-Point Red-Team Audit Active)" -ForegroundColor Green
Write-Host "You can now ask your AI coding assistant (Claude, Codex/Copilot, Codeium, Cursor, Windsurf, Antigravity, Gemini):"
Write-Host '  "Design a distributed rate limiter with 100k RPS and P99 < 5ms."' -ForegroundColor Yellow
Write-Host '  "Audit this codebase / PR using the 45-Point Red-Team Checklist."' -ForegroundColor Yellow
Write-Host ""
