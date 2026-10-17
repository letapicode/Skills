# System Design Master Brain 🧠⚡

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Compatible with Claude](https://img.shields.io/badge/Claude%20Code%20%2F%20Claude.ai-Compatible-d97706.svg)]()
[![Compatible with Codeium](https://img.shields.io/badge/Codeium%20%2F%20Windsurf-Compatible-09b6a2.svg)]()
[![Compatible with Cursor](https://img.shields.io/badge/Cursor-Compatible-000000.svg)]()
[![Compatible with Antigravity / Gemini](https://img.shields.io/badge/Antigravity%20%2F%20Gemini-Compatible-ea4335.svg)]()

> **Transform any AI coding assistant into a Staff/Principal Systems Architect.**  
> Grounded in 25 production-grade distributed systems modules, first-principles capacity math, Day-0 monolith baselines, and an exhaustive 30-point red-team audit.

---

## Why System Design Master Brain?

Standard AI models fail at real-world system design in predictable ways:
- **Hand-Wavy Box Diagrams**: Drawing microservices and message buses without calculating bytes, IOPS, or bandwidth.
- **Premature Over-Engineering**: Recommending Kafka, Redis clusters, and sharding before proving why a single vertical RDBMS instance fails.
- **Blindness to Edge Cases**: Ignoring critical production landmines like connection pool exhaustion, half-open TCP sockets, cache stampedes, lock escalation, and split-brain failures.

**System Design Master Brain** fixes this by embedding a rigorous architectural discipline into your AI agent.

```
[1. Socratic Interrogation] ──▶ Force qualitative words into P99 ms & RPS
           │
[2. Capacity Math]          ──▶ Calculate RAM, Disk, IOPS & Bandwidth from first principles
           │
[3. Day-0 Monolith]         ──▶ Prove single-node saturation limits before distributing
           │
[4. Sketch-to-Scale]        ──▶ Evolve: Attempt 1 ──▶ Bottleneck ──▶ Production Design
           │
[5. Implementation Depth]   ──▶ Real SQL schemas, indexes, isolation levels, Lua scripts
           │
[6. 30-Point Red-Team Audit]──▶ Rigorous checklist for cascading failures & edge cases
```

---

## ⚡ 1-Line Universal Install

Install the skill across your AI tools with a single terminal command:

### macOS & Linux
```bash
curl -fsSL https://raw.githubusercontent.com/OWNER/SystemDesignSkill/main/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/OWNER/SystemDesignSkill/main/install.ps1 | iex
```

*What the installer does automatically:*
1. Installs the skill for **Claude Code** (`~/.claude/skills/system-design-master-brain/`).
2. Installs the skill for **Google Antigravity & Gemini** (`~/.gemini/antigravity/skills/system-design-master-brain/`).
3. Installs **Claude Code** (`CLAUDE.md`), **Codeium** (`.codeiumrules`), **Windsurf** (`.windsurfrules`), and **Cursor** (`.cursorrules`) into your project root.

---

## 🛠 Manual Installation by Tool

| Platform | Setup Instructions |
|---|---|
| **Claude Code (CLI)** | Copy `SKILL.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to `~/.claude/skills/system-design-master-brain/`, or place `CLAUDE.md` in your project root |
| **Claude.ai (Web / Projects)** | Attach `SYSTEM_DESIGN_MASTER_BRAIN.md` to your Project Knowledge and paste the [System Prompt](#-copy-paste-system-prompt-for-raw-chat-interfaces) |
| **Codeium (VS Code / JetBrains)** | Copy `.codeiumrules` into the root directory of your project |
| **Codeium Windsurf IDE** | Copy `.windsurfrules` into the root directory of your project |
| **Cursor** | Copy `.cursorrules` into the root directory of your project |
| **Antigravity / Gemini** | Copy `SKILL.md` and `SYSTEM_DESIGN_MASTER_BRAIN.md` to `~/.gemini/antigravity/skills/system-design-master-brain/` |
| **ChatGPT / OpenAI Web** | Attach `SYSTEM_DESIGN_MASTER_BRAIN.md` and paste the [System Prompt](#-copy-paste-system-prompt-for-raw-chat-interfaces) |

---

## 📚 The 25 Core Architecture Modules

The master brain contains complete end-to-end specifications, schemas, mathematical proofs, and failure modes across **25 architectural pillars**:

| Module | Architectural Domain | Core Topics & Key Algorithms |
|:---:|---|---|
| **01** | **Real-Time Presence & DB Internals** | B+ Tree fill-factors, Connection pooling math, SingleFlight cache stampede coalescing |
| **02** | **Scaling & Protocol Routing** | ProxySQL wire-protocol routing, Async SQS/Kafka delegation, WebSockets vs. SSE |
| **03** | **Concurrency & Relational KV** | `FOR UPDATE SKIP LOCKED`, Optimistic OCC, Building a distributed KV store on RDBMS |
| **04** | **Non-Relational & Slack Architecture** | Columnar, Wide-Column, Graph DB internals, Slack real-time gateway architecture |
| **05** | **Load Balancing & Distributed Locks** | Regional L7 LB, Remote vs. Distributed locks, Redlock clock drift vs. Chubby |
| **06** | **Distributed IDs & Sharding** | Snowflake 64-bit layout, $O(\log N + K)$ cursor pagination, Logical shard migrations |
| **07** | **CDN Internals & Direct Storage** | Toy CDN in 63 lines, Presigned S3 uploads, Gravatar 3-box cache pipeline |
| **08** | **Write Batching & Hot Counters** | 5-Stage STW batching evolution, Sliding window hashtags, Unread indicators |
| **09** | **C-Level Caching & Consistent Hash** | Redis `robj`, `epoll`, 16-sample LRU, MurmurHash3 virtual node distribution rings |
| **10** | **Storage Engines Part 2: Bitcask** | 1 TB single-file word dictionary, Append-only datafile, Hint file, In-memory Keydir |
| **11** | **Storage Engines Part 3: LSM Trees** | MemTable (SkipList), WAL, SSTables, Leveled compaction, Bloom & Deletable filters |
| **12** | **Live Video & Object Storage** | HLS `.m3u8` at 20M concurrents, S3 Storage Stamps, Lexicographic partition hashing |
| **13** | **Search Engines & Multi-Tenancy** | Inverted index, BK-Tree, Metaphone, Hot-key scatter/gather, Multi-tenant routing |
| **14** | **Distributed Schedulers & Flash Sales** | One-time/cron job pullers, Flash sale unit allocation, SLA rebalancing |
| **15** | **Probabilistic Data & File Sync** | HyperLogLog harmonic mean math, Dropbox content-addressable chunking & sync |
| **16** | **Geo-Proximity & Social Graph** | GeoHash Base32 interleaving, Uber/Gojek matching engine, FlockDB graph sharding |
| **17** | **Distributed Consensus** | Raft state machine replication, Randomized election timers, Quorum math ($Q = \lfloor N/2 \rfloor + 1$) |
| **18** | **Distributed Transactions** | Sagas (Choreography vs. Orchestration), Transactional Outbox pattern, CDC Debezium |
| **19** | **Financial Ledgers & Payments** | Immutable double-entry bookkeeping, $\sum \text{Debits} - \sum \text{Credits} = 0$, Webhooks |
| **20** | **SRE Resiliency Patterns** | Circuit breakers (Resilience4j), Bulkheading, Full Jitter backoff formula |
| **21** | **Security & Auth at Scale** | Stateless JWT revocation with Bloom filters, Google Zanzibar (ReBAC tuple model) |
| **22** | **Stream Processing & State Machines** | Apache Flink event time, Watermarks, Chandy-Lamport distributed checkpointing |
| **23** | **Observability & Distributed Tracing** | OpenTelemetry W3C TraceContext propagation, Tail-based sampling collector |
| **24** | **Vector DBs & Semantic Caching** | HNSW skip-list graph, Product Quantization (IVF-PQ), Semantic cache with cosine similarity |
| **25** | **Service Mesh & Modern RPC** | gRPC / Protobuf varint encoding, Envoy sidecar proxy, mTLS at scale |

---

## 🛡 The 30-Point Master Red-Team Audit

Before any system design is approved, the AI runs this 30-point audit to catch hidden failure modes:

<details>
<summary><b>Click to expand the 30-Point Audit Checklist</b></summary>

1. **Day-0 Over-Engineering**: Did we introduce Kafka/sharding before proving a single node cannot handle it?
2. **Unquantified Words**: Did any *"fast"* or *"scalable"* slip through without ms/RPS numbers?
3. **Network Call Inside DB Transaction**: Does any DB transaction hold locks across an HTTP/SQS/Redis call?
4. **Single-Statement Transaction**: Are standalone `INSERT`/`UPDATE`s wrapped in unnecessary `BEGIN...COMMIT`?
5. **Unbounded DELETE Trap**: Are soft-deletes scanned without bounded index limits (`LIMIT 100`)?
6. **Upsert & Index**: Is `INSERT ... ON DUPLICATE KEY UPDATE` used instead of `REPLACE INTO`?
7. **High-Contention Inventory**: Is `FOR UPDATE SKIP LOCKED` used for interchangeable pools?
8. **Cache Stampede**: Is Mutex locking (`SET NX EX`) or SingleFlight used for cache misses?
9. **WebSocket Port Exhaustion**: Are inbound reverse-proxy connection limits configured to avoid ephemeral port exhaustion?
10. **Half-Open TCP Sockets**: Are bidirectional application-level PING/PONG heartbeats active?
11. **Stop-The-World Batching**: Does in-memory batching use a non-blocking dual-buffer ring swap?
12. **Push vs. Pull Config Race**: Do long-poll workers fetch state updates via pull to prevent dropped push events?
13. **Distributed Lock Fencing**: Do distributed locks emit monotonically increasing fencing tokens?
14. **Binary Relay**: Are file uploads uploaded directly to object storage via presigned URLs?
15. **Storage Engine I/O**: Is sequential write throughput (Bitcask/LSM append-only) used for high-write ingest?
16. **Regular Flow == Error Flow**: Does dead-letter processing reuse the main idempotent ingestion pipeline?
17. **Multi-Tenant Hot-Shard**: Are noisy-neighbor tenants isolated onto dedicated virtual/physical shards?
18. **Stateless Self-Healing**: Does node heartbeat state auto-expire via TTL without manual cleanup?
19. **Connection Pool In-Flight Eviction**: Are idle database connections verified via keepalive before query execution?
20. **Read-Your-Own-Writes**: Are recently updated sessions pinned to the primary database for replication lag window?
21. **Poison Pill DLQ**: Do failing malformed messages get routed to a DLQ after exponential backoff?
22. **Unindexed FOR UPDATE**: Are all locked queries backed by unique/covering indexes to avoid table locks?
23. **S3 Multipart Abandonment**: Is an S3 lifecycle rule configured to abort incomplete multipart uploads after 7 days?
24. **Graph Supernodes**: Are high-degree celebrity nodes partitioned into separate adjacency shards?
25. **Cassandra Tombstone Overload**: Are range queries protected against scanning $>100,000$ tombstones?
26. **Snowflake Clock Drift**: Does the ID generator halt or borrow future sequences when NTP steps backward?
27. **Proof-of-Ownership**: Are content-addressed file chunks validated with cryptographic hashes before deduplication?
28. **Consistent Hashing Domino**: Are virtual nodes ($V \ge 256$) deployed to distribute shard failure load evenly?
29. **Live Video Manifest Herd**: Are HLS `.m3u8` manifests cached with short TTLs ($0.5\text{–}1\text{s}$) at the CDN edge?
30. **GeoHash Boundaries**: Does spatial proximity search query the center cell plus all 8 adjacent neighbor cells?

</details>

---

## 📋 Copy-Paste System Prompt (For Raw Chat Interfaces)

If you are using ChatGPT, Claude.ai, or another raw LLM chat interface, attach `SYSTEM_DESIGN_MASTER_BRAIN.md` to your chat and paste this prompt:

```markdown
You are a Principal Systems Architect operating with the System Design Master Brain playbook.
Whenever I ask you to design, critique, scale, or review a system, you MUST strictly follow this exact lifecycle:

1. SOCRATIC INTERROGATION FIRST: Do NOT jump into drawing boxes or proposing microservices. First, ask targeted clarifying questions (Workload Ratio, Peak Concurrency vs. Total Data, SLA/P99 latency, Consistency model, Blast radius) and force every qualitative word ("fast", "huge", "scalable") into concrete numbers.
2. CAPACITY MATH: Compute exact RAM, Disk, IOPS, and Network Bandwidth numbers from first principles before choosing any database or sharding strategy.
3. DAY-0 MONOLITH BASELINE: Formulate the simplest working implementation on a single vertical RDBMS instance. Calculate the exact numerical threshold where it breaks.
4. SKETCH-TO-SCALE EVOLUTION: Walk through Attempt 1 -> Bottleneck -> Attempt 2 -> Bottleneck -> Final Architecture using the Framework of Opposites.
5. IMPLEMENTATION DEPTH: Provide concrete SQL schemas with composite indexes, locking modes (FOR UPDATE SKIP LOCKED), Redis data structures/Lua scripts, and idempotency guarantees.
6. 30-POINT RED-TEAM AUDIT: Audit the final architecture against the 30-point checklist from the playbook before declaring the design complete.
```

---

## 🤝 Contributing

We welcome contributions from systems engineers worldwide!
Please see our [Contributing Guide](CONTRIBUTING.md) for details on:
- How to propose new distributed systems modules (Module 26+).
- How to add failure modes and edge cases to the Red-Team Audit checklist.
- Standards for first-principles calculations and zero-personal-identifier policy.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
