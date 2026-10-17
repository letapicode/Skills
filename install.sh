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
        cp "$SCRIPT_DIR/$filename" "$dest"
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

# 2. Install for Antigravity / Gemini (~/.gemini/antigravity/skills/system-design-master-brain)
GEMINI_SKILL_DIR="$HOME/.gemini/antigravity/skills/system-design-master-brain"
mkdir -p "$GEMINI_SKILL_DIR"
fetch_file "SKILL.md" "$GEMINI_SKILL_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$GEMINI_SKILL_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}✔ Installed for Antigravity / Gemini:${NC} $GEMINI_SKILL_DIR"

# 3. Install for Current Workspace (Cursor, Windsurf, Claude Code, Codeium, Codex/Copilot rules)
if [ -d ".git" ] || [ -f "package.json" ] || [ -f "go.mod" ] || [ -f "Cargo.toml" ] || [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    fetch_file ".cursorrules" "./.cursorrules"
    fetch_file ".windsurfrules" "./.windsurfrules"
    fetch_file ".codeiumrules" "./.codeiumrules"
    fetch_file "CLAUDE.md" "./CLAUDE.md"
    mkdir -p "./.github"
    fetch_file ".github/copilot-instructions.md" "./.github/copilot-instructions.md"
    echo -e "${GREEN}✔ Installed rules for Cursor, Windsurf, Codeium, Claude Code, and Codex/Copilot in current project:${NC} $(pwd)"
fi

echo ""
echo -e "${GREEN}${BOLD}Installation Complete!${NC}"
echo -e "You can now ask your AI coding assistant (Claude, Codex/Copilot, Codeium, Cursor, Windsurf, Antigravity, Gemini):"
echo -e "  ${YELLOW}\"Design a distributed rate limiter with 100k RPS and P99 < 5ms.\"${NC}"
echo -e "  ${YELLOW}\"Review this architecture using the 30-Point Red-Team Audit.\"${NC}"
echo ""
