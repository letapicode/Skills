#!/usr/bin/env bash
# ==============================================================================
# System Design Master Brain — Universal Cross-Platform Installer (macOS/Linux/WSL)
# Installs the skill globally for Claude Code, Devin, OpenAI Codex, Cursor,
# Gemini CLI / Antigravity, and optionally into the current project workspace.
# ==============================================================================

set -euo pipefail

REPO_URL="${SYSTEM_DESIGN_SKILL_REPO:-https://raw.githubusercontent.com/letapicode/Skills/main/SystemDesign}"
SKILL_NAME="system-design-master-brain"

BOLD="\033[1m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[0;33m"
RESET="\033[0m"

echo -e "${BOLD}${CYAN}=================================================================${RESET}"
echo -e "${BOLD}${CYAN}  System Design Master Brain — Universal Skill Installer         ${RESET}"
echo -e "${BOLD}${CYAN}=================================================================${RESET}"

# Determine if running from a local clone of SystemDesignSkill or via curl | bash
SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
    CANDIDATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd || true)"
    if [ -n "$CANDIDATE_DIR" ] && [ -f "$CANDIDATE_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md" ]; then
        SCRIPT_DIR="$CANDIDATE_DIR"
    fi
elif [ -f "./SYSTEM_DESIGN_MASTER_BRAIN.md" ] && [ -f "./SKILL.md" ]; then
    SCRIPT_DIR="$(pwd)"
fi

fetch_file() {
    local filename="$1"
    local dest="$2"
    mkdir -p "$(dirname "$dest")"
    if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$filename" ]; then
        cp "$SCRIPT_DIR/$filename" "$dest"
    else
        curl -fsSL "$REPO_URL/$filename" -o "$dest"
    fi
}

BEGIN_MARKER="<!-- BEGIN SYSTEM_DESIGN_MASTER_BRAIN -->"
END_MARKER="<!-- END SYSTEM_DESIGN_MASTER_BRAIN -->"

# Non-destructively install or update a rule file using HTML comment markers
merge_rule_file() {
    local src_file="$1"
    local dest_file="$2"
    mkdir -p "$(dirname "$dest_file")"

    # Strip YAML frontmatter if present in source
    local payload
    payload="$(awk 'BEGIN{fm=0} /^---$/{if(NR==1){fm=1;next} if(fm==1){fm=0;next}} fm==0{print}' "$src_file")"

    if [ ! -f "$dest_file" ]; then
        printf "%s\n%s\n%s\n" "$BEGIN_MARKER" "$payload" "$END_MARKER" > "$dest_file"
    elif grep -qF "$BEGIN_MARKER" "$dest_file"; then
        python3 -c '
import sys
dest, b_mark, e_mark = sys.argv[1], sys.argv[2], sys.argv[3]
payload = sys.stdin.read().strip()
with open(dest, "r", encoding="utf-8") as f:
    content = f.read()
s = content.find(b_mark)
e = content.find(e_mark)
if s != -1 and e != -1 and e > s:
    e += len(e_mark)
    new_c = content[:s] + b_mark + "\n" + payload + "\n" + e_mark + content[e:]
else:
    new_c = content.rstrip() + "\n\n" + b_mark + "\n" + payload + "\n" + e_mark + "\n"
with open(dest, "w", encoding="utf-8", newline="\n") as f:
    f.write(new_c)
' "$dest_file" "$BEGIN_MARKER" "$END_MARKER" <<< "$payload" 2>/dev/null || {
            printf "\n\n%s\n%s\n%s\n" "$BEGIN_MARKER" "$payload" "$END_MARKER" >> "$dest_file"
        }
    else
        printf "\n\n%s\n%s\n%s\n" "$BEGIN_MARKER" "$payload" "$END_MARKER" >> "$dest_file"
    fi
}

# 1. Claude Code Global Skill (~/.claude/skills/system-design-master-brain)
CLAUDE_DIR="$HOME/.claude/skills/$SKILL_NAME"
echo -e "\n${YELLOW}[1/5] Installing for Claude Code -> ${CLAUDE_DIR}${RESET}"
fetch_file "SKILL.md" "$CLAUDE_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$CLAUDE_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
fetch_file "agents/openai.yaml" "$CLAUDE_DIR/agents/openai.yaml"
echo -e "${GREEN}  ✓ Claude Code skill installed.${RESET}"

