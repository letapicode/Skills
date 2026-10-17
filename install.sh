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

    mkdir -p "$(dirname "$dest")"

    if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$filename" ]; then
        if [ "$(cd "$(dirname "$dest")" && pwd)/$(basename "$dest")" != "$SCRIPT_DIR/$filename" ]; then
            cp "$SCRIPT_DIR/$filename" "$dest"
        fi
    else
        curl -fsSL "$REPO_RAW_URL/$filename" -o "$dest"
    fi
}

# Non-destructive workspace rule installer: preserves custom project AGENTS.md / CLAUDE.md
safe_install_rule() {
    local filename="$1"
    local dest="$2"

    if [ -f "$dest" ] && ! grep -q "# System Design Master Brain" "$dest" 2>/dev/null; then
        cp "$dest" "${dest}.bak"
        local tmp_file
        tmp_file="$(mktemp)"
        fetch_file "$filename" "$tmp_file"
        printf "\n\n---\n\n" >> "$dest"
        cat "$tmp_file" >> "$dest"
        rm -f "$tmp_file"
        echo -e "${YELLOW}  -> Preserved existing $dest (backed up to ${dest}.bak) and appended System Design Master Brain.${NC}"
    else
        fetch_file "$filename" "$dest"
    fi
}

# 1. Install for Claude Code (~/.claude/skills/system-design-master-brain)
CLAUDE_SKILL_DIR="$HOME/.claude/skills/system-design-master-brain"
mkdir -p "$CLAUDE_SKILL_DIR"
fetch_file "SKILL.md" "$CLAUDE_SKILL_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$CLAUDE_SKILL_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}✔ Installed for Claude Code:${NC} $CLAUDE_SKILL_DIR"

# 2. Install for OpenAI ChatGPT Desktop App (Codex) & Codex CLI (~/.codex/skills & ~/.agents/skills)
CODEX_DIR="$HOME/.codex/skills/system-design-master-brain"
mkdir -p "$CODEX_DIR/agents"
fetch_file "SKILL.md" "$CODEX_DIR/SKILL.md"
fetch_file "AGENTS.md" "$CODEX_DIR/AGENTS.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$CODEX_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
fetch_file "agents/openai.yaml" "$CODEX_DIR/agents/openai.yaml"
if [ ! -f "$HOME/.codex/AGENTS.md" ]; then
    fetch_file "AGENTS.md" "$HOME/.codex/AGENTS.md"
fi

AGENTS_STD_DIR="$HOME/.agents/skills/system-design-master-brain"
mkdir -p "$AGENTS_STD_DIR/agents"
fetch_file "SKILL.md" "$AGENTS_STD_DIR/SKILL.md"
fetch_file "AGENTS.md" "$AGENTS_STD_DIR/AGENTS.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$AGENTS_STD_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
fetch_file "agents/openai.yaml" "$AGENTS_STD_DIR/agents/openai.yaml"
echo -e "${GREEN}✔ Installed for OpenAI ChatGPT Desktop App (Codex) & Codex CLI:${NC} $CODEX_DIR & $AGENTS_STD_DIR"

# 3. Install for Antigravity / Gemini (~/.gemini/antigravity/skills/system-design-master-brain)
GEMINI_SKILL_DIR="$HOME/.gemini/antigravity/skills/system-design-master-brain"
mkdir -p "$GEMINI_SKILL_DIR"
fetch_file "SKILL.md" "$GEMINI_SKILL_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$GEMINI_SKILL_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}✔ Installed for Antigravity / Gemini:${NC} $GEMINI_SKILL_DIR"

# 4. Install for Current Workspace (Non-destructively merges into existing AGENTS.md / CLAUDE.md if custom)
if [ -d ".git" ] || [ -f "package.json" ] || [ -f "go.mod" ] || [ -f "Cargo.toml" ] || [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "pom.xml" ] || [ -f "build.gradle" ]; then
    safe_install_rule "AGENTS.md" "./AGENTS.md"
    safe_install_rule "CLAUDE.md" "./CLAUDE.md"
    fetch_file "SKILL.md" "./SKILL.md"
    fetch_file "agents/openai.yaml" "./agents/openai.yaml"
    mkdir -p "./.cursor/rules"
    fetch_file ".cursor/rules/system-design-master-brain.mdc" "./.cursor/rules/system-design-master-brain.mdc"
    safe_install_rule ".cursorrules" "./.cursorrules"
    safe_install_rule ".windsurfrules" "./.windsurfrules"
    safe_install_rule ".codeiumrules" "./.codeiumrules"
    safe_install_rule ".clinerules" "./.clinerules"
    fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "./SYSTEM_DESIGN_MASTER_BRAIN.md"
    mkdir -p "./.github"
    safe_install_rule ".github/copilot-instructions.md" "./.github/copilot-instructions.md"
    echo -e "${GREEN}✔ Installed workspace rules & 28-module playbook for ChatGPT/Codex, Claude, DeepSeek/Cline, Cursor, Windsurf, Codeium, and Copilot in:${NC} $(pwd)"
fi

echo ""
echo -e "${GREEN}${BOLD}Installation Complete! (28 Modules + 60-Point Red-Team Audit Active)${NC}"
echo -e "You can now ask your AI coding assistant (ChatGPT Desktop Codex, Codex CLI, Claude, DeepSeek, Cursor, Windsurf, Codeium, Antigravity, Gemini):"
echo -e "  ${YELLOW}\"Design a distributed rate limiter or LLM inference engine with P99 < 50ms.\"${NC}"
echo -e "  ${YELLOW}\"Audit this codebase / PR using the 60-Point Red-Team Checklist.\"${NC}"
echo ""
