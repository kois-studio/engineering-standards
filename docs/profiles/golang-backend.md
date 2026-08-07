# Go Backend Profile

**Use when:** operational simplicity, performance, concurrency, static binaries, or deployment characteristics make Go a good fit.

## Preferred defaults

- Organize packages around responsibilities and stable dependency direction.
- Keep transport handlers thin and application behavior explicit.
- Prefer the standard library when it provides a clear, maintainable solution.
- Validate external input at boundaries and return typed, actionable errors.
- Use context propagation for cancellation, deadlines, and request-scoped work.
- Use table-driven unit tests and integration tests for meaningful infrastructure boundaries.

## Rules

- Package APIs SHOULD be small and intentional; avoid unnecessary exported identifiers.
- Errors MUST retain enough context for diagnosis while avoiding secret or sensitive-data leakage.
- Goroutines MUST have a clear owner and shutdown path.
- Shared mutable state MUST be synchronized or eliminated.
- Configuration MUST be validated at startup, and graceful shutdown SHOULD be implemented for long-running services.
- `go test ./...` or the project’s documented equivalent MUST be runnable in CI.

## Review questions

- Are package boundaries and dependency direction clear?
- Does every goroutine have bounded lifetime and cancellation behavior?
- Are timeouts, retries, and resource limits explicit at external boundaries?
- Are concurrency, failure, and shutdown behaviors tested?

## Boundaries and exceptions

Go is a preferred option when its operational characteristics matter. It is not a requirement for TypeScript services or for systems where another established technology is a justified fit.
