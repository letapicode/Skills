# System Design Master Brain 🧠⚡

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Compatible with Claude](https://img.shields.io/badge/Claude%20Code%20%2F%20Claude.ai-Compatible-d97706.svg)]()
[![Compatible with OpenAI Codex / Copilot](https://img.shields.io/badge/OpenAI%20Codex%20%2F%20Copilot-Compatible-000000.svg)]()
[![Compatible with DeepSeek / Cline](https://img.shields.io/badge/DeepSeek%20%2F%20Cline%20%2F%20Llama-Compatible-4d6bfe.svg)]()
[![Compatible with Devin](https://img.shields.io/badge/Devin%20%28Cognition%29-Compatible-6366f1.svg)]()
[![Compatible with Codeium](https://img.shields.io/badge/Codeium-Compatible-09b6a2.svg)]()
[![Compatible with Cursor](https://img.shields.io/badge/Cursor-Compatible-000000.svg)]()
[![Compatible with Antigravity / Gemini](https://img.shields.io/badge/Antigravity%20%2F%20Gemini-Compatible-ea4335.svg)]()
[![Live Documentation](https://img.shields.io/badge/Live%20Docs-GitHub%20Pages-success.svg)](https://letapicode.github.io/SystemDesignSkill/)

> **Transform any AI coding assistant into a self-evolving Staff/Principal Systems & AI Architect—for Distributed Systems, Frontier AI/Multi-Agent/JAX Infrastructure, and Real Production Codebases at Million-User Scale.**  
> Grounded in **28 production-grade distributed & AI systems modules**, first-principles capacity math, Day-0 monolith baselines, an **Uncharted-Domain Deep-Research Fallback**, a **Future-Model Self-Upgrade Engine**, and an exhaustive **65-point red-team audit**.
>
> 📖 **Read the live web documentation**: [System Design Master Brain on GitHub Pages](https://letapicode.github.io/SystemDesignSkill/)

---

## Why System Design Master Brain?

Standard AI models fail at real-world systems and AI engineering in three predictable ways:
1. **In Architecture & AI Design Mode**: They draw hand-wavy microservice and multi-agent box diagrams on Day 0 without calculating bytes, GPU HBM / KV-Cache footprints, SRAM vs. HBM roofline limits, IOPS, or proving why a single vertical RDBMS node saturates.
2. **In Real Codebases**: They write naive SQL migrations that trigger metadata-lock outages, place external HTTP/LLM calls inside DB transactions, pass dynamic shapes to `@jax.jit` (triggering 30s XLA recompilation freezes), stack $3^4 = 81\times$ retry storms, and drop in-flight requests during Kubernetes rolling restarts.
3. **In Uncharted or Post-Cutoff Domains**: When asked about a specialized domain outside their static templates, they hallucinate vague textbook summaries instead of formulating targeted primary-literature research queries and deriving the design from hardware physics invariants.

**System Design Master Brain** fixes all three by embedding a **Self-Evolving Dual-Mode Principal Systems & AI Architect Engine** into your AI tools:

```
┌────────────────────────────────────────────────────────────────────────────┐
│ MODE A: Architecture, Distributed Systems & Frontier AI RFCs               │
├────────────────────────────────────────────────────────────────────────────┤
│ [1. Socratic Interrogation] ──▶ Force qualitative words into P99 ms & RPS  │
│ [2. Capacity & GPU Math]    ──▶ Compute RAM, KV-Cache, SRAM/HBM & Ports    │
│ [3. Day-0 Monolith]         ──▶ Prove single-node limits before sharding   │
│ [4. Sketch-to-Scale]        ──▶ Attempt 1 ──▶ Bottleneck ──▶ Production    │
│ [5. Implementation Depth]   ──▶ SQL, Lua, DeepSeek, Meta Muse, Multi-Agent │
│ [6. 65-Point Red-Team Audit]──▶ Audit for split-brain, stampedes & races   │
└────────────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────┐
│ MODE B: Real-Codebase Implementation, PR Review & Production Debugging     │
├────────────────────────────────────────────────────────────────────────────┤
│ • Zero network/LLM calls inside DB transactions (Transactional Outbox)     │
│ • Canonical lock ordering (ORDER BY id ASC FOR UPDATE) & SKIP LOCKED       │
│ • Lease-backed idempotency, UUIDv7 locality & 53-bit JSON string IDs       │
│ • Zero-downtime DDL migrations (SET lock_timeout='2s', Expand-Contract)    │
│ • Prefix-cache prompt alignment, Git worktree agent isolation & JAX buckets│
│ • Postgres HOT/Subxid SLRU, CLOCK_MONOTONIC, RE2, K8s ndots:2 & SIGTERM    │
└────────────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────┐
│ LIVING BACKBONE: Deep-Research Fallback & Future-Model Self-Evolution      │
├────────────────────────────────────────────────────────────────────────────┤
│ • Uncharted Domain? Formulates 3-5 surgical SOSP/OSDI/MLSys research       │
│   queries & synthesizes a Sketch-to-Scale architecture from physics laws   │
│ • New Frontier Model Released? Built-in Self-Upgrade Prompt audits and     │
│   evolves the entire playbook & re-syncs all IDE rules with zero fluff     │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## ⚡ 1-Line Universal Install

Install the skill across your AI tools (or directly into your current project workspace) with a single terminal command:

### macOS & Linux
```bash
curl -fsSL https://raw.githubusercontent.com/letapicode/SystemDesignSkill/main/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/letapicode/SystemDesignSkill/main/install.ps1 | iex
```

*What the installer does automatically (and safely):*
1. Installs the global skill for **Claude Code** (`~/.claude/skills/system-design-master-brain/`).
2. Installs the global skill, UI metadata (`agents/openai.yaml`), & global `AGENTS.md` rules for **Devin (by Cognition)** and **OpenAI ChatGPT Desktop App (Codex Mode) / Codex CLI** (`~/.agents/skills/system-design-master-brain/`, `~/.codex/skills/system-design-master-brain/`, and `~/.config/devin/AGENTS.md`).
3. Installs the global skill for **Google Antigravity & Gemini** (`~/.gemini/skills/system-design-master-brain/`) and **Cursor** (`~/.cursor/skills/system-design-master-brain/`).
4. When run with `--workspace` (or `-Workspace` in PowerShell) inside a project repository, **non-destructively** merges rules for **Devin / OpenAI Codex / OpenCode / Aider** (`AGENTS.md` + `.agents/skills/system-design-master-brain/SKILL.md`), **GitHub Copilot** (`.github/copilot-instructions.md`), **Claude Code** (`CLAUDE.md`), **DeepSeek / Llama / Cline / Roo Code** (`.clinerules`), **Codeium** (`.codeiumrules`), **Cursor** (`.cursor/rules/system-design-master-brain.mdc` + `.cursorrules`), and the complete 28-module [`SYSTEM_DESIGN_MASTER_BRAIN.md`](SYSTEM_DESIGN_MASTER_BRAIN.md) directly into your workspace (updating between HTML comment markers so your existing project rules are never lost).

---

## 🛠 Manual Installation by Tool

| Platform | Setup Instructions |
|---|---|
| **Devin (Cognition Autonomous Engineer & IDE)** | Copy `AGENTS.md`, `.agents/skills/system-design-master-brain/SKILL.md`, and `SYSTEM_DESIGN_MASTER_BRAIN.md` into your repository root (or `~/.config/devin/AGENTS.md` and `~/.agents/skills/system-design-master-brain/` globally) |
| **OpenAI ChatGPT Desktop App (Codex Mode) & Codex Desktop App** | Run the 1-line installer (which installs `SKILL.md`, `agents/openai.yaml`, and `SYSTEM_DESIGN_MASTER_BRAIN.md` to `~/.agents/skills/system-design-master-brain/` and `~/.codex/skills/system-design-master-brain/` so it appears directly in your **Skills Sidebar** and via `$system-design-master-brain`), and places `AGENTS.md` in your project root |
| **OpenAI Codex CLI & Cloud Agent** | Copy `AGENTS.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to your project root (or `~/.codex/skills/system-design-master-brain/` globally) |
| **GitHub Copilot (VS Code / JetBrains)** | Copy `.github/copilot-instructions.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` into your repository root |
| **Claude Code (CLI & Desktop)** | Copy `SKILL.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to `~/.claude/skills/system-design-master-brain/`, or place `CLAUDE.md` in your project root |
| **DeepSeek / Llama / Qwen (via Cline / Roo / OpenCode)** | Copy `.clinerules` and `AGENTS.md` into your project root, or attach `SYSTEM_DESIGN_MASTER_BRAIN.md` in chat |
| **Codeium (VS Code / JetBrains)** | Copy `.codeiumrules` and `SYSTEM_DESIGN_MASTER_BRAIN.md` into the root directory of your project |
| **Cursor** | Copy `.cursor/rules/system-design-master-brain.mdc` (or `.cursorrules`) and `SYSTEM_DESIGN_MASTER_BRAIN.md` into your project |
| **Antigravity / Gemini** | Copy `SKILL.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to `~/.gemini/skills/system-design-master-brain/` |
| **ChatGPT / Claude.ai / DeepSeek Web** | Attach `SYSTEM_DESIGN_MASTER_BRAIN.md` and paste one of the [3 Ready-to-Use Prompts](#-3-ready-to-use-prompts-daily-use-deep-research--future-model-self-upgrade) |

---

## 📚 The 28 Core Architecture, AI & Production Modules

The master brain contains complete end-to-end specifications, schemas, mathematical proofs, and hidden failure modes across **28 architectural pillars**:

| Module | Architectural Domain | Core Topics, Schemas & Hidden Edge Cases |
|:---:|---|---|
| **01** | **Real-Time Presence & DB Internals** | B+ Tree fill-factors, Connection pooling math, SingleFlight cache stampede coalescing |
| **02** | **Scaling & Protocol Routing** | ProxySQL wire-protocol routing, Async SQS/Kafka delegation, WebSockets vs. SSE, Naked WSS DMZ |
| **03** | **Concurrency & Relational KV** | `FOR UPDATE SKIP LOCKED`, `NOWAIT`, Optimistic OCC, Building a distributed KV store on RDBMS |
| **04** | **Non-Relational & Slack Architecture** | Columnar RLE, Wide-Column tombstones, Graph supernode traps, Slack real-time gateway architecture |
| **05** | **Load Balancing & Distributed Locks** | Regional L7 LB, Remote vs. Distributed locks, Redlock quorum release & monotonic fencing tokens |
| **06** | **Distributed IDs & Sharding** | Snowflake 64-bit layout & NTP drift, `UUIDv7` locality, 53-bit JSON string IDs, `8,192` logical shards |
| **07** | **CDN Internals & Direct Storage** | Toy CDN in 63 lines, Presigned S3 uploads (`content-length-range`), Proof-of-Ownership challenge |
| **08** | **Write Batching & Hot Counters** | 5-Stage STW batching evolution (Double-Buffered Pointer Swap), Sliding window hashtags, Unread dots |
| **09** | **C-Level Caching & Consistent Hash** | Redis `robj`, `epoll`, 16-sample LRU, `fork()` CoW + `THP=never` OOM guard, $\ge 256$ vnode hash rings |
| **10** | **Storage Engines Part 2: Bitcask** | 1 TB single-file word dictionary (`uint64`), Append-only datafile, Hint file, Leftmost CRC32 torn writes |
| **11** | **Storage Engines Part 3: LSM Trees** | MemTable (SkipList), WAL, SSTables, Leveled compaction, Deletable Bloom filters, S3 cold tiering |
| **12** | **Live Video & Object Storage** | HLS `.m3u8` at 20M concurrents, Origin Shield collapsing, S3 Storage Stamps & Reed-Solomon erasure coding |
| **13** | **Search Engines & Multi-Tenancy** | Inverted index, BK-Tree, Metaphone, 3 Hot-key solutions, Size-aware dynamic shard split routing |
| **14** | **Distributed Schedulers & Flash Sales** | One-time/cron job pullers, Unit tech economics, Flash sale unrolled rows, SLA rebalancing |
| **15** | **Probabilistic Data & File Sync** | HyperLogLog harmonic mean math, Dropbox content-addressable chunking & recursive SQLite paths |
| **16** | **Geo-Proximity & Social Graph** | GeoHash Base32 interleaving & 8-neighbor lookup, Stateless 5s ride matching, FlockDB clustered PK |
| **17** | **Distributed Consensus** | Raft state machine, `ReadIndex` zombie-leader protection, `PreVote` protocol, Dedicated WAL NVMe |
| **18** | **Distributed Transactions** | Sagas (Orchestration vs. Choreography), Out-of-order cancel tombstones, Transactional Outbox & Inbox |
| **19** | **Financial Ledgers & Payments** | Immutable double-entry bookkeeping, Canonical lock ordering (`ORDER BY id ASC`), $K=64$ sharded hot accounts |
| **20** | **SRE Resiliency Patterns** | Circuit breakers, Full Jitter, $10\%$ Retry Budgets, LIFO + CoDel, `CLOCK_MONOTONIC`, Cross-AZ routing |
| **21** | **Security & Auth at Scale** | Refresh token family theft revocation, Google Zanzibar ReBAC & Zookies, SSRF dialer, `ReDoS`-safe `RE2` |
| **22** | **Stream Processing & State** | Apache Flink event time, `withIdleness()` watermarks, RocksDB `StateTtlConfig`, Cooperative rebalancing |
| **23** | **Observability & Tracing** | OpenTelemetry W3C TraceContext, Tail-based sampling, $<1,000$ metric label cardinality law, Histogram merge |
| **24** | **Vector DBs, Hybrid RAG & LLM Engines** | HNSW & Binary Quantization, Hybrid RRF + Cross-Encoder, KV-Cache math, PagedAttention & RadixAttention (`cache_salt`) |
| **25** | **Service Mesh & Modern RPC** | gRPC L7/Headless load balancing, HTTP/2 channel pools, Protobuf `reserved` tags, GraphQL DataLoader |
| **26** | **Production Codebase Engineering** | Zero-downtime DDL (`lock_timeout`, Expand-Contract), Postgres HOT/Subxid SLRU, K8s `ndots:2` & `SIGTERM` drain |
| **27** | **Frontier AI Part 1: Decision APIs, DeepSeek, Meta Muse & RecSys** | Prefix-cache prompt layout, FSM JSON decoding, DeepSeek MLA/MoE, Disaggregated Prefill/Decode, Meta Muse parallel tokens, 4-stage RecSys |
| **28** | **Frontier AI Part 2: Multi-Agent DAGs, JAX/XLA & GPU Clusters** | Context-isolated subagents, Git worktree sandboxes, JAX/XLA static shape buckets, 4D Parallelism, `NCCL` watchdogs & RLHF rollout determinism |

---

## 🛡 The 65-Point Master Red-Team Audit

Before any system design or production pull request is approved, the AI audits it against 65 real-world failure modes:

<details>
<summary><b>Click to expand all 65 Red-Team Audit Checks</b></summary>

### Core Architecture, SQL & Storage Checks (1–30)
1. **Day-0 Over-Engineering**: Did we introduce Kafka/sharding before proving a single vertical node cannot handle it?
2. **Unquantified Words**: Did any *"fast"* or *"scalable"* slip through without ms/RPS numbers?
3. **Network Call Inside DB Transaction**: Does any DB transaction hold locks across an HTTP/SQS/Redis/Kafka call?
4. **Single-Statement Transaction**: Are standalone `INSERT`/`UPDATE`s wrapped in unnecessary `BEGIN...COMMIT`?
5. **Unbounded DELETE Trap**: Are soft-deletes scanned without composite indexes and `ORDER BY id ASC LIMIT 100` reapers?
6. **Upsert & Index**: Is `INSERT ... ON DUPLICATE KEY UPDATE` used instead of `REPLACE INTO`, backed by covering indexes?
7. **High-Contention Inventory**: Is `FOR UPDATE SKIP LOCKED` used for interchangeable pools and `NOWAIT` for specific seats?
8. **Cache Stampede & Punching Bag**: Is SingleFlight (`sem_map` + `res_map`) or 90%-TTL prefreshing used for hot cache misses?
9. **WebSocket Port Exhaustion**: Are unidirectional streams using SSE/CDN-polling, and $>65\text{k}$ sockets using naked WSS DMZ nodes?
10. **Half-Open TCP Sockets**: Are bidirectional application-level `PING/PONG` heartbeats active?
11. **Stop-The-World Batching**: Does in-memory batching use non-blocking Active-Passive Double Buffering (pointer swap)?
12. **Push vs. Pull Config Race**: Are hybrid Push+Pull config updates guarded by `incoming.version > local.version`?
13. **Distributed Lock Fencing**: Do distributed locks use atomic Lua release and monotonically increasing fencing tokens?
14. **Binary Relay & CDN URL**: Are file uploads sent directly to S3 via presigned URLs (`content-length-range`), storing only `image_id`?
15. **Storage Engine I/O**: Are offsets `uint64`, reads `fseek`+`fread`, CRC32 prefixes leftmost, and LSM tombstones kept to $L_{\max}$?
16. **Regular Flow == Error Flow**: Do zero-data-loss ingestion servers spool to local disk first with 70%-disk LB self-detachment?
17. **Multi-Tenant Hot-Shard**: Do stateful DBs use logical shards (`8,192`) and search indices use dynamic split routing?
18. **Stateless Self-Healing Pulse**: Is static metadata piggybacked onto 5s heartbeats so wiped nodes self-heal in 5 seconds?
19. **Connection Pool In-Flight Eviction**: Are expired DB connections closed strictly inside `pool.Put(conn)` after query completion?
20. **Read-Your-Own-Writes**: Are post-write reads pinned to the Primary DB for $5\text{–}10\text{s}$ (or GTID-gated)?
21. **Poison Pill DLQ**: Do consumers cap retries at $\le 3$ before routing malformed payloads to a DLQ?
22. **Unindexed `FOR UPDATE`**: Are all locked queries verified via `EXPLAIN` to hit a narrow index instead of escalating to table locks?
23. **S3 Multipart Abandonment**: Is `AbortIncompleteMultipartUpload` (7 days) configured on every S3 bucket?
24. **Graph Supernodes**: Are celebrity 1-to-N follower lists stored in clustered relational tables (FlockDB) rather than graph pointers?
25. **Cassandra Tombstone Overload**: Are high-frequency deletes avoided in wide-column stores in favor of time-partitioned table drops?
26. **Snowflake Clock Drift**: Does the ID generator handle backward NTP steps ($\le 5\text{ms}$ wait, $>5\text{ms}$ fail-fast)?
27. **Proof-of-Ownership**: Are deduplicated content-addressed files verified with a random byte-range challenge?
28. **Consistent Hashing Domino**: Are virtual nodes ($V \ge 256$) deployed to distribute node failure load uniformly?
29. **Live Video Manifest Herd**: Are HLS `.m3u8` manifests protected by an Origin Shield with request collapsing?
30. **GeoHash Boundaries**: Does spatial proximity search query the center cell plus all **8 adjacent neighbor cells**?

### Distributed Consensus, Transactions, Resiliency & Production Codebase Checks (31–45)
31. **Consensus Zombie-Leader & `PreVote`**: Are linearizable Raft reads protected by `ReadIndex`/Leases, and is `PreVote` enabled?
32. **Stuck Idempotency Key & Parameter Tampering**: Do `PROCESSING` idempotency keys have a `locked_until` lease and `SHA256(body)` `422` verification?
33. **Out-of-Order Saga Cancel & CDC Inbox**: Do early `Cancel` requests write a `CANCELLED` tombstone row, and do CDC consumers deduplicate via an `inbox` table?
34. **Ledger Canonical Lock Ordering & Hot Accounts**: Are multi-account locks sorted (`ORDER BY id ASC FOR UPDATE`) and hot merchant accounts sharded into $K=64$ sub-accounts?
35. **$3^4$ Retry Amplification & Retry Budget**: Are retries restricted to a single layer with Full Jitter and a $\le 10\%$ process retry budget?
36. **Overload LIFO/CoDel & Failover DNS**: Do overloaded queues shed expired requests via CoDel/LIFO, and do DB pools use `5s` DNS TTL + `READONLY` eviction?
37. **Refresh Token Family & Multi-Tenant BOLA**: Does reused refresh token detection revoke the entire `token_family_id`, and is `tenant_id` in composite PKs/RLS?
38. **Stream Idle-Partition Watermark & State TTL**: Does Flink configure `withIdleness()` for quiet partitions and `StateTtlConfig` on all RocksDB state?
39. **High-Cardinality Metric Explosion**: Are `user_id`, `order_id`, and raw URLs excluded from Prometheus/Datadog metric labels ($<1,000$ series per metric)?
40. **Vector Pre-Filtering & Semantic Cache Scope**: Does multi-tenant vector search use payload-aware pre-filtering, and is the Semantic Cache namespaced by `(tenant_id, user_id, scope_hash)`?
41. **gRPC L4 Pinning & Channel Pool**: Does gRPC use L7 Envoy/Linkerd or headless round-robin DNS (plus `MaxConnectionAge`) to avoid single-pod L4 pinning?
42. **Zero-Downtime DDL `lock_timeout` & Expand-Contract**: Do migrations set `SET lock_timeout = '2s'`, use `CONCURRENTLY` / `NOT VALID`, and follow 4-phase Expand-and-Contract?
43. **Postgres MVCC HOT Updates & PgBouncer**: Are high-update Postgres tables using `fillfactor = 80` for HOT updates, `idle_in_transaction_session_timeout`, and `SET LOCAL`?
44. **Container OOMKill & K8s CPU Throttling**: Is runtime memory capped at $80\text{–}85\%$ (`GOMEMLIMIT` / `MaxRAMPercentage`) and K8s CPU `limits` throttling avoided?
45. **Kubernetes `SIGTERM` 502 Drain Race**: On `SIGTERM`, does the app fail `/readyz`, sleep $5\text{–}10\text{s}$ while continuing to serve traffic, and then drain connections?

### Frontier AI, DeepSeek MoE/MLA, Generative Media, Multi-Agent, JAX/XLA & Kernel Physics Checks (46–65)
46. **Disaggregated Prefill-vs-Decode & KV-Cache Math**: Are compute-bound Prefill nodes separated from bandwidth-bound Decode nodes (with RDMA KV transfer + MLA/GQA + PagedAttention/RadixAttention) so long prompts never stall active streaming users?
47. **MoE Expert Load-Balancing & Long-CoT Offloading**: Does MoE serving/training use Auxiliary-Loss-Free dynamic bias routing to prevent GPU expert hotspots, and does long Chain-of-Thought reasoning (`R1`/`o1`) offload KV cache to Host DRAM?
48. **Generative Media (Meta Muse / Diffusion) Queue & S-LoRA Paging**: Are image/video jobs decoupled via priority token-bucket GPU queues, using S-LoRA dynamic adapter paging in HBM and evaluating parallel masked token decoding (Meta Muse) for sub-second generation/inpainting?
49. **ML RecSys 4-Stage Funnel & Time-Travel Leakage**: Does ranking use a 4-stage cascade (`Two-Tower ANN -> Pre-Rank -> Multi-Task DLRM/MMoE -> DPP Diversity`) and log features at inference time (`request_impression_id`) to eliminate Training-Serving Skew?
50. **Autonomous Agent Checkpoints & Firecracker Sandbox**: Do multi-step agents checkpoint state before every tool call with idempotency keys, and execute untrusted code inside Firecracker MicroVMs blocking RFC1918 and `169.254.169.254`?
51. **Prompt Prefix-Cache Alignment & Deterministic Tool Keys**: Are prompts ordered strictly from Frozen Static Prefix $\to$ Sorted Tool Schemas (`sort_keys=True`) $\to$ Dynamic Suffix (never placing `now()` at the top of the system prompt)?
52. **Constrained Decoding FSM Whitespace & Complexity Cascade**: Are grammar-masked JSON decoders (`XGrammar`/`Outlines`) bounded against infinite `\n` whitespace loops, and does a lightweight router cascade simple queries to small quantized models first?
53. **Multi-Agent Context Isolation & Git Worktree Sandboxes**: Do subagents run in isolated context windows returning $\le 500$-token structured summaries + artifact paths (never dumping raw scratchpads), and do parallel coding agents use separate Git Worktrees?
54. **JAX / XLA Dynamic-Shape Recompilation & Host-Sync Barriers**: Are inputs to `@jax.jit` / `torch.compile` padded to **Static Power-of-2 Shape Buckets** with AOT warmup before `/readyz` (preventing 30s per-request recompilations), with zero `float(loss)` host syncs in the step loop?
55. **4D Parallelism NVLink Boundary & Two-Phase Async Checkpointing**: Is Tensor Parallelism ($TP=8$) kept strictly inside single-node NVLink ($900\text{ GB/s}$) while $PP/EP/FSDP$ run over InfiniBand, with $<1\text{s}$ HBM-to-Pinned-Host-RAM async checkpointing?
56. **Catastrophic Regex Backtracking (`ReDoS`) & Parser Depth**: Are untrusted inputs validated strictly with linear-time **$O(N)$ Thompson NFA regexes (`RE2`, Rust `regex`, Go `regexp`)** rather than backtracking engines, with pre-parse byte-length and JSON depth caps?
57. **`CLOCK_MONOTONIC` vs. `CLOCK_REALTIME` Elapsed Timers**: Are all timeouts, rate-limiter token refills, and circuit-breaker durations computed using **`CLOCK_MONOTONIC`** so backward NTP clock jumps never yield negative elapsed time?
58. **Outbound HTTP Pool (`MaxIdleConnsPerHost`), `TIME_WAIT` & `nf_conntrack`**: Are outbound HTTP clients tuned with `MaxIdleConnsPerHost >= 100` (avoiding Go's default of `2`), `tcp_tw_reuse = 1`, and **NodeLocal DNSCache** to prevent ephemeral port and `nf_conntrack` table exhaustion?
59. **GPU Floating-Point Non-Associativity & RLHF Rollout Logprobs**: Are exact inference-time `behavior_logprobs` persisted during RLHF/GRPO rollouts (rather than recomputed under different batch/tile shapes in the trainer) to prevent importance-sampling ratio explosions?
60. **Cloud Cross-AZ Egress Tax ($\$0.02/\text{GB}$) & Jittered `Retry-After`**: Are Kafka consumers (`client.rack`), Redis replicas, and K8s services (`topology-mode: Auto`) using **Topology/Zone-Aware Routing** to avoid $\$0.02/\text{GB}$ cross-AZ bandwidth cliffs, and do `429`/`503` responses inject random jitter into `Retry-After` headers?
61. **`UUIDv7` Locality & IEEE-754 53-Bit JSON Integer Corruption**: Are time-ordered `UUIDv7` (`16B` binary) or Snowflake IDs used instead of random `UUIDv4` to eliminate 50%-fill B+ tree page splits, and are 64-bit IDs (`> 2^53 - 1`) serialized as **JSON `string`s** so `JSON.parse()` never corrupts trailing digits?
62. **Redis `fork()` CoW + `THP` OOM & Negative-Cache Poisoning**: Are `vm.overcommit_memory = 1`, `THP = never`, and `maxmemory <= 70%` set on Redis hosts, and are `"NULL"` sentinels cached *only* on authoritative `0-row` responses ($\le 30\text{s}$ TTL)?
63. **Postgres Subtransaction `SLRU` Overflow & 6th-Execution Generic Plan**: Are nested `SAVEPOINT` / `EXCEPTION WHEN` blocks forbidden inside loops ($>64$ subxids freeze `SubtransControlLock`), and is `plan_cache_mode = force_custom_plan` set on skewed multi-tenant tables?
64. **Kubernetes `ndots:5` DNS Storm & `TCP_NODELAY` + Delayed ACK**: Are K8s Pod specs configured with `ndots: 2` + `single-request-reopen` (or trailing-dot FQDNs), and is `TCP_NODELAY = 1` + `writev` enabled to prevent $40\text{ms}$ Nagle + Delayed ACK stalls?
65. **`NCCL` Watchdog, CUDA Graph Shared Pool & Prefix-Cache Timing/Exfiltration**: Are `TORCH_NCCL_ASYNC_ERROR_HANDLING=1` + `TORCH_NCCL_HEARTBEAT_TIMEOUT_SEC=120` set, `torch.cuda.graph_pool_handle()` shared across buckets, multi-tenant KV prefix caches salted (`cache_salt`), and `CSP: img-src 'self'` + taint-tracked HITL gates enforced on untrusted tool outputs?

</details>

---

## 📋 3 Ready-to-Use Prompts: Daily Use, Deep Research & Future-Model Self-Upgrade

### Prompt 1: Daily Principal Systems & AI Architect Session Prompt
*Attach `SYSTEM_DESIGN_MASTER_BRAIN.md` to your chat and paste this prompt:*

```markdown
You are a Staff/Principal Systems & AI Architect operating with the `SYSTEM_DESIGN_MASTER_BRAIN.md` playbook (28 Modules & 65-Point Red-Team Audit).
Operate in Dual Mode depending on my request:

MODE A — SYSTEM DESIGN, AI INFRASTRUCTURE & ARCHITECTURE RFCs:
1. SOCRATIC INTERROGATION FIRST: Do NOT jump into drawing boxes or proposing microservices. First, ask targeted clarifying questions (Workload Ratio, Peak Concurrency vs. Total Volume, P99/TTFT/ITL SLA, Consistency model, Blast radius) and force every qualitative word ("fast", "huge", "real-time") into concrete numbers.
2. CAPACITY & HARDWARE MATH: Compute exact RAM, GPU HBM / KV-Cache Bytes, Disk, IOPS, Network Bandwidth, and Ephemeral Port numbers from first principles before choosing any database, serving cluster, or sharding strategy.
3. DAY-0 MONOLITH BASELINE: Formulate the simplest working implementation on a single vertical RDBMS instance with blunt SQL and pseudocode. Calculate the exact numerical threshold where it breaks.
4. SKETCH-TO-SCALE EVOLUTION: Walk through Attempt 1 -> Bottleneck -> Attempt 2 -> Bottleneck -> Final Architecture using the Framework of Opposites.
5. IMPLEMENTATION DEPTH: Provide concrete SQL schemas with composite covering indexes, locking modes (FOR UPDATE SKIP LOCKED), Redis Lua scripts, AI/compiler architectures (DeepSeek MLA/MoE, Disaggregated Prefill/Decode, Meta Muse masked parallel decoding, Multi-Agent worktree DAGs, JAX/XLA static shape bucketing), and idempotency guarantees.
6. UNCHARTED-DOMAIN DEEP-RESEARCH FALLBACK: If my problem involves a domain not covered in Modules 01–28, execute the Part VI Deep-Research Protocol—formulate surgical research queries for primary systems papers/specs, anchor to hardware physics invariants, and synthesize a zero-fluff Sketch-to-Scale architecture.

MODE B — REAL-CODEBASE IMPLEMENTATION, PR REVIEW & DEBUGGING:
- Inspect the code, SQL queries, migrations, and configs directly without stalling on abstract whiteboard questions.
- Enforce: zero network/LLM calls inside DB transactions, canonical lock ordering (ORDER BY id ASC FOR UPDATE), lease-backed idempotency keys with SHA-256 parameter checks, single-layer Full-Jitter retries with a 10% retry budget, zero-downtime DDL migrations (SET lock_timeout = '2s', CREATE INDEX CONCURRENTLY, Expand-and-Contract), linear-time RE2 regexes, CLOCK_MONOTONIC elapsed timers, JAX/XLA static shape padding, and graceful K8s SIGTERM drain.

7. 65-POINT RED-TEAM AUDIT: Conclude every design or code review by auditing it against the 65-Point Red-Team Checklist from the playbook.
```

---

### Prompt 2: The "Uncharted Domain" Deep-Research & First-Principles Synthesis Prompt
*Use this when your project involves a specialized domain not covered in Modules 01–28 (e.g., FPGA/DPDK kernel-bypass trading, satellite mesh networking, ROS2 robotics, or a brand-new hardware/AI paradigm):*

```markdown
I need to design or debug a system in a specialized domain: [DESCRIBE YOUR SYSTEM / PROBLEM HERE].

Do NOT give me a generic textbook overview or buzzword summary. Execute the Part VI Uncharted-Domain Deep-Research Protocol from `SYSTEM_DESIGN_MASTER_BRAIN.md`:
1. Map my problem onto the 5 Hardware & Physics Invariants (Compute/Memory Hierarchy, Bandwidth/Latency Floor, Contention Profile, Crash Recovery/Durability, and Blast Radius).
2. Identify what specific internal mechanics, protocols, or hardware constraints are not covered in Modules 01–28, formulate 3–5 surgical deep-research queries targeting primary systems literature (OSDI/SOSP/MLSys papers, RFCs, kernel specs, engineering postmortems), and run deep research (or tell me what to fetch if offline).
3. Build the complete design from first principles using the Sketch-to-Scale progression:
   - Attempt 1 (Blunt Day-0 Baseline + exact pseudocode/math) -> Exact numerical bottleneck -> Attempt 2 -> Final Production Architecture.
4. Surface at least 5 extreme, non-obvious production edge cases (race conditions, crash-in-the-middle, hardware/kernel traps) and their exact fixes.
5. Format the output so it can be appended directly as a new Module in `SYSTEM_DESIGN_MASTER_BRAIN.md`.
```

---

### Prompt 3: The "New Frontier Model" Self-Upgrade & Playbook Evolution Prompt
*Whenever a newer, smarter AI model is released in the future, run this prompt inside the `SystemDesignSkill` repo so the new model upgrades the entire playbook automatically:*

```markdown
You are running as a new frontier AI model tasked with upgrading the `SystemDesignSkill` repository so it remains the gold-standard Principal Systems & AI Architect brain.

Follow these strict rules:
1. READ & AUDIT THE ENTIRE REPOSITORY:
   - Read `SYSTEM_DESIGN_MASTER_BRAIN.md` and `SKILL.md` completely.
2. IDENTIFY HIGH-VALUE UPGRADES (ZERO FLUFF / ZERO BULLSHIT RULE):
   - Compare the 28 modules and 65 red-team checks against your latest engineering knowledge, new hardware generations (GPUs/TPUs/NICs/NVMe), new database/storage internals, new compiler/runtime mechanics, and new AI/agent architectures.
   - NEVER add vague buzzwords, marketing summaries, or high-level filler. Every addition MUST include:
     a) Concrete capacity/latency math and hardware numbers.
     b) Sketch-to-Scale evolution (`Attempt 1 -> Exact Bottleneck -> Attempt 2 -> Production Fix`).
     c) Copy-pasteable SQL, Lua, kernel/compiler config, or pseudocode.
     d) Non-obvious "Critical Hidden Edge Cases & Failure Modes" (race conditions, OOMs, split-brain, silent corruption) and their exact production fixes.
   - Strictly preserve 100% anonymity: never include personal names, company-internal proprietary secrets, or local filesystem paths.
3. SYNCHRONIZE ALL AGENT FILES & STATIC WEB READER:
   - Update `SYSTEM_DESIGN_MASTER_BRAIN.md` with the new modules/edge cases and increment the Red-Team Audit checklist.
   - Update `SKILL.md` and run `python sync.py` to propagate the updated rules and audit checklist across `AGENTS.md`, `CLAUDE.md`, `.agents/skills/system-design-master-brain/SKILL.md`, `.cursor/rules/system-design-master-brain.mdc`, `.cursorrules`, `.codeiumrules`, `.clinerules`, `.github/copilot-instructions.md`, and re-render `index.html`.
```

---

## 🤝 Contributing

We welcome contributions from systems and AI engineers worldwide! Please see our [Contributing Guide](CONTRIBUTING.md) for details on proposing new modules (Module 29+), production benchmarks, and failure modes.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
