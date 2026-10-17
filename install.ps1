# ==============================================================================
# System Design Master Brain - Universal Cross-Platform Installer (Windows PowerShell)
# Installs the skill globally for Claude Code, Devin, OpenAI Codex, Cursor,
# Gemini CLI / Antigravity, and optionally into the current project workspace.
# ==============================================================================

param(
    [switch]$Workspace,
    [string]$ProjectDir = ""
)

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$RepoOwner = "letapicode"
$RepoName = "SystemDesignSkill"
$RepoUrl = if ($env:SYSTEM_DESIGN_SKILL_REPO) { $env:SYSTEM_DESIGN_SKILL_REPO } else { "https://raw.githubusercontent.com/$RepoOwner/$RepoName/main" }
$SkillName = "system-design-master-brain"
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "  System Design Master Brain - Universal Skill Installer         " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan

# Safely detect local clone directory; $MyInvocation.MyCommand.Path is $null during irm | iex
$ScriptDir = ""
if ($MyInvocation.MyCommand.Path) {
    $CandidateDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    if ($CandidateDir -and (Test-Path (Join-Path $CandidateDir "SYSTEM_DESIGN_MASTER_BRAIN.md"))) {
        $ScriptDir = $CandidateDir
    }
} elseif (Test-Path (Join-Path (Get-Location).Path "SYSTEM_DESIGN_MASTER_BRAIN.md")) {
    $ScriptDir = (Get-Location).Path
}

function Fetch-SkillFile {
    param(
        [string]$FileName,
        [string]$Destination
    )
    $DestDir = Split-Path -Parent $Destination
    if ($DestDir -and -not (Test-Path $DestDir)) {
        New-Item -ItemType Directory -Force -Path $DestDir | Out-Null
    }

    if ($ScriptDir -and (Test-Path (Join-Path $ScriptDir $FileName))) {
        Copy-Item -Path (Join-Path $ScriptDir $FileName) -Destination $Destination -Force
    } else {
        Invoke-WebRequest -Uri "$RepoUrl/$FileName" -OutFile $Destination -UseBasicParsing
    }
}

$BeginMarker = "<!-- BEGIN SYSTEM_DESIGN_MASTER_BRAIN -->"
$EndMarker = "<!-- END SYSTEM_DESIGN_MASTER_BRAIN -->"

function Merge-RuleFile {
    param(
        [string]$SourceFile,
        [string]$Destination
    )
    $DestDir = Split-Path -Parent $Destination
    if ($DestDir -and -not (Test-Path $DestDir)) {
        New-Item -ItemType Directory -Force -Path $DestDir | Out-Null
    }

    $RawSource = [System.IO.File]::ReadAllText((Resolve-Path $SourceFile).Path, $Utf8NoBom)
    if ($RawSource.StartsWith("---")) {
        $Parts = $RawSource -split "(?m)^---\s*$", 3
        if ($Parts.Count -ge 3) {
            $RawSource = $Parts[2].Trim()
        }
    }
    $WrappedBlock = "$BeginMarker`n$($RawSource.Trim())`n$EndMarker"

    if (-not (Test-Path $Destination)) {
        [System.IO.File]::WriteAllText($Destination, "$WrappedBlock`n", $Utf8NoBom)
        return
    }

    $DestPath = (Resolve-Path $Destination).Path
    $Existing = [System.IO.File]::ReadAllText($DestPath, $Utf8NoBom)
    $StartIdx = $Existing.IndexOf($BeginMarker)
    $EndIdx = $Existing.IndexOf($EndMarker)
    if ($StartIdx -ge 0 -and $EndIdx -gt $StartIdx) {
        $EndIdx += $EndMarker.Length
        $Updated = $Existing.Substring(0, $StartIdx) + $WrappedBlock + $Existing.Substring($EndIdx)
        [System.IO.File]::WriteAllText($DestPath, $Updated, $Utf8NoBom)
    } else {
        $Updated = $Existing.TrimEnd() + "`n`n" + $WrappedBlock + "`n"
        [System.IO.File]::WriteAllText($DestPath, $Updated, $Utf8NoBom)
    }
}

# 1. Claude Code Global Skill
$ClaudeDir = Join-Path $HOME ".claude\skills\$SkillName"
Write-Host "`n[1/5] Installing for Claude Code -> $ClaudeDir" -ForegroundColor Yellow
Fetch-SkillFile "SKILL.md" (Join-Path $ClaudeDir "SKILL.md")
Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $ClaudeDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Fetch-SkillFile "agents/openai.yaml" (Join-Path $ClaudeDir "agents\openai.yaml")
Write-Host "  [OK] Claude Code skill installed." -ForegroundColor Green

