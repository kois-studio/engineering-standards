# Configuration and Operations Standard

**Scope:** software projects that run in a deployed environment, communicate with external systems, or require runtime configuration.

**Classification:** Required baseline when applicable, with observability and operational maturity recommendations beyond the minimum.

## Rules

### OPS-001 — Validated startup configuration

- **Applicability:** Deployed applications and services with runtime configuration.
- **Strength:** Required when applicable.
- **Rule:** Runtime configuration MUST be validated before the application serves traffic or performs durable work. Missing, malformed, or incompatible configuration MUST produce a clear startup failure.
- **Evidence:** Configuration schema, startup code, environment documentation, and startup tests.
- **Verification:** Start the application with missing and invalid configuration and confirm it fails safely before serving work.

### OPS-002 — Explicit environment boundaries

- **Applicability:** Projects with multiple environments or deployment stages.
- **Strength:** Required when applicable.
- **Rule:** Environment-specific configuration, dependencies, and safety controls MUST be explicit. Production behavior MUST NOT depend on accidental developer defaults or untracked local files.
- **Evidence:** Environment examples, deployment configuration, manifests, and project operations documentation.
- **Verification:** Compare local, test, staging, and production configuration paths and identify undeclared or unsafe defaults.

### OPS-003 — Bounded external operations

- **Applicability:** Applications making network, database, queue, cache, filesystem, or other resource-bound calls.
- **Strength:** Required when applicable.
- **Rule:** External operations MUST have explicit timeouts, cancellation behavior, and resource limits appropriate to the dependency and workload.
- **Evidence:** Client configuration, contexts, timeout values, connection pools, queue limits, and failure tests.
- **Verification:** Exercise unavailable, slow, and overloaded dependencies and confirm work stops or degrades within bounded limits.

### OPS-004 — Controlled retries

- **Applicability:** Applications retrying external operations.
- **Strength:** Required when applicable.
- **Rule:** Retries MUST be bounded, use appropriate backoff, and apply only to failures that are safe to retry. Retry behavior MUST NOT amplify an outage or duplicate non-idempotent work unexpectedly.
- **Evidence:** Retry configuration, backoff policy, idempotency controls, and failure tests.
- **Verification:** Simulate repeated failures and confirm retry count, delay, cancellation, and duplicate-work behavior.

### OPS-005 — Health and readiness signaling

- **Applicability:** Long-running services, workers, and applications managed by a deployment platform.
- **Strength:** Required when applicable.
- **Rule:** Services MUST expose or provide a documented health and readiness mechanism appropriate to their runtime. Readiness MUST reflect whether the service can safely receive work, not merely whether its process is alive.
- **Evidence:** Health endpoints, probes, worker heartbeats, deployment configuration, and dependency checks.
- **Verification:** Test startup, dependency loss, degraded state, and shutdown behavior through the platform’s configured signals.

### OPS-006 — Graceful shutdown

- **Applicability:** Long-running services and workers.
- **Strength:** Required when applicable.
- **Rule:** Services MUST handle termination and shutdown by stopping new work, cancelling or completing in-flight work according to policy, releasing resources, and exiting within a bounded period.
- **Evidence:** Signal handling, cancellation paths, worker ownership, server shutdown configuration, and shutdown tests.
- **Verification:** Terminate the service during idle and active work and confirm no unbounded process or resource leak remains.

### OPS-007 — Structured diagnostic logging

- **Applicability:** Deployed applications, services, workers, and scheduled jobs.
- **Strength:** Required when applicable.
- **Rule:** Runtime logs MUST be structured enough to support diagnosis and MUST include appropriate event context without exposing secrets or sensitive data.
- **Evidence:** Logger configuration, event fields, correlation identifiers, redaction rules, and representative logs.
- **Verification:** Trace a representative request or job across relevant components and confirm failures can be diagnosed from safe logs.

### OPS-008 — Operational observability

- **Applicability:** Production services and systems with meaningful availability, performance, or cost impact.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD provide metrics, traces, alerts, or equivalent signals for availability, latency, errors, resource saturation, and important business or processing outcomes.
- **Evidence:** Dashboards, metrics, traces, alerts, SLOs, and runbooks.
- **Verification:** Confirm operators can detect and investigate the project’s most important failure and degradation modes.

### OPS-009 — Failure and recovery documentation

- **Applicability:** Deployed projects with external dependencies, durable state, or operational responsibilities.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST document important failure modes, recovery steps, ownership, and escalation paths. Durable data MUST have an appropriate backup, restore, or reconstruction strategy.
- **Evidence:** Runbooks, backup configuration, restore tests, ownership records, and incident documentation.
- **Verification:** Walk through a representative failure and recovery scenario and identify where the procedure is tested or known to be uncertain.

## Review questions

- Does invalid configuration fail before unsafe work begins?
- Are external operations bounded by timeouts, cancellation, limits, and safe retries?
- Can the platform distinguish alive from ready?
- Does shutdown stop work and release resources predictably?
- Can operators diagnose failures without sensitive data leaking into logs?
- Can important data and services be recovered within their expected risk tolerance?

## Boundaries and exceptions

Static sites and build-only projects may mark runtime service rules as `Not applicable`. They still MUST document their deployment configuration, build failure behavior, and any external systems used during build or content delivery.
