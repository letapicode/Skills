#!/usr/bin/env python3
"""
sync.py — Zero-Dependency Universal Rule Synchronizer & Release Verifier
for System Design Master Brain.

Usage:
  python sync.py                           # Synchronize SKILL.md -> all 8 IDE/Agent rule files
  python sync.py --check                   # Verify all files are in sync, ASCII-safe, and 100% anonymous
  python sync.py --set-repo <owner>/<repo> # Replace OWNER/SystemDesignSkill placeholders across repo
"""

import argparse
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent

PLAIN_RULE_TARGETS = [
    "AGENTS.md",
    "CLAUDE.md",
    ".cursorrules",
    ".codeiumrules",
    ".clinerules",
    ".github/copilot-instructions.md",
]

FULL_SKILL_TARGETS = [
    ".agents/skills/system-design-master-brain/SKILL.md",
]

CURSOR_MDC_TARGET = ".cursor/rules/system-design-master-brain.mdc"

CURSOR_MDC_FRONTMATTER = """---
description: Staff/Principal Systems & AI Architect skill enforcing Dual-Mode execution (Socratic System Design RFCs + Direct Codebase Enforcement), First-Principles Capacity & GPU/KV-Cache Math, Sketch-to-Scale evolution, 28 Distributed & AI Modules, and a 65-Point Master Red-Team Audit.
globs: "**/*"
alwaysApply: true
---

"""

REPO_URL_FILES = [
    "README.md",
    "CONTRIBUTING.md",
    "index.html",
    "install.sh",
    "install.ps1",
]


def extract_skill_body(skill_text: str) -> str:
    """Strip YAML frontmatter from SKILL.md and return the markdown body."""
    if skill_text.startswith("---"):
        parts = skill_text.split("---", 2)
        if len(parts) == 3:
            return parts[2].lstrip("\r\n")
    return skill_text


def sync_rules(check_only: bool = False) -> bool:
    skill_path = ROOT / "SKILL.md"
    if not skill_path.exists():
        print("[FAIL] SKILL.md not found.", file=sys.stderr)
        return False

    skill_raw = skill_path.read_text(encoding="utf-8")
    body = extract_skill_body(skill_raw)
    all_ok = True

    # 1. Sync plain markdown rule targets (AGENTS.md, CLAUDE.md, .cursorrules, etc.)
    for rel_path in PLAIN_RULE_TARGETS:
        target = ROOT / rel_path
        target.parent.mkdir(parents=True, exist_ok=True)
        existing = target.read_text(encoding="utf-8") if target.exists() else None
        if existing != body:
            if check_only:
                print(f"[OUT OF SYNC] {rel_path} differs from SKILL.md body.")
                all_ok = False
            else:
                target.write_text(body, encoding="utf-8", newline="\n")
                print(f"[SYNCED] {rel_path}")
        else:
            if check_only:
                print(f"[OK] {rel_path} is in sync.")

    # 2. Sync full SKILL.md targets (Devin & OpenAI Codex .agents/skills/ bundle)
    for rel_path in FULL_SKILL_TARGETS:
        target = ROOT / rel_path
        target.parent.mkdir(parents=True, exist_ok=True)
        existing = target.read_text(encoding="utf-8") if target.exists() else None
        if existing != skill_raw:
            if check_only:
                print(f"[OUT OF SYNC] {rel_path} differs from SKILL.md.")
                all_ok = False
            else:
                target.write_text(skill_raw, encoding="utf-8", newline="\n")
                print(f"[SYNCED] {rel_path}")
        else:
            if check_only:
                print(f"[OK] {rel_path} is in sync.")

    # 3. Sync Cursor .mdc target
    mdc_target = ROOT / CURSOR_MDC_TARGET
    mdc_target.parent.mkdir(parents=True, exist_ok=True)
    expected_mdc = CURSOR_MDC_FRONTMATTER + body
    existing_mdc = mdc_target.read_text(encoding="utf-8") if mdc_target.exists() else None
    if existing_mdc != expected_mdc:
        if check_only:
            print(f"[OUT OF SYNC] {CURSOR_MDC_TARGET} differs from SKILL.md body.")
            all_ok = False
        else:
            mdc_target.write_text(expected_mdc, encoding="utf-8", newline="\n")
            print(f"[SYNCED] {CURSOR_MDC_TARGET}")
    else:
        if check_only:
            print(f"[OK] {CURSOR_MDC_TARGET} is in sync.")

    return all_ok