# 2. Devin & OpenAI Codex Global Skills (~/.agents/skills & ~/.codex/skills)
$AgentsDir = Join-Path $HOME ".agents\skills\$SkillName"
$CodexDir = Join-Path $HOME ".codex\skills\$SkillName"
Write-Host "`n[2/5] Installing for Devin & OpenAI Codex -> $AgentsDir" -ForegroundColor Yellow
Fetch-SkillFile "SKILL.md" (Join-Path $AgentsDir "SKILL.md")
Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $AgentsDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Fetch-SkillFile "agents/openai.yaml" (Join-Path $AgentsDir "agents\openai.yaml")
Fetch-SkillFile "SKILL.md" (Join-Path $CodexDir "SKILL.md")
Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $CodexDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Write-Host "  [OK] Devin & OpenAI Codex skills installed." -ForegroundColor Green

# 3. Devin Global Rules (~/.config/devin/AGENTS.md & %APPDATA%\devin\AGENTS.md)
$DevinConfigDir = Join-Path $HOME ".config\devin"
Write-Host "`n[3/5] Installing for Devin Global Rules -> $DevinConfigDir" -ForegroundColor Yellow
Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $DevinConfigDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Merge-RuleFile (Join-Path $ClaudeDir "SKILL.md") (Join-Path $DevinConfigDir "AGENTS.md")
if ($env:APPDATA) {
    $DevinAppDataDir = Join-Path $env:APPDATA "devin"
    Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $DevinAppDataDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
    Merge-RuleFile (Join-Path $ClaudeDir "SKILL.md") (Join-Path $DevinAppDataDir "AGENTS.md")
}
Write-Host "  [OK] Devin global AGENTS.md rules configured." -ForegroundColor Green

# 4. Gemini CLI / Antigravity Global Skill
$GeminiDir = Join-Path $HOME ".gemini\skills\$SkillName"
Write-Host "`n[4/5] Installing for Gemini / Antigravity -> $GeminiDir" -ForegroundColor Yellow
Fetch-SkillFile "SKILL.md" (Join-Path $GeminiDir "SKILL.md")
Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $GeminiDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Write-Host "  [OK] Gemini / Antigravity skill installed." -ForegroundColor Green

# 5. Cursor Global Skill
$CursorDir = Join-Path $HOME ".cursor\skills\$SkillName"
Write-Host "`n[5/5] Installing for Cursor -> $CursorDir" -ForegroundColor Yellow
Fetch-SkillFile "SKILL.md" (Join-Path $CursorDir "SKILL.md")
Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $CursorDir "SYSTEM_DESIGN_MASTER_BRAIN.md")
Write-Host "  [OK] Cursor global skill installed." -ForegroundColor Green

# Optional: Workspace installation
$TargetWs = ""
if ($ProjectDir) {
    $TargetWs = $ProjectDir
} elseif ($Workspace) {
    $TargetWs = (Get-Location).Path
}

if ($TargetWs) {
    if (-not (Test-Path $TargetWs)) {
        New-Item -ItemType Directory -Force -Path $TargetWs | Out-Null
    }
    $TargetWs = (Resolve-Path $TargetWs).Path
    Write-Host "`n[+] Installing workspace rules into $TargetWs..." -ForegroundColor Yellow
    Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $TargetWs "SYSTEM_DESIGN_MASTER_BRAIN.md")
    Fetch-SkillFile "SKILL.md" (Join-Path $TargetWs "SKILL.md")
    Fetch-SkillFile "SKILL.md" (Join-Path $TargetWs ".agents\skills\$SkillName\SKILL.md")
    Fetch-SkillFile "SYSTEM_DESIGN_MASTER_BRAIN.md" (Join-Path $TargetWs ".agents\skills\$SkillName\SYSTEM_DESIGN_MASTER_BRAIN.md")
    Fetch-SkillFile ".cursor/rules/system-design-master-brain.mdc" (Join-Path $TargetWs ".cursor\rules\system-design-master-brain.mdc")
    $RuleTargets = @(
        "AGENTS.md",
        "CLAUDE.md",
        ".cursorrules",
        ".codeiumrules",
        ".clinerules",
        ".github\copilot-instructions.md"
    )
    foreach ($Target in $RuleTargets) {
        Merge-RuleFile (Join-Path $TargetWs "SKILL.md") (Join-Path $TargetWs $Target)
    }
    Write-Host "  [OK] Workspace rules non-destructively merged (preserving any existing project rules)." -ForegroundColor Green
}

Write-Host "`n=================================================================" -ForegroundColor Green
Write-Host "  Installation Complete!                                         " -ForegroundColor Green
Write-Host "=================================================================" -ForegroundColor Green
Write-Host "Tip: Run with -Workspace (or -ProjectDir C:\path\to\repo) to non-destructively merge"
Write-Host "     AGENTS.md, CLAUDE.md, .agents/skills/, and .cursor/rules/ into your repo."
