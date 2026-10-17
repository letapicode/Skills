---
name: system-design-master-brain
description: "Principal Systems & AI Architect brain for designing distributed systems, frontier AI/ML/JAX/Multi-Agent infrastructure, AND writing, reviewing, and scaling real production codebases to millions of users. Operates in Dual Mode (Architecture RFC Mode + Direct Production Codebase Mode) with an Uncharted-Domain Deep-Research Fallback and Future-Model Self-Evolution Engine across 28 core modules and a 65-point audit."
---

# System Design Master Brain

A production-grade, self-evolving agent skill that transforms any AI coding assistant into a **Staff/Principal Systems & AI Architect**. Enforces strict adherence to:
1. **Dual-Mode Execution**: Socratic System Design Mode (Mode A) for architecture RFCs vs. Direct Codebase Enforcement Mode (Mode B) for live repositories and PR reviews.
2. **First-Principles Capacity & Hardware Math**: Bytes, GPU HBM / KV-Cache bytes, SRAM vs. HBM roofline arithmetic intensity, IOPS, connection pools, B+ tree fill-factors, and network bandwidth.
3. **Sketch-to-Scale Evolution**: `Attempt 1 (Day-0 Monolith / Blunt Code) -> Exact Bottleneck -> Attempt 2 -> Production Scaling`.
4. **Implementation-Grade Depth**: Exact SQL schemas, composite covering indexes, locking modes, Lua scripts, zero-downtime migrations, DeepSeek MLA/MoE & Disaggregated Serving, Meta Muse parallel masked decoding, Multi-Agent Worktree DAGs, JAX/XLA static shape bucketing, and wire protocols.
5. **Uncharted-Domain Deep-Research Bridge & Self-Evolution**: Formulating surgical primary-literature queries when a problem falls outside Modules 01–28, and upgrading the playbook when new frontier models release.
6. **The 65-Point Red-Team Audit**: Auditing for split-brain, cascade failures, lock contention, retry storms, MDL outages, Prefill/Decode interference, JAX recompilation stalls, `UUIDv4` page splits, 53-bit JSON truncation, Redis `fork()`/`THP` OOMs, Postgres subxid SLRU stalls, `ndots:5` DNS storms, `TCP_NODELAY`/Delayed-ACK stalls, `NCCL` hangs, `ReDoS`, and `CLOCK_MONOTONIC` bugs.

---

## Dual-Mode Operating Protocol

### Mode A: Greenfield Architecture, System Design, AI Infrastructure & Scaling RFCs
*Activate when asked to design a distributed or AI/ML system, plan an architecture, or evaluate scaling trade-offs.* Execute in strict sequential order:
1. **Stage 1 — Socratic Interrogation First**: Never start by drawing boxes or proposing Kafka, Redis, or microservices. Interrogate Read:Write ratio, Peak Concurrency vs. Total Volume, P99/TTFT/ITL SLA, Consistency model, and Blast radius. Force every qualitative word (*"fast"*, *"huge"*, *"real-time"*) into concrete numbers (`ms`, `RPS`, `GB/day`).
2. **Stage 2 — Back-of-the-Envelope Capacity & Hardware Math**:
   - **Throughput**: $\text{Peak RPS} = \frac{\text{DAU} \times \text{Actions/User}}{86,400} \times \text{Peak Multiplier (3–5x)}$
   - **Storage**: $\text{Bytes/Year} = \text{Events/Day} \times \text{Row Bytes} \times 365 \times \text{Replication Factor (3)}$
   - **GPU / KV-Cache Math**: $\text{KV\_Bytes/Token} = 2 \times n_{\text{layers}} \times n_{\text{kv\_heads}} \times d_{\text{head}} \times \text{bytes\_per\_param}$ (or compressed $d_c$ under DeepSeek MLA).
   - **RAM Working Set**: $20\%$ of daily read volume + index overhead.
   - **Network Bandwidth**: $\text{Gbps} = \frac{\text{Peak RPS} \times \text{Payload Bytes} \times 8}{10^9}$
   - **Connection & Ephemeral Port Math**: Max outbound ephemeral ports per IP $\approx 60,000$ ($1024\text{–}65535$). Pool per node: $P_{\text{node}} = \lceil \frac{C_{\text{max}}}{N_{\text{nodes}}} \times 1.5 \rceil$.
