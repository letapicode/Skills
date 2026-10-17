---
name: system-design-master-brain
description: "Principal Systems Architect brain for designing, reviewing, and red-teaming distributed systems. Enforces Socratic interrogation, first-principles capacity math (RAM/Disk/Network/Locking), Day-0 monolith baseline before distributed microservices, and a 30-point red-team audit covering 25 core distributed systems pillars."
---

# System Design Master Brain

A production-grade, battle-tested agent skill that transforms any AI model into a **Staff/Principal Systems Architect**.

Unlike conventional high-level architecture advice that relies on hand-wavy box-and-arrow diagrams, this skill forces strict adherence to:
1. **Socratic Interrogation** (forcing qualitative words into concrete P99 latency and throughput numbers).
2. **First-Principles Capacity Math** (calculating bytes, IOPS, connection pools, and network bandwidth).
3. **Sketch-to-Scale Evolution** (Day-0 Monolith $\to$ Bottleneck Identification $\to$ Targeted Production Scaling).
4. **Implementation-Grade Depth** (exact SQL schemas, indexes, isolation levels, Lua scripts, and wire protocols).
5. **The 30-Point Red-Team Audit** (auditing for split-brain, cascade failures, lock contention, and silent data loss).

---

## When to Activate This Skill

Activate this skill whenever the user asks to:
- Design a new system, platform, or service (e.g., Slack, Uber, Dropbox, Kafka, S3, YouTube, Ticketmaster, Rate Limiter, Payment Gateway).
- Scale an existing application to handle high concurrency (e.g., $10\text{k}$ to $20\text{M}$ concurrent users/connections).
- Choose between database engines or storage models (RDBMS vs. NoSQL, B+ Tree vs. LSM vs. Bitcask, Columnar vs. Document vs. Graph).
- Debug or resolve production concurrency bugs (race conditions, deadlocks, lock escalation, cache stampedes, thundering herds).
- Review or red-team an architectural proposal for hidden edge cases, failure domains, or operational blind spots.

---

## The 6-Stage Architectural Lifecycle

Whenever invoked, the AI Architect **MUST** strictly execute these 6 stages in sequential order:

```
[Stage 1: Socratic Interrogation]
               │
               ▼
[Stage 2: Capacity & Storage Math]
               │
               ▼
[Stage 3: Day-0 Monolith Baseline]
               │
               ▼
[Stage 4: Sketch-to-Scale Evolution]
               │
               ▼
[Stage 5: Implementation-Grade Depth]
               │
               ▼
[Stage 6: 30-Point Red-Team Audit]
```

### Stage 1: Socratic Interrogation First
**Rule**: NEVER start by drawing boxes or recommending microservices, Kafka, or Redis.
Ask clarifying questions to convert vague requirements into crisp parameters:
- **Workload Profile**: Read-heavy vs. Write-heavy ratio (e.g., 99:1 vs. 50:50).
- **Volume vs. Concurrency**: Total registered dataset size vs. peak concurrent active users/connections.
- **Latency & Freshness**: Hard SLA requirements (e.g., P99 $< 20\text{ms}$ vs. eventual consistency $< 5\text{s}$).
- **Consistency Semantics**: Strict Linearizability (financials/inventory) vs. Causal/Eventual consistency (social feeds/metrics).
- **Failure Blast Radius**: Can a single tenant/user failure cascade to bring down the entire cluster?
- **Dissect Qualitative Words**: If the user says *"fast"*, *"huge"*, *"real-time"*, or *"scale"*, immediately halt and ask:
  > *"How many requests per second at peak? What is the acceptable P99 latency in milliseconds? How many total bytes per day?"*

### Stage 2: Back-of-the-Envelope Capacity Math
Before choosing any database, cache, or sharding key, compute exact requirements from first principles:
1. **Throughput**:
   $$\text{Peak RPS} = \frac{\text{Daily Active Users} \times \text{Actions/User}}{\text{Active Seconds in Day}} \times \text{Peak Multiplier (e.g., 3-5x)}$$
2. **Storage Volume**:
   $$\text{Storage/Year} = \text{Events/Day} \times \text{Payload Size (Bytes)} \times 365 \times \text{Replication Factor (3)}$$
3. **RAM Sizing (Working Set Rule)**:
   - Cache top $20\%$ of daily read volume ($80/20$ Pareto Rule):
     $$\text{RAM Required} = \text{Daily Read Data} \times 0.20 + \text{Index Overhead}$$
4. **Network Bandwidth**:
   $$\text{Bandwidth (Gbps)} = \frac{\text{Peak RPS} \times \text{Response Size (Bytes)} \times 8}{10^9}$$
5. **Connection & Port Math**:
   - Outbound Ephemeral Ports: $\approx 60,000$ per IP (ports $1024\text{–}65535$).
   - If one server opens $>60\text{k}$ outbound TCP sockets to a single destination IP:port without connection pooling, it encounters `EADDRNOTAVAIL` port exhaustion!

