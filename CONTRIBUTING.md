# Contributing to System Design Master Brain

Thank you for your interest in contributing to the **System Design Master Brain**! This repository is designed to be an open-source, living knowledge engine that equips AI agents and human architects with implementation-grade distributed systems design patterns.

We welcome contributions from engineers, architects, and researchers worldwide.

---

## Core Contribution Principles

Every contribution must adhere to three foundational standards:

1. **No Hand-Wavy Architecture**:
   - Submissions must NOT rely solely on generic boxes and arrows.
   - You must provide concrete mathematical sizing, byte layouts, SQL schemas, isolation levels, caching strategies, or network protocols.

2. **Strict Anonymity & Neutrality**:
   - Do NOT include any personal names, author attributions, private course references, proprietary company secrets, or identifying anecdotes.
   - All knowledge must be framed objectively as neutral, first-principles distributed systems engineering.

3. **Sketch-to-Scale Discipline**:
   - Always demonstrate the evolutionary path:
     `Attempt 1 (Baseline / Day-0 Monolith) -> Bottleneck -> Attempt 2 -> Bottleneck -> Final Scaled Architecture`.
   - Explicitly justify why simpler designs fail before introducing distributed complexity.

---

## What You Can Contribute

### 1. Adding a New Architecture Module (e.g., Module 26+)
To propose a new module, ensure it contains the following subsections:
- **X.1 Theoretical Foundations & Math**: Define the core problem with first-principles formulas (e.g., write amplification, network throughput, memory overhead).
- **X.2 The Baseline & Bottleneck Evolution**: Show why the naive single-node or standard relational approach fails under load.
- **X.3 Production Architecture & Schemas**: Provide explicit table definitions (`CREATE TABLE`), index choices, Redis data structures, or wire protocols.
- **X.4 Hidden Edge Cases & Failure Modes**: Document at least 3 non-obvious crash, race-condition, or partial failure scenarios.

### 2. Expanding the 30-Point Red-Team Audit Checklist
If you encountered a critical production outage or subtle concurrency bug in your systems (e.g., clock skew, connection pool starvation, tombstone explosion):
- Frame it as an actionable verification question.
- Specify the exact failure mechanism.
- Provide the concrete production mitigation or architectural rule.

### 3. Adding Production Benchmarks & First-Principles Sizing
- Update storage sizing, network latency numbers, or memory layout tables with verified benchmarks from modern NVMe, DDR5, 100GbE, or modern database releases.

---

## Pull Request Guidelines

1. **Fork the Repository**: Create a feature branch (e.g., `git checkout -b feature/module-26-time-series-storage`).
2. **Update the Files**:
   - Add module content into `SYSTEM_DESIGN_MASTER_BRAIN.md`.
   - Update the table of contents in `SKILL.md` and `README.md`.
   - If introducing a new universal rule, update `.cursorrules` and `.windsurfrules`.
3. **Verify Anonymity**: Run a scan across your diff to guarantee zero personal, private, or proprietary identifiers:
   ```bash
   git diff main -- ':!*.lock' | grep -iE "author|proprietary|confidential"
   ```
4. **Submit a Clean PR**: Write a descriptive PR title and summarize:
   - What real-world problem or architectural pattern this addresses.
   - The concrete formulas or schemas introduced.
   - The edge cases and failure modes covered.

---

## Community Code of Conduct
We are committed to providing a welcoming, constructive, and rigorous technical environment. Feedback on PRs will focus purely on technical correctness, clarity of trade-offs, and first-principles reasoning.