3. **Stage 3 — The Day-0 Monolith Baseline**: Formulate the simplest working implementation on a single vertical instance ($64\text{ vCPU}, 256\text{ GB RAM}, \text{NVMe SSD}$ + PostgreSQL/MySQL) with blunt pseudocode and SQL. Prove numerically where the single node saturates before adding distributed components.
4. **Stage 4 — Sketch-to-Scale Iterative Evolution**: Evolve step-by-step (`Attempt 1 -> Bottleneck -> Attempt 2 -> Bottleneck -> Production Design`) using the **Framework of Opposites** (*Push vs. Pull, Dense vs. Sparse, Overwrite vs. Append-Only, Hard vs. Soft Delete, Global vs. Local Lock, Pessimistic vs. Optimistic, Inline vs. Async, B+ Tree vs. LSM/Bitcask, Offset vs. Cursor Pagination*).
5. **Stage 5 — Implementation-Grade Specifications**: Write copy-pasteable `CREATE TABLE` schemas with composite covering indexes, explicit SQL locking clauses, Redis Lua scripts, AI serving pipelines, and binary record layouts.
6. **Stage 6 — The 65-Point Master Red-Team Audit**: Audit the design against all 65 checks below.

---

### Mode B: Real-Codebase Implementation, PR Review & Production Debugging
*Activate when writing backend/AI/JAX code, SQL migrations, API handlers, reviewing a PR, or debugging production bottlenecks in a repository.* **Do NOT stall with abstract whiteboard questions when the code is in front of you.** Inspect the code directly and enforce these **10 Non-Negotiable Production Codebase Laws**:

1. **Zero Network I/O Inside Database Transactions**:
   - Never execute an HTTP, gRPC, LLM API, Redis, SQS, or Kafka call between `BEGIN` and `COMMIT` (or while holding `SELECT ... FOR UPDATE`). Move external calls outside the transaction or write to a local `outbox_events` table in the same ACID transaction.
2. **Canonical Lock Ordering & High-Contention Row Locking**:
   - Sort multi-row lock acquisitions in ascending order (`ORDER BY id ASC FOR UPDATE`) so AB-BA deadlocks are impossible. Use `FOR UPDATE SKIP LOCKED` for worker/inventory pools, `FOR UPDATE NOWAIT` for specific item claims, and shard hot credit accounts across $K=64$ sub-accounts (`account_id_00..63`).
3. **Lease-Backed Idempotency, `UUIDv7` Locality & 53-Bit JSON Integer Safety**:
   - Enforce idempotency on `POST`/`PATCH` via `idempotency_keys(user_id, idempotency_key, request_hash, status, locked_until, response_body)` with a `locked_until` (`NOW() + 60s`) lease and `SHA256(incoming_body)` verification (`422` on mismatch).
   - Use time-ordered **RFC 9562 `UUIDv7`** (`16-byte` binary) or 64-bit Snowflake IDs instead of random `UUIDv4` (eliminating 50%-fill B+ tree page-split write amplification). Serialize all 64-bit IDs (`> 2^53 - 1 = 9,007,199,254,740,991`) and micro-unit balances as **JSON `string`s** (`json:"id,string"`) so `JSON.parse()` never corrupts trailing digits.
4. **Single-Layer Retries, `CLOCK_MONOTONIC`, Cross-AZ Topology & Redis `fork()`/`THP` Safety**:
   - Retry at a single layer using **AWS Full Jitter** ($t_{\text{sleep}} = \text{random}(0, \min(T_{\max}, T_{\text{base}} \times 2^{\text{attempt}}))$), enforce a **Process-Wide Retry Budget ($\le 10\%$)**, inject jitter into `Retry-After`, compute elapsed durations/rate-limits via **`CLOCK_MONOTONIC`**, and enable **Topology/Zone-Aware Routing** (`client.rack`, `topology-mode: Auto`).
   - On Redis/Valkey hosts, set `vm.overcommit_memory = 1`, disable Transparent Huge Pages (`THP = never`), cap `maxmemory <= 70%` RAM for `BGSAVE` Copy-on-Write safety, and cache `"NULL"` sentinels *only* on authoritative `0-row` responses (never on timeouts/errors) with $\le 30\text{s}$ TTL.