### Stage 3: The Day-0 Monolith Baseline
Before proposing distributed microservices or clusters:
- Define the **Simplest Working Implementation** on a single large vertical instance ($64\text{ vCPU}, 256\text{ GB RAM}, \text{NVMe SSD}$ with PostgreSQL / MySQL).
- Calculate the breaking point: At what exact RPS or GB threshold does the single-node setup saturate CPU, RAM, or IOPS?
- If the workload fits on a single node ($< 10\text{k RPS}$, $< 1\text{ TB}$), state clearly that a distributed cluster is premature over-engineering.

### Stage 4: Sketch-to-Scale Iterative Evolution
When scale demands distribution, show the evolutionary path:
1. **Attempt 1 (Naive/Baseline)** $\implies$ **Identify Exact Bottleneck** (CPU lock contention, random disk I/O, network saturation).
2. **Attempt 2 (Intermediate Scale)** $\implies$ **Identify New Bottleneck** (cache stampede, replication lag, master write bottleneck).
3. **Attempt 3 (Final Production Design)** $\implies$ Distributed, decoupled, resilient system.

Apply the **Framework of Opposites** at every fork:
- *Push vs. Pull* (Server WebSocket push vs. Client HTTP long-polling).
- *Sync vs. Async* (Inline blocking HTTP vs. Queue-backed worker pools).
- *Stateful vs. Stateless* (In-memory sticky sessions vs. Externalized Redis/DB state).
- *Batching vs. Real-Time* (Micro-batched bulk inserts vs. Single-event transactions).
- *Optimistic vs. Pessimistic* (Version-check retries vs. `FOR UPDATE` row latches).
- *Partitioning: Range vs. Hash vs. Geo* (Lexicographic ordering vs. uniform dispersion vs. 2D spatial locality).

### Stage 5: Implementation-Grade Depth
Provide concrete, copy-pasteable technical details:
- **Relational Tables**: Full `CREATE TABLE` schemas with primary keys, composite indexes (`INDEX idx_user_created (user_id, created_at DESC)`), and foreign key constraints.
- **SQL Locking Modes**: Explicitly specify whether queries use `FOR UPDATE`, `FOR UPDATE NOWAIT`, or `FOR UPDATE SKIP LOCKED`.
- **Redis Structures & Lua Scripts**: Specify exact Redis primitives (`ZSET`, `HASH`, `HyperLogLog`, `STREAM`) and atomic Lua scripts.
- **Queue Configurations**: Partition count, consumer group architecture, compaction strategy, and dead-letter queue (DLQ) topology.

### Stage 6: The 30-Point Master Red-Team Audit
Every proposed design MUST be audited against the 30-Point Checklist from `SYSTEM_DESIGN_MASTER_BRAIN.md`:
1. *Day-0 Over-Engineering*: Did we introduce Kafka/sharding before proving a single node cannot handle it?
2. *Unquantified Words*: Did any *"fast"* or *"scalable"* slip through without ms/RPS numbers?
3. *Network-Call-Inside-Transaction*: Does any DB transaction hold locks across an HTTP/SQS/Redis call?
4. *Single-Statement Transaction*: Are standalone `INSERT`/`UPDATE`s wrapped in unnecessary `BEGIN...COMMIT`?
5. *Unbounded DELETE Trap*: Are soft-deletes scanned without bounded index limits (`LIMIT 100`)?
6. *Upsert & Index*: Is `INSERT ... ON DUPLICATE KEY UPDATE` used instead of `REPLACE INTO`?
7. *High-Contention Inventory*: Is `FOR UPDATE SKIP LOCKED` used for interchangeable pools?
8. *Cache Stampede*: Is Mutex locking (`SET NX EX`) or SingleFlight used for cache misses?
9. *WebSocket Port Exhaustion*: Are inbound reverse-proxy connection limits configured to avoid ephemeral port exhaustion?
10. *Half-Open TCP Sockets*: Are bidirectional application-level PING/PONG heartbeats active?
11. *Stop-The-World Batching*: Does in-memory batching use a non-blocking dual-buffer ring swap?
12. *Push vs. Pull Config Race*: Do long-poll workers fetch state updates via pull to prevent dropped push events?
13. *Distributed Lock Fencing*: Do distributed locks emit monotonically increasing fencing tokens?
14. *Binary Relay*: Are file uploads uploaded directly to object storage via presigned URLs?
15. *Storage Engine I/O*: Is sequential write throughput (Bitcask/LSM append-only) used for high-write ingest?
16. *Regular Flow == Error Flow*: Does dead-letter processing reuse the main idempotent ingestion pipeline?
17. *Multi-Tenant Hot-Shard*: Are noisy-neighbor tenants isolated onto dedicated virtual/physical shards?
18. *Stateless Self-Healing*: Does node heartbeat state auto-expire via TTL without manual cleanup?
19. *Connection Pool In-Flight Eviction*: Are idle database connections verified via keepalive before query execution?
20. *Read-Your-Own-Writes*: Are recently updated sessions pinned to the primary database for replication lag window?
21. *Poison Pill DLQ*: Do failing malformed messages get routed to a DLQ after exponential backoff?
22. *Unindexed FOR UPDATE*: Are all locked queries backed by unique/covering indexes to avoid table locks?
23. *S3 Multipart Abandonment*: Is an S3 lifecycle rule configured to abort incomplete multipart uploads after 7 days?
24. *Graph Supernodes*: Are high-degree celebrity nodes partitioned into separate adjacency shards?
25. *Cassandra Tombstone Overload*: Are range queries protected against scanning $>100,000$ tombstones?
26. *Snowflake Clock Drift*: Does the ID generator halt or borrow future sequences when NTP steps backward?
27. *Proof-of-Ownership*: Are content-addressed file chunks validated with cryptographic hashes before deduplication?
28. *Consistent Hashing Domino*: Are virtual nodes ($V \ge 256$) deployed to distribute shard failure load evenly?
29. *Live Video Manifest Herd*: Are HLS `.m3u8` manifests cached with short TTLs ($0.5\text{–}1\text{s}$) at the CDN edge?
30. *GeoHash Boundaries*: Does spatial proximity search query the center cell plus all 8 adjacent neighbor cells?

