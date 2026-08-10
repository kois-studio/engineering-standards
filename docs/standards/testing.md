# Testing Standard

**Scope:** software projects that adopt the shared testing standard.

**Classification:** Recommended overall, with Required rules for deterministic automated tests, CI execution, and an automated quality baseline when the project is applicable.

## Rules

### TEST-001 — Layered tests

- **Applicability:** Software projects with automated tests.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD use layered tests: unit tests for isolated logic, integration tests for meaningful component boundaries, and end-to-end tests for critical user journeys and system contracts.
- **Evidence:** Test directories, test configuration, and representative test cases.
- **Verification:** Identify which layers cover important logic, boundaries, and user journeys; record justified omissions.

### TEST-002 — Regression coverage

- **Applicability:** Projects fixing a reproducible defect.
- **Strength:** Required for security, data-integrity, public-interface, and critical-journey defects; Recommended otherwise.
- **Rule:** Bug fixes in security-sensitive behavior, data integrity, public interfaces, or critical user journeys MUST include a regression test when the defect is reproducible. Other bug fixes SHOULD include a regression test where practical.
- **Evidence:** The bug-fix change and a test reproducing the prior failure.
- **Verification:** Confirm the regression test fails against the old behavior or directly exercises the affected contract. For an omitted test, verify that the change is outside the Required risk categories and that the reason is recorded when the omission is meaningful.

### TEST-003 — Deterministic isolated tests

- **Applicability:** All automated tests.
- **Strength:** Required.
- **Rule:** Tests MUST be deterministic and isolated from ordering, wall-clock timing, network availability, and shared mutable state unless the test explicitly exercises that boundary.
- **Evidence:** Test setup, fixtures, clocks, network controls, and repeated-run behavior.
- **Verification:** Run tests repeatedly or in a different order and inspect boundary controls for network, time, and shared state.

### TEST-004 — Behavior-focused assertions

- **Applicability:** Unit, integration, and end-to-end tests.
- **Strength:** Recommended.
- **Rule:** Assertions SHOULD verify behavior, outcomes, and contracts rather than implementation details.
- **Evidence:** Assertions and mocks in representative tests.
- **Verification:** Check whether tests would remain valid after an internal refactor that preserves behavior.

### TEST-005 — Risk-appropriate coverage

- **Applicability:** Production systems and behavior with material business, security, data, or user impact.
- **Strength:** Recommended.
- **Rule:** Critical paths, security-sensitive behavior, data migrations, and public interfaces SHOULD have coverage appropriate to their risk.
- **Evidence:** Risk assessment, test matrix, migration tests, contract tests, and critical journey tests.
- **Verification:** Compare test coverage and test depth with identified failure impact, not only a global percentage.

### TEST-006 — CI test command

- **Applicability:** Projects with automated tests.
- **Strength:** Required.
- **Rule:** The test command MUST be documented and runnable in CI.
- **Evidence:** Project documentation, package scripts, CI configuration, and CI results.
- **Verification:** Run the documented command in the supported CI environment or confirm a recent successful CI execution.

### TEST-007 — Stable external-service boundaries

- **Applicability:** Unit, integration, and end-to-end tests that interact with external services.
- **Strength:** Recommended.
- **Rule:** Unit tests MUST use stable test doubles rather than uncontrolled external services. Integration tests SHOULD use controlled real dependencies when the integration behavior itself is in scope, and MAY use doubles when the external boundary is not the subject of the test. End-to-end tests MAY use controlled service environments.
- **Evidence:** Mocks, fakes, stubs, containers, ephemeral databases, service virtualization, and end-to-end environment configuration.
- **Verification:** Confirm unit tests do not depend on uncontrolled network services, integration tests verify the intended level of real interaction, and end-to-end dependencies are deliberate and controlled.

### TEST-008 — Automated quality baseline

- **Applicability:** Production software projects and non-trivial software projects. Prototypes, trivial repositories, and static content-only projects MAY be excluded when the project contract records the reason.
- **Strength:** Required when applicable.
- **Rule:** Applicable projects MUST have at least one meaningful automated test or validation suite covering behavior, a public contract, a build, or content integrity, and that suite MUST be runnable in CI.
- **Evidence:** Test or validation files, project scripts, CI configuration, and the project contract when the rule is not applicable.
- **Verification:** Identify the baseline suite, run its documented command, and confirm CI executes it or explicitly records why CI cannot run it yet.

## Review questions

- Is the test placed at the narrowest useful layer?
- Does it fail for the user-visible or contract-level regression?
- Can it run repeatedly and independently in CI?
- Are slow or environment-dependent tests clearly identified?