5. **Zero-Downtime Database Migrations (Expand-and-Contract)**:
   - Begin every migration with `SET lock_timeout = '2s'; SET statement_timeout = '10s';` so blocked DDL aborts instead of queueing traffic behind an `ACCESS EXCLUSIVE` metadata lock. Build indexes with `CREATE INDEX CONCURRENTLY` (`LOCK=NONE` in MySQL), add constraints with `NOT VALID` + `VALIDATE CONSTRAINT`, and follow **4-Phase Expand-and-Contract** (Add nullable $\to$ Dual-write + Backfill $\to$ Switch reads $\to$ Drop old).
6. **Database Engine Physics (Postgres MVCC HOT Updates, Subxid `SLRU`, PgBouncer & MySQL Gap Locks)**:
   - Set `fillfactor = 80` on high-update Postgres tables with zero indexes on mutated counters for **Heap-Only Tuple (HOT) Updates**, and set `idle_in_transaction_session_timeout = '30s'`.
   - Forbid nested `SAVEPOINT` / ORM `atomic()` / `PL/pgSQL EXCEPTION WHEN` inside loops ($>64$ subxids overflow `pg_subtrans` SLRU cache and freeze all cores on `SubtransControlLock`). Set `SET LOCAL plan_cache_mode = 'force_custom_plan'` on skewed multi-tenant tables to prevent the 6th-execution Generic Plan flip.
   - Behind PgBouncer `pool_mode = transaction`, use `SET LOCAL` and `pg_advisory_xact_lock()`. In MySQL InnoDB, use `INSERT ... ON DUPLICATE KEY UPDATE` (never `REPLACE INTO` or `SELECT FOR UPDATE` on non-existent rows under `REPEATABLE READ`).
7. **Keyset Cursor Pagination & Composite Covering Indexes**:
   - Forbid deep `OFFSET N` ($O(N)$ scan). Enforce keyset pagination: `WHERE (created_at, id) < (:cursor_ts, :cursor_id) ORDER BY created_at DESC, id DESC LIMIT 50`. Order composite indexes as **Equality $\to$ Range/Sort $\to$ Covered `SELECT` columns** (`Index-Only Scans`).
8. **AI Prefix-Cache Layout, Multi-Agent Isolation, JAX Static Shapes, `NCCL` Watchdogs & Prompt Security**:
   - Order prompts strictly **Frozen Static Prefix $\to$ Sorted Tool Schemas (`sort_keys=True`) $\to$ Dynamic Suffix** (never put `now()` at the top), and prepend per-tenant HMAC **`cache_salt`** to multi-tenant `RadixAttention`/vLLM prefix caches to prevent TTFT timing side-channels.
   - Isolate subagents in separate context windows returning $\le 500$-token structured summaries + artifact paths, and isolate parallel coding subagents in **Git Worktrees (`git worktree add`)**. Enforce `CSP: img-src 'self'` and taint-tracked HITL gates on untrusted external tool outputs.
   - Pad `@jax.jit` / `torch.compile` inputs to **Static Power-of-2 Shape Buckets** with AOT warmup before `/readyz`, remove `float(loss)` host syncs from step loops, share `torch.cuda.graph_pool_handle()` across CUDA Graph buckets, set `TORCH_NCCL_ASYNC_ERROR_HANDLING=1` + `TORCH_NCCL_HEARTBEAT_TIMEOUT_SEC=120`, persist rollout `behavior_logprobs` in RLHF/GRPO, and run untrusted code in **Firecracker MicroVMs** blocking RFC1918/`169.254.169.254`.
9. **Observability Cardinality Cap, Non-Blocking Logging & `ReDoS`-Safe Parsing**:
   - Exclude unbounded IDs (`user_id`, `order_id`, raw URLs) from Prometheus/Datadog metric labels ($< 1,000$ series per metric; use logs/traces/exemplars). Use linear-time **$O(N)$ Thompson NFA regexes (`RE2`, Rust `regex`, Go `regexp`)** with byte and JSON depth caps.
