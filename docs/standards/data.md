# Data and Persistence Standard

**Scope:** projects that store, transform, migrate, cache, or otherwise own durable or shared data.

**Classification:** Required baseline when applicable.

## Rules

### DATA-001 — Data ownership and schema source of truth

- **Applicability:** Projects with databases, durable files, external data stores, or shared schemas.
- **Strength:** Required.
- **Rule:** Every important dataset MUST have an identified owner, source of truth, schema definition, access boundary, and lifecycle documentation.
- **Evidence:** Schema files, models, migrations, data-flow documentation, ownership records, and project ADRs.
- **Verification:** Trace representative data from creation through reads, updates, deletion, backup, and external sharing.

### DATA-002 — Versioned migrations

- **Applicability:** Projects changing durable schemas or persisted data.
- **Strength:** Required when applicable.
- **Rule:** Schema and data changes MUST be versioned, repeatable, ordered, and executed through a documented migration process. Projects MUST document forward-compatibility and recovery behavior; rollback scripts are not assumed to be safe for every data change.
- **Evidence:** Migration files, migration runner, deployment order, compatibility notes, and recovery procedures.
- **Verification:** Run migrations from a clean baseline and inspect how deployment failure, partial application, and recovery are handled.

### DATA-003 — Enforced data integrity

- **Applicability:** Projects with relational or otherwise constraint-capable persistence.
- **Strength:** Required when applicable.
- **Rule:** Data invariants MUST be enforced at the strongest appropriate boundary, including database constraints, transactions, application validation, or domain rules as required by the failure impact.
- **Evidence:** Constraints, transactions, validation logic, domain rules, and integrity tests.
- **Verification:** Attempt invalid, concurrent, duplicate, and partial operations and confirm impossible states are rejected or recovered safely.

### DATA-004 — Explicit consistency boundaries

- **Applicability:** Projects with multiple stores, asynchronous processing, replicas, or eventual consistency.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST document consistency, ordering, transaction, and failure behavior across data stores and asynchronous boundaries.
- **Evidence:** Architecture diagrams, transaction code, event flows, outbox or reconciliation mechanisms, and failure tests.
- **Verification:** Trace a write across its dependent stores and confirm what readers observe during success, delay, duplication, and failure.

### DATA-005 — Query and index responsibility

- **Applicability:** Projects with queryable collections or persistent stores.
- **Strength:** Required when applicable.
- **Rule:** Important query paths MUST have bounded behavior, appropriate indexes or access structures, and a documented approach to measuring or investigating performance.
- **Evidence:** Query code, indexes, explain plans, limits, load tests, and performance observations.
- **Verification:** Exercise representative high-volume, filtered, sorted, and paginated queries and inspect their resource behavior.

### DATA-006 — Cache correctness

- **Applicability:** Projects using Redis or another cache or materialized read store.
- **Strength:** Required when applicable.
- **Rule:** A cache MUST have a documented source of truth, key scheme, serialization format, TTL or invalidation policy, stale-data tolerance, failure behavior, and stampede or concurrency strategy where relevant. A cache MUST NOT silently become the only durable source of truth unless explicitly designed and documented as such.
- **Evidence:** Cache client configuration, key builders, invalidation code, TTLs, fallback behavior, and cache tests.
- **Verification:** Test stale entries, invalidation races, cache misses, cache outages, serialization changes, and concurrent rebuilds.

### DATA-007 — Backup and recovery

- **Applicability:** Projects responsible for durable data whose loss or corruption has material impact.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST have an appropriate backup, restore, or reconstruction strategy with defined ownership and recovery expectations.
- **Evidence:** Backup configuration, retention policy, restore procedure, recovery objectives, and restore tests.
- **Verification:** Perform or inspect a recent restore or reconstruction test and record known gaps.

## Review questions

- Is every important dataset owned and traceable to a source of truth?
- Can a new environment reproduce the schema and required data transformations?
- Are invariants protected against invalid, duplicate, concurrent, and partial operations?
- Are consistency and failure behaviors explicit across stores and asynchronous work?
- Are collection queries bounded and indexed?
- Is Redis a cache, a read model, or a source of truth—and is that behavior documented and tested?
