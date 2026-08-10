# NestJS Backend Profile

**Use when:** a TypeScript backend benefits from modular architecture, dependency injection, and HTTP or event-driven APIs.

**Scope:** NestJS backends that adopt this profile.

## Rules

### NEST-001 — Capability-oriented modules

- **Applicability:** NestJS backends with multiple business capabilities.
- **Strength:** Recommended.
- **Rule:** Modules SHOULD be organized around business capabilities and explicit boundaries.
- **Evidence:** NestJS modules, providers, controllers, message handlers, and dependency graph.
- **Verification:** Confirm each capability has an understandable ownership boundary and does not depend on unrelated internals.

### NEST-002 — Thin transport handlers

- **Applicability:** NestJS controllers and message handlers.
- **Strength:** Recommended.
- **Rule:** Controllers and message handlers SHOULD be thin; use-case orchestration SHOULD live in application services.
- **Evidence:** Controllers, handlers, application services, and tests.
- **Verification:** Inspect representative handlers for business rules, persistence logic, and complex branching that belongs elsewhere.

### NEST-003 — Transport-independent domain rules

- **Applicability:** NestJS backends with meaningful domain rules.
- **Strength:** Recommended.
- **Rule:** Domain rules SHOULD remain independent from transport and infrastructure where practical.
- **Evidence:** Domain/application modules and imports from framework or infrastructure packages.
- **Verification:** Confirm core rules can be exercised without starting an HTTP server or external service.

### NEST-004 — Boundary DTO validation

- **Applicability:** NestJS HTTP, event, configuration, and persistence boundaries.
- **Strength:** Required.
- **Rule:** DTOs and runtime validation MUST be used at HTTP, event, configuration, and persistence boundaries where untrusted or external data enters the system.
- **Evidence:** DTOs, validation pipes, schemas, parsers, and adapter tests.
- **Verification:** Trace representative external inputs and confirm malformed data is rejected before application logic.

### NEST-005 — Consistent error and observability behavior

- **Applicability:** NestJS services exposed to clients or operating in distributed environments.
- **Strength:** Recommended.
- **Rule:** Services SHOULD use consistent error mapping, structured logging, and request correlation appropriate to the deployment.
- **Evidence:** Exception filters, error mappers, logger configuration, correlation IDs, and operational documentation.
- **Verification:** Exercise representative success and failure paths and inspect logs and exposed errors.

### NEST-006 — Module responsibility and interface

- **Applicability:** Every NestJS module.
- **Strength:** Required.
- **Rule:** Each module MUST have a clear responsibility and public interface.
- **Evidence:** Module metadata, exported providers, and module documentation.
- **Verification:** Identify the module’s responsibility, public exports, and consumers; flag accidental access to internals.

### NEST-007 — Explicit cross-module dependencies

- **Applicability:** NestJS modules that depend on other modules.
- **Strength:** Recommended.
- **Rule:** Cross-module dependencies SHOULD be explicit and SHOULD NOT rely on internal implementation details.
- **Evidence:** Imports, module exports, provider tokens, and dependency graph.
- **Verification:** Confirm dependencies cross boundaries through intentional interfaces or exported contracts.

### NEST-008 — Defense beyond controllers

- **Applicability:** NestJS APIs and event-driven handlers with authorization or domain invariants.
- **Strength:** Required.
- **Rule:** Controllers MUST NOT be treated as the sole enforcement point for authorization or domain invariants.
- **Evidence:** Authorization policies, application services, domain rules, and tests for alternate entry points.
- **Verification:** Check HTTP, event, job, and internal entry points for consistent enforcement.

### NEST-009 — Validated external input

- **Applicability:** All external input entering a NestJS application.
- **Strength:** Required.
- **Rule:** External input MUST be validated before entering application logic.
- **Evidence:** Validation pipes, schemas, parsers, and boundary tests.
- **Verification:** Trace representative request, event, configuration, and integration inputs.

### NEST-010 — Stable safe error contracts

