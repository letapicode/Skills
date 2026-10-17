# Contributing to System Design Master Brain

Thank you for your interest in contributing to the **System Design Master Brain**! This repository is designed to be an open-source, self-evolving knowledge engine that equips AI agents and human architects with implementation-grade distributed systems and AI infrastructure design patterns.

We welcome contributions from engineers, architects, and researchers worldwide.

---

## Core Contribution Principles

Every contribution must adhere to three foundational standards:

1. **No Hand-Wavy Architecture (Zero-Fluff Rule)**:
   - Submissions must NOT rely solely on generic boxes and arrows or marketing buzzwords.
   - You must provide concrete mathematical sizing, byte/memory layouts, SQL schemas, isolation levels, caching strategies, compiler/GPU physics, or network protocols.

2. **Strict Anonymity & Neutrality**:
   - Do NOT include any personal names, author attributions, private course references, proprietary company secrets, or identifying anecdotes.
   - All knowledge must be framed objectively as neutral, first-principles distributed systems and AI engineering.

3. **Sketch-to-Scale Discipline**:
   - Always demonstrate the evolutionary path:
     `Attempt 1 (Baseline / Day-0 Monolith) -> Bottleneck -> Attempt 2 -> Bottleneck -> Final Scaled Architecture`.
   - Explicitly justify why simpler designs fail before introducing distributed or multi-node complexity.

---

## What You Can Contribute

### 1. Adding a New Architecture Module (e.g., Module 29+)
To propose a new module (or use **Part VI Prompt 2 / Prompt 3** to have a frontier AI model synthesize one), ensure it contains the following subsections:
- **X.1 Theoretical Foundations & Math**: Define the core problem with first-principles formulas (e.g., write amplification, KV-cache memory bytes, network throughput, memory overhead).
- **X.2 The Baseline & Bottleneck Evolution**: Show why the naive single-node or standard relational/inference approach fails under load.
- **X.3 Production Architecture & Schemas**: Provide explicit table definitions (`CREATE TABLE`), index choices, Redis Lua scripts, compiler flags, or wire protocols.
- **X.4 Hidden Edge Cases & Failure Modes**: Document at least 4–6 non-obvious crash, race-condition, OOM, or partial failure scenarios and their exact production fixes.

### 2. Expanding the 60-Point Red-Team Audit Checklist
If you encountered a critical production outage or subtle concurrency/AI-serving bug in your systems (e.g., clock skew, connection pool starvation, tombstone explosion, XLA dynamic-shape recompilation, MoE expert routing collapse):
- Frame it as an actionable verification question.
- Specify the exact failure mechanism.
- Provide the concrete production mitigation or architectural rule.

### 3. Adding Production Benchmarks & First-Principles Sizing
- Update storage sizing, network latency numbers, GPU HBM bandwidth, or memory layout tables with verified benchmarks from modern NVMe, DDR5, H100/B200 GPUs, 400GbE/InfiniBand, or modern database releases.

---

## Pull Request Guidelines

1. **Fork the Repository**: Create a feature branch (e.g., `git checkout -b feature/module-29-time-series-storage`).
2. **Update & Synchronize All Files**:
   - Add module content into `SYSTEM_DESIGN_MASTER_BRAIN.md` and update `SKILL.md`.
   - Run `python sync.py` to automatically synchronize all IDE rule files (`AGENTS.md`, `CLAUDE.md`, `.cursor/rules/system-design-master-brain.mdc`, `.cursorrules`, `.windsurfrules`, `.codeiumrules`, `.clinerules`, `.github/copilot-instructions.md`), re-render `index.html`, and verify 100% anonymity.
3. **Verify Anonymity & Sync**:
   ```bash
   python sync.py --check
   ```
4. **Submit a Clean PR**: Write a descriptive PR title and summarize:
   - What real-world problem or architectural pattern this addresses.
   - The concrete formulas, schemas, or pseudocode introduced.
   - The edge cases and failure modes covered.

---

## Community Code of Conduct
We are committed to providing a welcoming, constructive, and rigorous technical environment. Feedback on PRs will focus purely on technical correctness, clarity of trade-offs, and first-principles reasoning.
