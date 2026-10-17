# System Design Master Brain 🧠⚡

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Compatible with Claude](https://img.shields.io/badge/Claude%20Code%20%2F%20Claude.ai-Compatible-d97706.svg)]()
[![Compatible with OpenAI Codex / Copilot](https://img.shields.io/badge/OpenAI%20Codex%20%2F%20Copilot-Compatible-000000.svg)]()
[![Compatible with DeepSeek / Cline](https://img.shields.io/badge/DeepSeek%20%2F%20Cline%20%2F%20Llama-Compatible-4d6bfe.svg)]()
[![Compatible with Codeium](https://img.shields.io/badge/Codeium%20%2F%20Windsurf-Compatible-09b6a2.svg)]()
[![Compatible with Cursor](https://img.shields.io/badge/Cursor-Compatible-000000.svg)]()
[![Compatible with Antigravity / Gemini](https://img.shields.io/badge/Antigravity%20%2F%20Gemini-Compatible-ea4335.svg)]()
[![Live Documentation](https://img.shields.io/badge/Live%20Docs-GitHub%20Pages-success.svg)](https://OWNER.github.io/SystemDesignSkill/)

> **Transform any AI coding assistant into a Staff/Principal Systems & AI Architect—for Distributed Systems, Frontier AI Infrastructure, and Real Production Codebases at Million-User Scale.**  
> Grounded in **27 production-grade distributed & AI systems modules**, first-principles capacity math, Day-0 monolith baselines, and an exhaustive **50-point red-team audit**.
>
> 📖 **Read the live web documentation**: [System Design Master Brain on GitHub Pages](https://OWNER.github.io/SystemDesignSkill/)

---

## Why System Design Master Brain?

Standard AI models fail at real-world systems and AI engineering in two predictable ways:
1. **In Architecture & AI Design Mode**: They draw hand-wavy microservice and Kafka box diagrams on Day 0 without calculating bytes, GPU HBM / KV-Cache footprints, IOPS, connection pool limits, or proving why a single vertical RDBMS node saturates.
2. **In Real Codebases**: They write naive SQL migrations that trigger metadata-lock outages, place external HTTP/LLM calls inside DB transactions, stack $3^4 = 81\times$ retry storms, leak high-cardinality labels into Prometheus, and drop in-flight requests during Kubernetes rolling restarts.

**System Design Master Brain** fixes both by embedding a **Dual-Mode Principal Systems & AI Architect Engine** into your AI tools:

```
┌────────────────────────────────────────────────────────────────────────────┐
│ MODE A: Architecture, Distributed Systems & Frontier AI RFCs               │
├────────────────────────────────────────────────────────────────────────────┤
│ [1. Socratic Interrogation] ──▶ Force qualitative words into P99 ms & RPS  │
│ [2. Capacity & GPU Math]    ──▶ Compute RAM, KV-Cache, IOPS & Ports        │
│ [3. Day-0 Monolith]         ──▶ Prove single-node limits before sharding   │
│ [4. Sketch-to-Scale]        ──▶ Attempt 1 ──▶ Bottleneck ──▶ Production    │
│ [5. Implementation Depth]   ──▶ SQL, Lua, DeepSeek MLA/MoE, Meta Muse, RAG │
│ [6. 50-Point Red-Team Audit]──▶ Audit for split-brain, stampedes & races   │
└────────────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────┐
│ MODE B: Real-Codebase Implementation, PR Review & Production Debugging     │
├────────────────────────────────────────────────────────────────────────────┤
│ • Zero network/LLM calls inside DB transactions (Transactional Outbox)     │
│ • Canonical lock ordering (ORDER BY id ASC FOR UPDATE) & SKIP LOCKED       │
│ • Lease-backed idempotency keys (locked_until + SHA-256 parameter check)   │
│ • Zero-downtime DDL migrations (SET lock_timeout='2s', Expand-Contract)    │
│ • Single-layer Full-Jitter retries + 10% retry budget + LIFO/CoDel queues  │
│ • Postgres MVCC HOT updates (fillfactor=80), PgBouncer & K8s SIGTERM drain │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## ⚡ 1-Line Universal Install

Install the skill across your AI tools (or directly into your current project workspace) with a single terminal command:

### macOS & Linux
```bash
curl -fsSL https://raw.githubusercontent.com/OWNER/SystemDesignSkill/main/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/OWNER/SystemDesignSkill/main/install.ps1 | iex
```

*What the installer does automatically:*
1. Installs the global skill for **Claude Code** (`~/.claude/skills/system-design-master-brain/`).
2. Installs the global skill & `AGENTS.md` for **OpenAI Codex CLI** (`~/.codex/skills/system-design-master-brain/` and `~/.codex/AGENTS.md`).
3. Installs the global skill for **Google Antigravity & Gemini** (`~/.gemini/antigravity/skills/system-design-master-brain/`).
4. If run inside a project repository, installs **OpenAI Codex / OpenCode / Aider / Devin** (`AGENTS.md`), **GitHub Copilot** (`.github/copilot-instructions.md`), **Claude Code** (`CLAUDE.md`), **DeepSeek / Llama / Cline / Roo Code** (`.clinerules`), **Codeium** (`.codeiumrules`), **Windsurf** (`.windsurfrules`), **Cursor** (`.cursorrules`), and the complete 27-module [`SYSTEM_DESIGN_MASTER_BRAIN.md`](SYSTEM_DESIGN_MASTER_BRAIN.md) directly into your workspace.

---

## 🛠 Manual Installation by Tool

| Platform | Setup Instructions |
|---|---|
| **OpenAI Codex (CLI & Cloud Agent)** | Copy `AGENTS.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to your project root (or `~/.codex/AGENTS.md` globally) |
| **GitHub Copilot (VS Code / JetBrains)** | Copy `.github/copilot-instructions.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` into your repository root |
| **Claude Code (CLI)** | Copy `SKILL.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to `~/.claude/skills/system-design-master-brain/`, or place `CLAUDE.md` in your project root |
| **DeepSeek / Llama / Qwen (via Cline / Roo / OpenCode)** | Copy `.clinerules` and `AGENTS.md` into your project root, or attach `SYSTEM_DESIGN_MASTER_BRAIN.md` in chat |
| **Codeium (VS Code / JetBrains)** | Copy `.codeiumrules` and `SYSTEM_DESIGN_MASTER_BRAIN.md` into the root directory of your project |
| **Codeium Windsurf IDE** | Copy `.windsurfrules` and `SYSTEM_DESIGN_MASTER_BRAIN.md` into the root directory of your project |
| **Cursor** | Copy `.cursorrules` and `SYSTEM_DESIGN_MASTER_BRAIN.md` into the root directory of your project |
| **Antigravity / Gemini** | Copy `SKILL.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to `~/.gemini/antigravity/skills/system-design-master-brain/` |
| **ChatGPT / Claude.ai / DeepSeek Web** | Attach `SYSTEM_DESIGN_MASTER_BRAIN.md` and paste the [System Prompt](#-copy-paste-system-prompt-for-raw-chat-interfaces) |

---

## 📚 The 27 Core Architecture, AI & Production Modules

The master brain contains complete end-to-end specifications, schemas, mathematical proofs, and hidden failure modes across **27 architectural pillars**:

| Module | Architectural Domain | Core Topics, Schemas & Hidden Edge Cases |
|:---:|---|---|
| **01** | **Real-Time Presence & DB Internals** | B+ Tree fill-factors, Connection pooling math, SingleFlight cache stampede coalescing |
| **02** | **Scaling & Protocol Routing** | ProxySQL wire-protocol routing, Async SQS/Kafka delegation, WebSockets vs. SSE, Naked WSS DMZ |
| **03** | **Concurrency & Relational KV** | `FOR UPDATE SKIP LOCKED`, `NOWAIT`, Optimistic OCC, Building a distributed KV store on RDBMS |
| **04** | **Non-Relational & Slack Architecture** | Columnar RLE, Wide-Column tombstones, Graph supernode traps, Slack real-time gateway architecture |
| **05** | **Load Balancing & Distributed Locks** | Regional L7 LB, Remote vs. Distributed locks, Redlock quorum release & monotonic fencing tokens |
| **06** | **Distributed IDs & Sharding** | Snowflake 64-bit layout & NTP drift, $O(\log N + K)$ cursor pagination, `8,192` logical shards |
| **07** | **CDN Internals & Direct Storage** | Toy CDN in 63 lines, Presigned S3 uploads (`content-length-range`), Proof-of-Ownership challenge |
| **08** | **Write Batching & Hot Counters** | 5-Stage STW batching evolution (Double-Buffered Pointer Swap), Sliding window hashtags, Unread dots |
| **09** | **C-Level Caching & Consistent Hash** | Redis `robj`, `epoll`, 16-sample LRU, MurmurHash3 virtual node distribution rings ($\ge 256$ vnodes) |
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
| **20** | **SRE Resiliency Patterns** | Circuit breakers, Bulkheading, Full Jitter, $10\%$ Retry Budgets, LIFO + CoDel load shedding, Failover DNS TTL |
| **21** | **Security & Auth at Scale** | Refresh token family theft revocation, Google Zanzibar ReBAC & Zookies, Leopard bitsets, SSRF dialer |
| **22** | **Stream Processing & State** | Apache Flink event time, `withIdleness()` watermarks, RocksDB `StateTtlConfig`, Cooperative rebalancing |
| **23** | **Observability & Tracing** | OpenTelemetry W3C TraceContext, Tail-based sampling, $<1,000$ metric label cardinality law, Histogram merge |
| **24** | **Vector DBs, Hybrid RAG & LLM Engines** | HNSW & Binary Quantization, Hybrid RRF + Cross-Encoder, KV-Cache math, vLLM PagedAttention & RadixAttention |
| **25** | **Service Mesh & Modern RPC** | gRPC L7/Headless load balancing, HTTP/2 channel pools, Protobuf `reserved` tags, GraphQL DataLoader |
| **26** | **Production Codebase Engineering** | Zero-downtime DDL (`lock_timeout`, Expand-Contract), Postgres MVCC HOT updates & XID wraparound, K8s `SIGTERM` drain |
| **27** | **Frontier AI, DeepSeek, Meta Muse & RecSys** | DeepSeek MLA ($93\%$ KV compression), Auxiliary-Loss-Free MoE, Disaggregated Prefill/Decode, Meta Muse masked parallel generation, 4-stage RecSys & Firecracker Agent VMs |

---

## 🛡 The 50-Point Master Red-Team Audit

Before any system design or production pull request is approved, the AI audits it against 50 real-world failure modes:

<details>
<summary><b>Click to expand all 50 Red-Team Audit Checks</b></summary>

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

### Frontier AI, DeepSeek MoE/MLA, Generative Media & ML RecSys Checks (46–50)
46. **Disaggregated Prefill-vs-Decode & KV-Cache Math**: Are compute-bound Prefill nodes separated from bandwidth-bound Decode nodes (with RDMA KV transfer + MLA/GQA + PagedAttention/RadixAttention) so long prompts never stall active streaming users?
47. **MoE Expert Load-Balancing & Long-CoT Offloading**: Does MoE serving/training use Auxiliary-Loss-Free dynamic bias routing to prevent GPU expert hotspots, and does long Chain-of-Thought reasoning (`R1`/`o1`) offload KV cache to Host DRAM?
48. **Generative Media (Meta Muse / Diffusion) Queue & S-LoRA Paging**: Are image/video jobs decoupled via priority token-bucket GPU queues, using S-LoRA dynamic adapter paging in HBM and evaluating parallel masked token decoding (Meta Muse) for sub-second generation/inpainting?
49. **ML RecSys 4-Stage Funnel & Time-Travel Leakage**: Does ranking use a 4-stage cascade (`Two-Tower ANN -> Pre-Rank -> Multi-Task DLRM/MMoE -> DPP Diversity`) and log features at inference time (`request_impression_id`) to eliminate Training-Serving Skew?
50. **Autonomous Agent Checkpoints & Firecracker Sandbox**: Do multi-step agents checkpoint state before every tool call with idempotency keys, and execute untrusted code inside Firecracker MicroVMs blocking RFC1918 and `169.254.169.254`?

</details>

---

## 📋 Copy-Paste System Prompt (For Raw Chat Interfaces)

If you are using ChatGPT, Claude.ai, DeepSeek, or another web LLM interface, attach `SYSTEM_DESIGN_MASTER_BRAIN.md` to your chat and paste this prompt:

```markdown
You are a Staff/Principal Systems & AI Architect operating with the `SYSTEM_DESIGN_MASTER_BRAIN.md` playbook (27 Modules & 50-Point Red-Team Audit).
Operate in Dual Mode depending on my request:

MODE A — SYSTEM DESIGN, AI INFRASTRUCTURE & ARCHITECTURE RFCs:
1. SOCRATIC INTERROGATION FIRST: Do NOT jump into drawing boxes or proposing microservices. First, ask targeted clarifying questions (Workload Ratio, Peak Concurrency vs. Total Volume, P99/TTFT/ITL SLA, Consistency model, Blast radius) and force every qualitative word ("fast", "huge", "real-time") into concrete numbers.
2. CAPACITY & GPU MATH: Compute exact RAM, GPU HBM / KV-Cache Bytes, Disk, IOPS, Network Bandwidth, and Ephemeral Port numbers from first principles before choosing any database, serving cluster, or sharding strategy.
3. DAY-0 MONOLITH BASELINE: Formulate the simplest working implementation on a single vertical RDBMS instance with blunt SQL and pseudocode. Calculate the exact numerical threshold where it breaks.
4. SKETCH-TO-SCALE EVOLUTION: Walk through Attempt 1 -> Bottleneck -> Attempt 2 -> Bottleneck -> Final Architecture using the Framework of Opposites.
5. IMPLEMENTATION DEPTH: Provide concrete SQL schemas with composite covering indexes, locking modes (FOR UPDATE SKIP LOCKED), Redis Lua scripts, AI serving architectures (DeepSeek MLA/MoE, Disaggregated Prefill/Decode, Meta Muse masked parallel decoding, 4-stage RecSys funnel, Firecracker agent sandboxes), and idempotency guarantees.

MODE B — REAL-CODEBASE IMPLEMENTATION, PR REVIEW & DEBUGGING:
- Inspect the code, SQL queries, migrations, and configs directly without stalling on abstract whiteboard questions.
- Enforce: zero network calls inside DB transactions, canonical lock ordering (ORDER BY id ASC FOR UPDATE), lease-backed idempotency keys with SHA-256 parameter checks, single-layer Full-Jitter retries with a 10% retry budget, zero-downtime DDL migrations (SET lock_timeout = '2s', CREATE INDEX CONCURRENTLY, Expand-and-Contract), and graceful K8s SIGTERM drain.

6. 50-POINT RED-TEAM AUDIT: Conclude every design or code review by auditing it against the 50-Point Red-Team Checklist from the playbook.
```

---

## 🤝 Contributing

We welcome contributions from systems and AI engineers worldwide! Please see our [Contributing Guide](CONTRIBUTING.md) for details on proposing new modules (Module 28+), production benchmarks, and failure modes.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
