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

## Review questions

- Are module boundaries aligned with business responsibilities?
- Are transport, application, domain, and infrastructure concerns appropriately separated?
- Are validation, authorization, error handling, and observability consistent?
- Are database and external-service integrations covered by meaningful tests?

## Boundaries and exceptions

NestJS is a preferred TypeScript backend profile, not a universal requirement. A smaller service may reasonably use a lighter framework when the resulting boundaries and operational behavior remain clear.
