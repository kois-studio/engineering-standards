# Testing Standard

**Scope:** software projects that adopt the shared testing standard.

**Classification:** Recommended, with stronger requirements for critical behavior and production systems.

## Rules

- Projects SHOULD use layered tests: unit tests for isolated logic, integration tests for meaningful component boundaries, and end-to-end tests for critical user journeys and system contracts.
- Bug fixes SHOULD include a regression test where practical.
- Tests MUST be deterministic and isolated from ordering, wall-clock timing, network availability, and shared mutable state unless the test explicitly exercises that boundary.
- Assertions SHOULD verify behavior, outcomes, and contracts rather than implementation details.
- Critical paths, security-sensitive behavior, data migrations, and public interfaces SHOULD have coverage appropriate to their risk.
- The test command MUST be documented and runnable in CI for projects with automated tests.
- External services SHOULD be replaced with stable test doubles in unit and integration tests; end-to-end tests MAY use controlled service environments.

## Review questions

- Is the test placed at the narrowest useful layer?
- Does it fail for the user-visible or contract-level regression?
- Can it run repeatedly and independently in CI?
- Are slow or environment-dependent tests clearly identified?
