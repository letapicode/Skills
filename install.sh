#!/usr/bin/env bash
# ==============================================================================
# System Design Master Brain - Universal 1-Line Installer (macOS / Linux)
# ==============================================================================
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/<username>/SystemDesignSkill/main/install.sh | bash
#
# Or run locally from cloned repo:
#   ./install.sh
# ==============================================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BLUE}${BOLD}======================================================${NC}"
echo -e "${BLUE}${BOLD}   System Design Master Brain - Universal Installer   ${NC}"
echo -e "${BLUE}${BOLD}======================================================${NC}"
echo ""

REPO_RAW_URL="${REPO_RAW_URL:-https://raw.githubusercontent.com/OWNER/SystemDesignSkill/main}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"

# Function to get file content (from local clone if present, otherwise curl)
fetch_file() {
    local filename="$1"
    local dest="$2"

    if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$filename" ]; then
        if [ "$(cd "$(dirname "$dest")" && pwd)/$(basename "$dest")" != "$SCRIPT_DIR/$filename" ]; then
            cp "$SCRIPT_DIR/$filename" "$dest"
        fi
    else
        curl -fsSL "$REPO_RAW_URL/$filename" -o "$dest"
    fi
}

# 1. Install for Claude Code (~/.claude/skills/system-design-master-brain)
CLAUDE_SKILL_DIR="$HOME/.claude/skills/system-design-master-brain"
mkdir -p "$CLAUDE_SKILL_DIR"
fetch_file "SKILL.md" "$CLAUDE_SKILL_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$CLAUDE_SKILL_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}✔ Installed for Claude Code:${NC} $CLAUDE_SKILL_DIR"

# 2. Install for OpenAI Codex CLI (~/.codex/skills/system-design-master-brain & ~/.codex/AGENTS.md)
CODEX_DIR="$HOME/.codex/skills/system-design-master-brain"
mkdir -p "$CODEX_DIR"
fetch_file "SKILL.md" "$CODEX_DIR/SKILL.md"
fetch_file "AGENTS.md" "$CODEX_DIR/AGENTS.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$CODEX_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
if [ ! -f "$HOME/.codex/AGENTS.md" ]; then
    fetch_file "AGENTS.md" "$HOME/.codex/AGENTS.md"
fi
echo -e "${GREEN}✔ Installed for OpenAI Codex CLI:${NC} $CODEX_DIR"

# 3. Install for Antigravity / Gemini (~/.gemini/antigravity/skills/system-design-master-brain)
GEMINI_SKILL_DIR="$HOME/.gemini/antigravity/skills/system-design-master-brain"
mkdir -p "$GEMINI_SKILL_DIR"
fetch_file "SKILL.md" "$GEMINI_SKILL_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$GEMINI_SKILL_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}✔ Installed for Antigravity / Gemini:${NC} $GEMINI_SKILL_DIR"

# 4. Install for Current Workspace (Codex AGENTS.md, Claude, Cursor, Windsurf, Codeium, Cline/DeepSeek, Copilot + Full Playbook)
if [ -d ".git" ] || [ -f "package.json" ] || [ -f "go.mod" ] || [ -f "Cargo.toml" ] || [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "pom.xml" ] || [ -f "build.gradle" ]; then
    fetch_file "AGENTS.md" "./AGENTS.md"
    fetch_file "CLAUDE.md" "./CLAUDE.md"
    fetch_file "SKILL.md" "./SKILL.md"
    fetch_file ".cursorrules" "./.cursorrules"
    fetch_file ".windsurfrules" "./.windsurfrules"
    fetch_file ".codeiumrules" "./.codeiumrules"
    fetch_file ".clinerules" "./.clinerules"
    fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "./SYSTEM_DESIGN_MASTER_BRAIN.md"
    mkdir -p "./.github"
    fetch_file ".github/copilot-instructions.md" "./.github/copilot-instructions.md"
    echo -e "${GREEN}✔ Installed workspace rules & 27-module playbook for Codex, Claude, DeepSeek/Cline, Cursor, Windsurf, Codeium, and Copilot in:${NC} $(pwd)"
fi

echo ""
echo -e "${GREEN}${BOLD}Installation Complete! (27 Modules + 50-Point Red-Team Audit Active)${NC}"
echo -e "You can now ask your AI coding assistant (Codex, Claude, DeepSeek, Cursor, Windsurf, Codeium, Antigravity, Gemini):"
echo -e "  ${YELLOW}\"Design a distributed rate limiter or LLM inference engine with P99 < 50ms.\"${NC}"
echo -e "  ${YELLOW}\"Audit this codebase / PR using the 50-Point Red-Team Checklist.\"${NC}"
echo ""