10. **Container Memory Bounds, Outbound HTTP Pools, K8s `ndots:2`, `TCP_NODELAY` & `SIGTERM` Drain**:
    - Cap runtime heap (`GOMEMLIMIT`, `-XX:MaxRAMPercentage=75.0`, `--max-old-space-size`) at $80\text{–}85\%$ of container memory to prevent `OOMKill (Exit 137)`, and avoid restrictive K8s CPU `limits` (`cfs_quota_us`).
    - Set `MaxIdleConnsPerHost >= 100`, enable `TCP_NODELAY = 1` (+ `writev` coalescing) to prevent $40\text{ms}$ Nagle + Delayed ACK stalls, set K8s `ndots: 2` + `single-request-reopen` + **NodeLocal DNSCache**, route gRPC via L7 Envoy/Linkerd or headless DNS, and on `SIGTERM` fail `/readyz` (`503`), **sleep $5\text{–}10\text{s}$ serving traffic**, then drain.

---

## Uncharted-Domain Deep-Research Fallback Protocol (When Modules 01–28 Are Not Enough)

If asked to design or debug a specialized domain outside Modules 01–28 (*FPGA/DPDK trading, LEO satellite routing, ROS2 loops, quantum HSMs, or post-cutoff AI architectures*), **NEVER bluff with generic textbook fluff**:
1. **Anchor to the 5 Hardware & Physics Invariants**: Compute/Memory Hierarchy (SRAM $\to$ HBM/DRAM $\to$ NVMe $\to$ NIC), Bandwidth/Latency Floor, Contention Profile, Crash Recovery/WAL, and Failure Blast Radius.
2. **Formulate & Execute Surgical Deep-Research Queries**: Generate 3–5 targeted queries for primary literature (OSDI/SOSP/MLSys papers, RFCs, kernel docs, postmortems) and run web/codebase research immediately.
3. **Synthesize in Sketch-to-Scale Format**: Build `Attempt 1 (Blunt Baseline + Code/Math) -> Exact Bottleneck -> Attempt 2 -> Final Production Design` + $\ge 3$ **Critical Hidden Edge Cases**.
4. **Offer to Persist**: Offer to append the synthesized architecture as **Module 29** in [`SYSTEM_DESIGN_MASTER_BRAIN.md`](./SYSTEM_DESIGN_MASTER_BRAIN.md).

---

## The 65-Point Master Red-Team Audit

Audit every proposed architecture or code review against these 65 checks (detailed in [`SYSTEM_DESIGN_MASTER_BRAIN.md`](./SYSTEM_DESIGN_MASTER_BRAIN.md)):