# 2. Devin & OpenAI Codex CLI Global Skills (~/.agents/skills & ~/.codex/skills)
AGENTS_DIR="$HOME/.agents/skills/$SKILL_NAME"
CODEX_DIR="$HOME/.codex/skills/$SKILL_NAME"
echo -e "\n${YELLOW}[2/5] Installing for Devin & OpenAI Codex -> ${AGENTS_DIR}${RESET}"
fetch_file "SKILL.md" "$AGENTS_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$AGENTS_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
fetch_file "agents/openai.yaml" "$AGENTS_DIR/agents/openai.yaml"
fetch_file "SKILL.md" "$CODEX_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$CODEX_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}  ✓ Devin & OpenAI Codex skills installed.${RESET}"

# 3. Devin Global Rules (~/.config/devin/AGENTS.md)
DEVIN_CONFIG_DIR="$HOME/.config/devin"
echo -e "\n${YELLOW}[3/5] Installing for Devin Global Rules -> ${DEVIN_CONFIG_DIR}${RESET}"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$DEVIN_CONFIG_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
merge_rule_file "$CLAUDE_DIR/SKILL.md" "$DEVIN_CONFIG_DIR/AGENTS.md"
echo -e "${GREEN}  ✓ Devin global AGENTS.md rules configured.${RESET}"

# 4. Gemini CLI / Antigravity Global Skill (~/.gemini/skills/system-design-master-brain)
GEMINI_DIR="$HOME/.gemini/skills/$SKILL_NAME"
echo -e "\n${YELLOW}[4/5] Installing for Gemini / Antigravity -> ${GEMINI_DIR}${RESET}"
fetch_file "SKILL.md" "$GEMINI_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$GEMINI_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}  ✓ Gemini / Antigravity skill installed.${RESET}"

# 5. Cursor Global Skill Directory (~/.cursor/skills/system-design-master-brain)
CURSOR_DIR="$HOME/.cursor/skills/$SKILL_NAME"
echo -e "\n${YELLOW}[5/5] Installing for Cursor -> ${CURSOR_DIR}${RESET}"
fetch_file "SKILL.md" "$CURSOR_DIR/SKILL.md"
fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$CURSOR_DIR/SYSTEM_DESIGN_MASTER_BRAIN.md"
echo -e "${GREEN}  ✓ Cursor global skill installed.${RESET}"

# Optional: Install workspace rule files if --workspace or --project <dir> is passed
TARGET_WS=""
if [[ "${1:-}" == "--workspace" ]]; then
    TARGET_WS="$(pwd)"
elif [[ "${1:-}" == "--project" && -n "${2:-}" ]]; then
    TARGET_WS="$2"
fi

if [[ -n "$TARGET_WS" ]]; then
    mkdir -p "$TARGET_WS"
    echo -e "\n${YELLOW}[+] Installing workspace rules into ${TARGET_WS}...${RESET}"
    fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$TARGET_WS/SYSTEM_DESIGN_MASTER_BRAIN.md"
    fetch_file "SKILL.md" "$TARGET_WS/SKILL.md"
    fetch_file "SKILL.md" "$TARGET_WS/.agents/skills/$SKILL_NAME/SKILL.md"
    fetch_file "SYSTEM_DESIGN_MASTER_BRAIN.md" "$TARGET_WS/.agents/skills/$SKILL_NAME/SYSTEM_DESIGN_MASTER_BRAIN.md"
    fetch_file ".cursor/rules/system-design-master-brain.mdc" "$TARGET_WS/.cursor/rules/system-design-master-brain.mdc"
    for rule_target in "$TARGET_WS/AGENTS.md" "$TARGET_WS/CLAUDE.md" "$TARGET_WS/.cursorrules" "$TARGET_WS/.codeiumrules" "$TARGET_WS/.clinerules" "$TARGET_WS/.github/copilot-instructions.md"; do
        merge_rule_file "$TARGET_WS/SKILL.md" "$rule_target"
    done
    echo -e "${GREEN}  ✓ Workspace rules non-destructively merged (preserving any existing project rules).${RESET}"
fi

echo -e "\n${BOLD}${GREEN}=================================================================${RESET}"
echo -e "${BOLD}${GREEN}  Installation Complete!                                         ${RESET}"
echo -e "${BOLD}${GREEN}=================================================================${RESET}"
echo -e "Tip: Run with ${BOLD}--workspace${RESET} (or ${BOLD}--project /path/to/repo${RESET}) to non-destructively merge"
echo -e "     ${BOLD}AGENTS.md, CLAUDE.md, .agents/skills/, and .cursor/rules/${RESET} into your repo."