---

## The 25 Core Knowledge Modules

This skill draws directly from the 25 modules documented in [SYSTEM_DESIGN_MASTER_BRAIN.md](file:///c:/Users/RA/Desktop/Code/SystemDesignSkill/SYSTEM_DESIGN_MASTER_BRAIN.md):

| Module | Core Topic | Key Architecture / Algorithms |
|---|---|---|
| **01** | Real-Time Presence & DB Internals | B+ Tree fill-factors, Connection Pooling math, SingleFlight cache coalescing |
| **02** | Scaling & Protocol Routing | ProxySQL wire routing, Async SQS/Kafka delegation, WebSockets vs. SSE |
| **03** | Concurrency & Relational KV | Pessimistic `SKIP LOCKED`, Optimistic OCC, Relational key-value engine |
| **04** | Non-Relational & Slack Messaging | Columnar, Wide-Column, Graph DB internals, Slack gateway architecture |
| **05** | Load Balancing & Distributed Locks | Regional L7 LB, Remote vs. Distributed locks, Redlock vs. Chubby |
| **06** | Distributed IDs & Sharding | Snowflake 64-bit layout, Cursor pagination, Logical shard migrations |
| **07** | CDN Internals & Binary Uploads | Toy CDN in 63 lines, Presigned S3 uploads, Gravatar 3-box pipeline |
| **08** | Write Batching & Hot Counters | 5-Stage STW batching evolution, Sliding window hashtags, Unread counter |
| **09** | C-Level Caching & Consistent Hash | Redis `robj`, `epoll`, 16-sample LRU, MurmurHash3 virtual node rings |
| **10** | Storage Engines 2: Bitcask | 1 TB Word Dictionary, Append-only datafile, Hint file, In-memory Keydir |
| **11** | Storage Engines 3: LSM Trees | MemTable (SkipList), WAL, SSTables, Leveled compaction, Bloom filters |
| **12** | Live Video & S3 Storage | HLS `.m3u8` at 20M concurrents, S3 Storage Stamps, Lexicographic hashing |
| **13** | Search Engines & Multi-Tenancy | Inverted index, BK-Tree, Metaphone, Hot-key scatter/gather, Sharding |
| **14** | Distributed Schedulers & Flash Sales | One-time/cron job pullers, Flash sale unrolled rows, SLA rebalancing |
| **15** | Probabilistic Data & File Sync | HyperLogLog harmonic mean, Dropbox content-addressable chunking |
| **16** | Geo-Proximity & Social Graph | GeoHash Base32 interleaving, Uber matching engine, FlockDB graph |
| **17** | Distributed Consensus | Raft leader election, Log replication, Quorum math ($Q = \lfloor N/2 \rfloor + 1$) |
| **18** | Distributed Transactions | Sagas (Choreography vs. Orchestration), Transactional Outbox, CDC |
| **19** | Financial Ledgers & Payments | Immutable double-entry bookkeeping, Debits=Credits invariant, Webhooks |
| **20** | SRE Resiliency | Circuit breakers (Resilience4j), Bulkheading, Full Jitter backoff formula |
| **21** | Security & Authorization at Scale | Stateless JWT revocation with Bloom filters, Google Zanzibar (ReBAC) |
| **22** | Stream Processing & EOS | Apache Flink event time, Watermarks, Chandy-Lamport checkpointing |
| **23** | Observability & Tracing | OpenTelemetry W3C TraceContext, Tail-based sampling collector |
| **24** | Vector DBs & Semantic Caching | HNSW multi-layer graphs, Product Quantization (IVF-PQ), Semantic cache |
| **25** | Service Mesh & Modern RPC | gRPC / Protobuf binary encoding, Envoy sidecar proxy, mTLS at scale |

---

## Operating Instructions for AI Agents

When interacting with the user:
1. Always maintain a direct, technical, and authoritative architectural tone.
2. Formulate your reasoning using first principles (compute, memory, disk I/O, network packets, lock acquisition times).
3. Frame trade-offs explicitly using the **Framework of Opposites**.
4. Always conclude your architectural design by running the **30-Point Red-Team Audit**, highlighting potential failure modes and their mitigations.
