# API Standard

**Scope:** projects exposing HTTP, RPC, event, queue, webhook, or other machine-consumed interfaces.

**Classification:** Required baseline when applicable, with contract requirements increasing when interfaces have independent consumers or deployment lifecycles.

## Rules

### API-001 — Machine-readable interface contract

- **Applicability:** Public, partner, or multi-service APIs and event interfaces. Internal single-consumer interfaces SHOULD also adopt a contract when practical.
- **Strength:** Required for public, partner, and multi-service interfaces; Recommended otherwise.
- **Rule:** Applicable interfaces MUST maintain a versioned machine-readable contract. HTTP APIs SHOULD use OpenAPI; event and message interfaces MAY use AsyncAPI, JSON Schema, Protobuf, or an equivalent format.
- **Evidence:** OpenAPI, AsyncAPI, JSON Schema, Protobuf, generated types, contract repository, and version history.
- **Verification:** Compare the contract with implemented routes, messages, schemas, and representative responses.

### API-002 — Boundary validation

- **Applicability:** All external API and message inputs and outputs.
- **Strength:** Required.
- **Rule:** API and message inputs MUST be validated before entering application logic, and outputs MUST conform to the documented contract or fail through a defined error path.
- **Evidence:** DTOs, schemas, validators, serialization configuration, and negative tests.
- **Verification:** Exercise malformed, missing, unexpected, oversized, and incompatible input and confirm safe contract behavior.

### API-003 — Stable error contract

- **Applicability:** APIs and message interfaces consumed by other software.
- **Strength:** Required.
- **Rule:** Errors MUST use a stable, documented structure with actionable machine-readable classification and safe human-readable context. Internal stack traces and secrets MUST NOT cross the interface.
- **Evidence:** Error schemas, exception mapping, status/code conventions, and negative tests.
- **Verification:** Compare representative validation, authentication, authorization, conflict, not-found, rate-limit, and internal failures with the published contract.

### API-004 — Compatibility policy

- **Applicability:** APIs or messages with consumers that may not deploy simultaneously.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST document compatibility, deprecation, and versioning behavior. Breaking changes MUST use an explicit migration, version, or coordinated deployment strategy.
- **Evidence:** Versioning policy, changelog, deprecation notices, migration guides, and consumer communication.
- **Verification:** Review a representative contract change and confirm its compatibility impact and rollout path are explicit.

### API-005 — Bounded collection operations

- **Applicability:** APIs returning or searching collections, lists, feeds, or query results.
- **Strength:** Required when applicable.
- **Rule:** Collection operations MUST define pagination, maximum page size, filtering or sorting limits, and behavior for expensive or unbounded queries.
- **Evidence:** Contract schemas, query validation, database queries, indexes, and performance tests.
- **Verification:** Request empty, maximum, invalid, deeply paginated, and expensive query cases and confirm bounded resource use.

### API-006 — Safe retry and idempotency behavior

- **Applicability:** APIs or message handlers that may be retried, duplicated, or delivered at least once.
- **Strength:** Required when applicable.
- **Rule:** Retryable operations MUST define idempotency, deduplication, or safe duplicate behavior. Non-idempotent mutations MUST NOT be retried blindly.
- **Evidence:** Idempotency keys, unique constraints, deduplication records, transaction boundaries, and retry documentation.
- **Verification:** Repeat requests or deliver messages twice and confirm the documented result without unintended duplicate side effects.

### API-007 — Contract tests

- **Applicability:** Public, partner, multi-service, or independently deployed API and message consumers.
- **Strength:** Required when applicable; Recommended otherwise.
- **Rule:** Applicable interfaces MUST have automated contract or integration tests that detect incompatibility between producers and consumers.
- **Evidence:** Contract tests, generated clients, consumer-driven contracts, schemas in CI, and test results.
- **Verification:** Introduce a representative incompatible contract change and confirm the supported validation workflow detects it.

### API-008 — Interface observability

- **Applicability:** Deployed APIs and message handlers.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD expose safe correlation, latency, throughput, error, retry, and saturation signals appropriate to the interface.
- **Evidence:** Request IDs, metrics, traces, logs, dashboards, and alerts.
- **Verification:** Trace a representative request or message through success, validation failure, dependency failure, and timeout paths.

## Review questions

- Can consumers discover the current interface contract without reading implementation code?
- Are input, output, and error behavior validated against that contract?
- What happens when producers and consumers deploy at different times?
- Are collections bounded and expensive queries controlled?
- Are retries and duplicate deliveries safe?
- Will CI detect a breaking interface change?