def set_repository_slug(slug: str) -> bool:
    """Replace OWNER/Repo[/SubDir] across installer & docs."""
    parts = [p for p in slug.strip().split("/") if p]
    if len(parts) < 2 or len(parts) > 3:
        print("[FAIL] --set-repo must be in format <github_username>/<repo_name>[/<subdir>]", file=sys.stderr)
        return False

    owner, repo = parts[0], parts[1]
    subdir = parts[2] if len(parts) == 3 else ""
    raw_suffix = f"/{subdir}" if subdir else ""
    tree_suffix = f"/tree/main/{subdir}" if subdir else ""
    pages_suffix = f"/{subdir}/" if subdir else "/"

    for rel_path in REPO_URL_FILES:
        path = ROOT / rel_path
        if not path.exists():
            continue
        content = path.read_text(encoding="utf-8")
        updated = content

        # Update github.com/<owner>/<repo>[/tree/main/<subdir>]
        updated = re.sub(
            r"github\.com/(?!\$\{)[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+(?:/tree/main/[A-Za-z0-9_.-]+)?(?=\.git\b|/|\)|\"|'|\s|$)",
            f"github.com/{owner}/{repo}{tree_suffix}",
            updated,
        )
        # Update raw.githubusercontent.com/<owner>/<repo>/main[/<subdir>]
        updated = re.sub(
            r"raw\.githubusercontent\.com/(?!\$\{)[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+/main(?:/[A-Za-z0-9_.-]+)?(?=/install\.|\"|'|\s|$)",
            f"raw.githubusercontent.com/{owner}/{repo}/main{raw_suffix}",
            updated,
        )
        # Update GitHub Pages URL https://<owner>.github.io/<repo>[/<subdir>/]
        updated = re.sub(
            r"https://[A-Za-z0-9_.-]+\.github\.io/[A-Za-z0-9_.-]+(?:/[A-Za-z0-9_.-]+)?/?",
            f"https://{owner}.github.io/{repo}{pages_suffix}",
            updated,
        )
        # Update PowerShell variables in install.ps1
        updated = re.sub(
            r'\$RepoOwner\s*=\s*"[A-Za-z0-9_.-]+"',
            f'$RepoOwner = "{owner}"',
            updated,
        )
        updated = re.sub(
            r'\$RepoName\s*=\s*"[A-Za-z0-9_.-]+"',
            f'$RepoName = "{repo}"',
            updated,
        )
        if subdir:
            updated = re.sub(
                r'\$RepoSubDir\s*=\s*"[A-Za-z0-9_.-]*"',
                f'$RepoSubDir = "{subdir}"',
                updated,
            )
        if updated != content:
            newline = "\r\n" if rel_path.endswith(".ps1") else "\n"
            path.write_text(updated, encoding="utf-8", newline=newline)
            print(f"[UPDATED REPO SLUG -> {slug}] {rel_path}")
        else:
            print(f"[NO CHANGE] {rel_path}")
    return True


def run_quality_checks() -> bool:
    ok = sync_rules(check_only=True)

    # 1. Verify 65-Point Audit consistency across core files
    for fname in ["SYSTEM_DESIGN_MASTER_BRAIN.md", "SKILL.md", "README.md", "index.html"]:
        fpath = ROOT / fname
        text = fpath.read_text(encoding="utf-8")
        if "65-Point" not in text and "65-point" not in text:
            print(f"[FAIL] {fname} is missing 65-Point Audit reference.")
            ok = False
        if re.search(r"\b(55|60)-[Pp]oint\b", text):
            print(f"[FAIL] {fname} still contains stale '55-Point' or '60-Point' reference.")
            ok = False

    # 2. Verify legacy .windsurfrules file is removed
    if (ROOT / ".windsurfrules").exists():
        print("[FAIL] Deprecated .windsurfrules file still exists in repository.")
        ok = False

    # 3. Verify all internal #anchor links in index.html resolve to existing id="..." attributes
    html_text = (ROOT / "index.html").read_text(encoding="utf-8")
    html_ids = set(re.findall(r'\bid="([^"]+)"', html_text))
    html_hrefs = re.findall(r'\bhref="#([^"]+)"', html_text)
    broken_anchors = [a for a in html_hrefs if a and not a.startswith("${") and a not in html_ids]
    if broken_anchors:
        print(f"[FAIL] index.html contains broken internal #anchor links: {broken_anchors}")
        ok = False
    else:
        print(f"[OK] All {len(html_hrefs) - 1} internal #anchor links in index.html resolve cleanly.")

    # 4. Verify install.ps1 is pure ASCII for Windows PowerShell 5.1 compatibility
    ps1_bytes = (ROOT / "install.ps1").read_bytes()
    non_ascii = [b for b in ps1_bytes if b > 127]
    if non_ascii:
        print(f"[FAIL] install.ps1 contains {len(non_ascii)} non-ASCII bytes (breaks Windows PowerShell 5.1).")
        ok = False
    else:
        print("[OK] install.ps1 is 100% pure ASCII.")

    # 5. Verify zero local path leaks or deprecated windsurf references in tracked files
    leak_patterns = [
        re.compile(r"C:\\Users\\", re.IGNORECASE),
        re.compile(r"/Users/[A-Za-z0-9_-]+/Desktop", re.IGNORECASE),
        re.compile(r"windsurf", re.IGNORECASE),
    ]
    for path in ROOT.rglob("*"):
        if path.is_dir() or ".git" in path.parts or path.name == "sync.py":
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except Exception:
            continue
        for pat in leak_patterns:
            if pat.search(text):
                print(f"[FAIL] Forbidden pattern '{pat.pattern}' found in {path.relative_to(ROOT)}")
                ok = False

    if ok:
        print("\n[SUCCESS] All 8 IDE/Agent rule files, playbooks, installers, anchors, and anonymity checks passed!")
    return ok


def main() -> int:
    parser = argparse.ArgumentParser(description="Synchronize and verify System Design Master Brain files.")
    parser.add_argument("--check", action="store_true", help="Verify all files are synchronized and pass audit checks.")
    parser.add_argument("--set-repo", metavar="OWNER/REPO", help="Set GitHub repository owner/name across all files.")
    args = parser.parse_args()

    if args.set_repo:
        if not set_repository_slug(args.set_repo):
            return 1

    if args.check:
        return 0 if run_quality_checks() else 1

    if not sync_rules(check_only=False):
        return 1
    return 0 if run_quality_checks() else 1


if __name__ == "__main__":
    sys.exit(main())