- **Applicability:** APIs and events exposed by NestJS services.
- **Strength:** Required.
- **Rule:** Errors exposed through APIs or events MUST use a stable, documented contract without leaking secrets or internal stack details.
- **Evidence:** Error DTOs, exception filters, API/event schemas, and negative tests.
- **Verification:** Exercise representative errors and confirm clients receive stable safe data.

### NEST-011 — Validated configuration and secret hygiene

- **Applicability:** NestJS services with runtime configuration or secrets.
- **Strength:** Required.
- **Rule:** Configuration MUST be validated at startup and secrets MUST NOT be committed.
- **Evidence:** Startup validation, environment schemas, secret-management configuration, and repository history checks.
- **Verification:** Start with invalid configuration and inspect tracked files and history for committed secrets.

### NEST-012 — Persistence and cache boundaries

- **Applicability:** NestJS backends using databases, Redis, queues, search systems, or other infrastructure adapters.
- **Strength:** Required when applicable.
- **Rule:** Persistence and cache integrations MUST be isolated behind intentional adapters or module interfaces. Application and domain logic MUST NOT depend on incidental ORM, Redis-client, or infrastructure details.
- **Evidence:** Repository interfaces, adapters, providers, module exports, and integration tests.
- **Verification:** Trace representative use cases and confirm infrastructure can be replaced, tested, or changed without rewriting domain rules.

### NEST-013 — Explicit transaction and consistency behavior

- **Applicability:** NestJS use cases that update multiple records, collections, stores, or related side effects.
- **Strength:** Required when applicable.
- **Rule:** Use cases MUST define transaction, ordering, partial-failure, and consistency behavior for multi-step changes. Distributed side effects MUST use an explicit coordination or recovery strategy.
- **Evidence:** Transaction boundaries, outbox or event patterns, compensating actions, consistency documentation, and failure tests.
- **Verification:** Exercise partial database failure, duplicate delivery, and downstream unavailability and confirm the documented outcome.

### NEST-014 — Idempotent asynchronous handlers

- **Applicability:** NestJS event handlers, queue consumers, scheduled jobs, and webhook processors.
- **Strength:** Required when applicable.
- **Rule:** Asynchronous handlers MUST define duplicate-delivery, retry, ordering, and poison-message behavior. Handlers MUST be idempotent or use explicit deduplication for operations that can be delivered more than once.
- **Evidence:** Message keys, deduplication records, retry policies, dead-letter handling, and handler tests.
- **Verification:** Deliver the same message repeatedly and simulate failures before and after side effects.

### NEST-015 — Managed infrastructure lifecycle

- **Applicability:** NestJS services using databases, Redis, queues, schedulers, or other long-lived resources.
- **Strength:** Required when applicable.
- **Rule:** Services MUST manage initialization, health/readiness, connection limits, and graceful shutdown for infrastructure resources.
- **Evidence:** Lifecycle hooks, connection configuration, health indicators, shutdown handlers, and deployment probes.
- **Verification:** Test startup dependency failure, readiness transitions, termination during active work, and resource release.

### NEST-016 — Contract-aligned transport

- **Applicability:** NestJS HTTP APIs and event-driven interfaces consumed outside a single application boundary.
- **Strength:** Required when applicable.
- **Rule:** HTTP routes and event handlers MUST remain aligned with the project’s machine-readable interface contract, including schemas, errors, compatibility, and deprecation behavior.
- **Evidence:** OpenAPI or event schemas, DTOs, generated documentation, contract tests, and versioning policy.
- **Verification:** Compare the published contract with implemented routes, messages, and representative success and failure responses.

## Review questions

- Are module boundaries aligned with business responsibilities?
- Are transport, application, domain, and infrastructure concerns appropriately separated?
- Are validation, authorization, error handling, and observability consistent?
- Are database and external-service integrations covered by meaningful tests?
- Are transactions, cache behavior, retries, and partial failures explicit?
- Can the service shut down without losing or duplicating work unexpectedly?

## Boundaries and exceptions

NestJS is a preferred TypeScript backend profile, not a universal requirement. A smaller service may reasonably use a lighter framework when the resulting boundaries and operational behavior remain clear.
