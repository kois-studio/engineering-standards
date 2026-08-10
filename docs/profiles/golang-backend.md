# Go Backend Profile

**Use when:** operational simplicity, performance, concurrency, static binaries, or deployment characteristics make Go a good fit.

**Scope:** Go backends that adopt this profile.

## Rules

### GO-001 — Responsibility-oriented packages

- **Applicability:** Go backends with multiple packages or capabilities.
- **Strength:** Recommended.
- **Rule:** Packages SHOULD be organized around responsibilities and stable dependency direction.
- **Evidence:** Package tree, imports, and package documentation.
- **Verification:** Inspect dependency direction and confirm package boundaries reflect stable responsibilities.

### GO-002 — Thin transport handlers

- **Applicability:** Go HTTP, RPC, and message transport handlers.
- **Strength:** Recommended.
- **Rule:** Transport handlers SHOULD be thin and application behavior SHOULD remain explicit.
- **Evidence:** Handler implementations, application services, and tests.
- **Verification:** Inspect handlers for business logic or infrastructure coupling that obscures the use case.

### GO-003 — Standard library preference

- **Applicability:** Go services choosing dependencies for common infrastructure concerns.
- **Strength:** Optional.
- **Rule:** Projects SHOULD prefer the standard library when it provides a clear, maintainable solution.
- **Evidence:** Dependency manifest and design decisions for non-standard libraries.
- **Verification:** Confirm additional dependencies have a clear maintenance or capability benefit.

### GO-004 — Boundary validation and typed errors

- **Applicability:** Go services receiving external input.
- **Strength:** Required.
- **Rule:** External input MUST be validated at boundaries and services MUST return typed, actionable errors where callers need to distinguish failure classes.
- **Evidence:** Decoders, validators, error types, and boundary tests.
- **Verification:** Trace representative external inputs and failure paths into application logic.

### GO-005 — Context propagation

- **Applicability:** Go request-scoped or externally bounded work.
- **Strength:** Required.
- **Rule:** Services MUST use context propagation for cancellation, deadlines, and request-scoped work.
- **Evidence:** Function signatures, context usage, timeout configuration, and cancellation tests.
- **Verification:** Trace context from the transport boundary through outbound calls and long-running operations.

### GO-006 — Table-driven and boundary tests

- **Applicability:** Go projects with unit and infrastructure tests.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD use table-driven unit tests and integration tests for meaningful infrastructure boundaries.
- **Evidence:** Test files, table cases, integration setup, and CI commands.
- **Verification:** Review representative tests for clear cases and meaningful infrastructure coverage.

### GO-007 — Small intentional package APIs

- **Applicability:** Exported Go package identifiers.
- **Strength:** Recommended.
- **Rule:** Package APIs SHOULD be small and intentional; projects SHOULD avoid unnecessary exported identifiers.
- **Evidence:** Exported declarations and package documentation.
- **Verification:** Review exported identifiers and confirm each is part of an intentional package contract.

### GO-008 — Diagnosable safe errors

- **Applicability:** Go service errors returned or logged across boundaries.
- **Strength:** Required.
- **Rule:** Errors MUST retain enough context for diagnosis while avoiding secret or sensitive-data leakage.
- **Evidence:** Error wrapping, error responses, logs, and redaction tests.
- **Verification:** Exercise representative failures and inspect both operator diagnostics and externally visible error data.

### GO-009 — Owned goroutine lifecycles

- **Applicability:** Go code that starts goroutines.
- **Strength:** Required.
- **Rule:** Goroutines MUST have a clear owner and shutdown path.
- **Evidence:** Goroutine creation sites, cancellation channels or contexts, wait groups, and shutdown code.
- **Verification:** Trace startup, cancellation, error, and shutdown paths for every long-lived goroutine.

### GO-010 — Safe shared state

- **Applicability:** Go code using shared mutable state.
- **Strength:** Required.
- **Rule:** Shared mutable state MUST be synchronized or eliminated.
- **Evidence:** Mutexes, atomics, ownership rules, immutable data, and race-test results.
- **Verification:** Run the race detector where supported and inspect ownership of shared state.

### GO-011 — Validated startup configuration

- **Applicability:** Go services with runtime configuration.
- **Strength:** Required.
- **Rule:** Configuration MUST be validated at startup.
- **Evidence:** Configuration types, parsing, validation, and startup failure behavior.
- **Verification:** Start with missing and invalid configuration and confirm clear failure before serving traffic.

### GO-012 — Graceful shutdown

- **Applicability:** Long-running Go services.
- **Strength:** Recommended.
- **Rule:** Long-running services SHOULD implement graceful shutdown.
- **Evidence:** Signal handling, server shutdown, worker cancellation, and shutdown tests.
- **Verification:** Send termination signals and confirm in-flight work and resources are handled within a bounded period.

### GO-013 — CI test command

- **Applicability:** Go projects with automated tests.
- **Strength:** Required.
- **Rule:** `go test ./...` or the project’s documented equivalent MUST be runnable in CI.
- **Evidence:** CI configuration, project documentation, and test output.
- **Verification:** Run the documented command in the supported CI environment or confirm a recent successful CI execution.

## Review questions

- Are package boundaries and dependency direction clear?
- Does every goroutine have bounded lifetime and cancellation behavior?
- Are timeouts, retries, and resource limits explicit at external boundaries?
- Are concurrency, failure, and shutdown behaviors tested?

## Boundaries and exceptions

Go is a preferred option when its operational characteristics matter. It is not a requirement for TypeScript services or for systems where another established technology is a justified fit.
