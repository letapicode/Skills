# AI Agent Skills (`letapicode/Skills`) ⚡

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Compatible with Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-d97706.svg)]()
[![Compatible with OpenAI Codex / Copilot](https://img.shields.io/badge/OpenAI%20Codex%20%2F%20Copilot-Compatible-000000.svg)]()
[![Compatible with Devin](https://img.shields.io/badge/Devin%20%28Cognition%29-Compatible-6366f1.svg)]()
[![Compatible with DeepSeek / Cline](https://img.shields.io/badge/DeepSeek%20%2F%20Cline-Compatible-4d6bfe.svg)]()
[![Compatible with Cursor](https://img.shields.io/badge/Cursor-Compatible-000000.svg)]()
[![Compatible with Antigravity / Gemini](https://img.shields.io/badge/Antigravity%20%2F%20Gemini-Compatible-ea4335.svg)]()
[![Live Hub](https://img.shields.io/badge/Live%20Docs-GitHub%20Pages-success.svg)](https://letapicode.github.io/Skills/)

> A curated monorepo of production-grade, self-evolving **AI Agent Skills** for **Claude Code, OpenAI Codex, Devin, Cursor, GitHub Copilot, DeepSeek / Cline / Roo Code, Codeium, and Google Antigravity**.

Each skill lives in its own self-contained directory with universal 1-line installers (`install.sh` / `install.ps1`), multi-IDE rule bundles (`SKILL.md`, `AGENTS.md`, `CLAUDE.md`, `.cursor/rules/*.mdc`), and zero-latency interactive web documentation.

---

## 📦 Available Skills Catalog

| Skill | Directory | Description | Live Docs |
|---|---|---|---|
| **System Design Master Brain** *(v3.0 Dual-Mode)* | [`./SystemDesign`](./SystemDesign) | Transforms any AI coding assistant into a **Staff/Principal Distributed Systems & Frontier AI Architect**. Includes **28 core modules**, first-principles capacity & GPU/KV-cache math, Day-0 monolith baselines, 10 non-negotiable production codebase laws, an uncharted-domain deep-research bridge, and a **65-Point Master Red-Team Audit**. | [📖 Open Playbook](https://letapicode.github.io/Skills/SystemDesign/) |

---

## 🚀 Quick Install: `SystemDesign` (System Design Master Brain)

### macOS, Linux & WSL
```bash
curl -fsSL https://raw.githubusercontent.com/letapicode/Skills/main/SystemDesign/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/letapicode/Skills/main/SystemDesign/install.ps1 | iex
```

### Install into a Specific Project Workspace
```bash
# macOS / Linux / WSL
curl -fsSL https://raw.githubusercontent.com/letapicode/Skills/main/SystemDesign/install.sh | bash -s -- /path/to/your/project
```
```powershell
# Windows PowerShell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/letapicode/Skills/main/SystemDesign/install.ps1))) -ProjectDir "C:\path\to\your\project"
```

👉 **Full documentation, 28 modules, and 65-point audit**: See [`SystemDesign/README.md`](./SystemDesign/README.md) or browse the [Interactive Web Reader](https://letapicode.github.io/Skills/SystemDesign/).

---

## 🗂 Repository Structure

```text
Skills/
├── README.md                  # Master catalog of all skills in this repository
├── index.html                 # GitHub Pages landing hub (https://letapicode.github.io/Skills/)
├── .gitattributes             # Cross-platform line-ending enforcement (LF for .sh/.md, CRLF for .ps1)
├── LICENSE                    # MIT License
└── SystemDesign/              # Skill #1: System Design Master Brain (28 Modules + 65-Point Audit)
    ├── SKILL.md               # Canonical Dual-Mode Agent Skill definition
    ├── SYSTEM_DESIGN_MASTER_BRAIN.md
    ├── index.html             # Standalone interactive web reader (/Skills/SystemDesign/)
    ├── install.sh             # Universal 1-line installer (macOS / Linux / WSL)
    ├── install.ps1            # Universal 1-line installer (Windows PowerShell)
    ├── sync.py                # Zero-dependency rule synchronizer & release verifier
    ├── README.md              # Full SystemDesign skill documentation
    └── ...                    # Pre-synced IDE & agent rule bundles (AGENTS.md, CLAUDE.md, .cursor, etc.)
```

---

## 📄 License

Licensed under the [MIT License](LICENSE).