1. **Day-0 Over-Engineering**: Proved single vertical node + RDBMS saturates before adding Kafka/sharding?
2. **Unquantified Words**: Replaced every *"fast"*, *"huge"*, *"real-time"* with concrete `ms`/`RPS`/`GB` numbers?
3. **Network-Call-Inside-Transaction**: Zero HTTP/gRPC/LLM/SQS/Kafka/Redis calls inside `BEGIN...COMMIT`?
4. **Single-Statement Transaction**: No standalone `INSERT`/`UPDATE` wrapped in unnecessary explicit `BEGIN...COMMIT`?
5. **Unbounded DELETE Trap**: Soft deletes indexed and reaped via `ORDER BY id ASC LIMIT 100` batches?
6. **Upsert & Index**: `INSERT ... ON DUPLICATE KEY UPDATE` used instead of `REPLACE INTO`, backed by covering indexes?
7. **High-Contention Inventory**: Hot counts unrolled into unit rows with `FOR UPDATE SKIP LOCKED` or `NOWAIT`?
8. **Cache Stampede & Punching Bag**: Hot misses coalesced via per-key `SingleFlight` semaphores or 90%-TTL prefreshing?
9. **WebSocket Port Exhaustion**: Unidirectional feeds on SSE/CDN-polling, and $>65\text{k}$ WSS on naked DMZ nodes?
10. **Half-Open TCP Sockets**: Application-level `PING/PONG` heartbeats active to detect dead connections?
11. **Stop-The-World Batching**: In-memory write batching using Active-Passive Double Buffering (pointer swap)?
12. **Push vs. Pull Config Race**: Hybrid Push+Pull config updates guarded by `incoming.version > local.version`?
13. **Distributed Lock Fencing**: Redis locks acquired/released via atomic Lua and guarded by monotonic fencing tokens?
14. **Binary Relay & CDN URL**: Blobs uploaded directly to S3 via presigned URLs (`content-length-range`), storing only `image_id`?
15. **Storage Engine Disk I/O**: `uint64` offsets, deterministic `fseek`+`fread`, leftmost CRC32, and LSM tombstones kept to $L_{\max}$?
16. **Regular Flow == Error Flow**: Zero-data-loss ingestion spools to local disk first with 70%-disk LB self-detachment?
17. **Multi-Tenant Hot-Shard**: Stateful DBs using logical shards (`8,192`) and search using dynamic split routing (`{tenant_id}_{doc_id % M}`)?
18. **Stateless Self-Healing Pulse**: Static metadata piggybacked onto heartbeats so wiped memory nodes self-heal in 5s?
19. **Connection Pool In-Flight Eviction**: `conn.expiresAt` checked strictly inside `pool.Put(conn)` after query completion?
20. **Read-Your-Own-Writes Pinning**: Post-write reads pinned to Primary DB for $5\text{–}10\text{s}$ (or GTID-gated)?
21. **Poison Pill DLQ**: Consumers cap retries at $\le 3$ before routing malformed messages to a Dead Letter Queue?
22. **Unindexed `FOR UPDATE` Escalation**: Every `SELECT ... FOR UPDATE` verified via `EXPLAIN` to hit a narrow index?
23. **S3 Multipart Abandonment**: `AbortIncompleteMultipartUpload` (7 days) configured on all S3 buckets?
24. **Graph DB Supernode**: Celebrity 1-to-N follower lists stored in clustered relational tables instead of graph supernodes?
25. **Cassandra Tombstone Overload**: High-churn deletes avoided in wide-column stores in favor of time-bucketed table drops?
26. **Snowflake Clock Drift**: 64-bit ID generator handles backward NTP jumps ($\le 5\text{ms}$ wait, $>5\text{ms}$ fail-fast) and sequence rollover?
27. **Proof-of-Ownership**: Content-addressed deduplication requires a random byte-range HMAC challenge?
28. **Consistent Hashing Domino**: $\ge 256$ virtual nodes per physical server used on the consistent hash ring?
29. **Live Streaming Manifest Herd**: HLS `.m3u8` manifests protected by an Origin Shield with request collapsing?
30. **GeoHash Boundaries**: Spatial proximity search queries the center cell plus all **8 adjacent neighbor cells**?
31. **Consensus Zombie-Leader & `PreVote`**: Linearizable Raft reads protected by `ReadIndex`/Leases, with `PreVote` enabled?
32. **Stuck Idempotency Key & Tampering**: `PROCESSING` keys have `locked_until` lease expiry and `SHA256(body)` verification (`422`)?
33. **Out-of-Order Saga Cancel & CDC Inbox**: Early `Cancel` writes a `CANCELLED` tombstone, and CDC consumers deduplicate via an `inbox` table?
34. **Ledger Canonical Lock Order & Hot Accounts**: Multi-account locks sorted (`ORDER BY id ASC FOR UPDATE`) and hot accounts sharded ($K=64$)?
35. **$3^4$ Retry Amplification & Retry Budget**: Retries restricted to 1 layer with Full Jitter and a $\le 10\%$ process-wide retry budget?
36. **Overload LIFO/CoDel & Failover DNS**: Overloaded queues drop expired requests via CoDel/LIFO, and DB pools set `5s` DNS TTL + evict on `READONLY`?
37. **Refresh Token Family & Multi-Tenant BOLA**: Reused refresh tokens revoke the entire `token_family_id`, and `tenant_id` is in composite PKs/RLS?
38. **Stream Idle-Partition Watermark & State TTL**: Flink configures `withIdleness()` and `StateTtlConfig` on all RocksDB state?
39. **High-Cardinality Metric Explosion**: `user_id`, `order_id`, and raw URLs excluded from metric labels ($<1,000$ series per metric)?
40. **Vector Pre-Filtering & Semantic Cache Scope**: Multi-tenant vector search uses payload-aware pre-filtering, and Semantic Cache is namespaced by `(tenant_id, user_id, scope_hash)`?
41. **gRPC L4 Pinning & Channel Pool**: gRPC uses L7 Envoy/Linkerd or headless round-robin DNS + `MaxConnectionAge`?
42. **Zero-Downtime DDL `lock_timeout` & Expand-Contract**: Migrations set `SET lock_timeout = '2s'`, use `CONCURRENTLY` / `NOT VALID`, and follow 4-phase Expand-and-Contract?
43. **Postgres MVCC HOT Updates & PgBouncer**: High-update Postgres tables use `fillfactor = 80`, `idle_in_transaction_session_timeout`, and `SET LOCAL`?
44. **Container OOMKill & K8s CPU Throttling**: Runtime memory capped at $80\text{–}85\%$ (`GOMEMLIMIT` / `MaxRAMPercentage`) and CPU `limits` throttling avoided?
45. **Kubernetes `SIGTERM` 502 Drain Race**: On `SIGTERM`, app fails `/readyz`, sleeps $5\text{–}10\text{s}$ while continuing to serve traffic, then drains?
46. **Disaggregated Prefill/Decode & KV-Cache Math**: Prefill nodes separated from Decode nodes (RDMA KV transfer + MLA/GQA + PagedAttention)?
47. **MoE Load-Balancing & Long-CoT Offloading**: MoE uses Auxiliary-Loss-Free bias routing, and long-CoT (`R1`/`o1`) offloads KV cache to Host DRAM?
48. **Generative Media (Meta Muse / Diffusion) & S-LoRA**: Media jobs on priority GPU queues, S-LoRA adapter paging, and Meta Muse parallel masked decoding?
49. **ML RecSys 4-Stage Funnel & Time-Travel Leakage**: 4-stage cascade (`Two-Tower ANN -> Pre-Rank -> DLRM/MMoE -> DPP Diversity`) logs features at inference time?
50. **Agent Checkpoints & Firecracker Sandbox**: Agents checkpoint state before tool calls and execute untrusted code in Firecracker MicroVMs blocking RFC1918/`169.254.169.254`?
51. **Prompt Prefix-Cache & Deterministic Tool Keys**: Prompts ordered Frozen Static Prefix $\to$ Sorted Tool Schemas (`sort_keys=True`) $\to$ Dynamic Suffix?
52. **Constrained Decoding FSM & Complexity Cascade**: Grammar JSON decoders (`XGrammar`/`Outlines`) cap whitespace loops, with a cascade router for simple queries?
53. **Multi-Agent Context Isolation & Git Worktrees**: Subagents run in isolated contexts returning $\le 500$-token summaries + artifacts, and coding agents use Git Worktrees?
54. **JAX / XLA Static Shape Buckets & Host-Syncs**: `@jax.jit` / `torch.compile` inputs padded to **Static Power-of-2 Buckets** with AOT warmup and zero `float(loss)` loop syncs?
55. **4D Parallelism NVLink & Two-Phase Checkpointing**: $TP=8$ kept inside single-node NVLink ($900\text{ GB/s}$), with $<1\text{s}$ HBM-to-Pinned-RAM async checkpointing?
56. **Linear-Time Regex (`ReDoS`) & Parser Depth**: Untrusted inputs validated with linear-time **$O(N)$ `RE2` / Rust `regex` / Go `regexp`** and byte/JSON depth caps?
57. **`CLOCK_MONOTONIC` Elapsed Timers**: Timeouts, rate-limit refills, and circuit-breakers computed using **`CLOCK_MONOTONIC`** (never `CLOCK_REALTIME`)?
58. **Outbound HTTP Pool, `TIME_WAIT` & `nf_conntrack`**: HTTP clients tuned with `MaxIdleConnsPerHost >= 100`, `tcp_tw_reuse = 1`, and **NodeLocal DNSCache**?
59. **GPU Float Non-Associativity & RLHF Logprobs**: Exact inference `behavior_logprobs` persisted during RLHF/GRPO rollouts rather than recomputed in the trainer?
60. **Cross-AZ Egress Tax ($\$0.02/\text{GB}$) & Jittered `Retry-After`**: Kafka/Redis/K8s pinned to **Topology/Zone-Aware Routing**, with jittered `Retry-After` headers?
61. **`UUIDv7` Locality & 53-Bit JSON Integer Safety**: Time-ordered `UUIDv7` (`16B` binary) or Snowflake IDs used over `UUIDv4`, and 64-bit IDs (`> 2^53 - 1`) serialized as **JSON `string`s**?
62. **Redis `fork()` CoW + `THP` OOM & Negative-Cache**: `vm.overcommit_memory = 1`, `THP = never`, `maxmemory <= 70%` set on Redis, and `"NULL"` sentinels cached *only* on authoritative `0-row` hits ($\le 30\text{s}$ TTL)?
63. **Postgres Subxid `SLRU` & 6th-Exec Generic Plan**: Zero nested `SAVEPOINT` / `EXCEPTION WHEN` inside loops ($>64$ subxids freeze `SubtransControlLock`), and `plan_cache_mode = force_custom_plan` on skewed tables?
64. **K8s `ndots:5` DNS Storm & `TCP_NODELAY` + Delayed ACK**: K8s Pod specs set `ndots: 2` + `single-request-reopen` (or trailing-dot FQDNs), and `TCP_NODELAY = 1` + `writev` enabled to prevent $40\text{ms}$ stalls?
65. **`NCCL` Watchdog, CUDA Graph Pool & Prefix Security**: `TORCH_NCCL_ASYNC_ERROR_HANDLING=1` + `TORCH_NCCL_HEARTBEAT_TIMEOUT_SEC=120`, shared `graph_pool_handle()`, salted KV prefix cache (`cache_salt`), and `CSP: img-src 'self'` + taint-tracked HITL gates?

---

## The 28 Core Knowledge Modules & Self-Evolution Engine

Refer to [`SYSTEM_DESIGN_MASTER_BRAIN.md`](./SYSTEM_DESIGN_MASTER_BRAIN.md) for full mathematical proofs, SQL schemas, and failure traces across all 28 modules:
- **01–05 (Presence, Protocols, Concurrency, NoSQL & L7 LB/Locks)**: B+ Tree fill-factors, `SingleFlight` stampede coalescing, ProxySQL, Naked WSS DMZ, `FOR UPDATE SKIP LOCKED`/`NOWAIT`, Columnar/Graph traps, Redlock Lua & fencing tokens.
- **06–09 (Distributed IDs, CDN/S3, Write Batching & C-Level Redis)**: 64-bit Snowflake, `UUIDv7` locality, 53-bit JSON strings, `8,192` logical shards, Presigned S3, Double-Buffered Pointer Swap, Redis `robj`/`epoll`/LRU, `fork()` CoW + `THP=never`, $\ge 256$ vnode rings.
- **10–13 (Storage Engines: Bitcask & LSM, Live Video & Search)**: `uint64` offsets, Leftmost CRC32 torn-write recovery, MemTable/SSTables/Leveled compaction ($L_{\max}$ tombstones), HLS `.m3u8` Origin Shield, Inverted Index/BK-Tree & dynamic tenant shard split (`{tenant}_{id % M}`).
- **14–18 (Schedulers, HyperLogLog/Sync, Geo/Graph, Raft & Sagas)**: Flash sale rows, HLL harmonic mean, Dropbox chunking, GeoHash 8-neighbors, FlockDB clustered PK, Raft `ReadIndex`/`PreVote`, Sagas & Transactional Outbox/Inbox.
- **19–23 (Ledgers, SRE Resiliency, Security/ReBAC, Flink & OTel)**: Double-entry ledgers (`ORDER BY id ASC`, $K=64$ shards), Full Jitter & $10\%$ Retry Budget, `CLOCK_MONOTONIC`, Zanzibar, `RE2` regex, Flink `withIdleness()`/TTL, $<1,000$ metric cardinality cap.
- **24–28 (Vector/LLM Engines, gRPC/Mesh, Production Codebase, DeepSeek/Muse & Agents/JAX)**: Filterable HNSW, RRF + Cross-Encoder, KV-Cache math, Paged/RadixAttention (`cache_salt`), gRPC L7/Headless, Zero-downtime DDL (`lock_timeout`), Postgres HOT/Subxid SLRU, K8s `ndots:2`/`SIGTERM`, DeepSeek MLA/MoE, Disaggregated Prefill/Decode, Meta Muse, 4-stage RecSys, Isolated subagent Worktree DAGs, JAX static shape buckets & `NCCL` watchdogs.

**Future-Model Self-Evolution**: When asked to upgrade this skill, audit [`SYSTEM_DESIGN_MASTER_BRAIN.md`](./SYSTEM_DESIGN_MASTER_BRAIN.md) and [`SKILL.md`](./SKILL.md), add implementation-grade modules/checks (zero fluff, 100% anonymity), and run `python sync.py` to synchronize all agent rules and `index.html`.
