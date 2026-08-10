# Shared Standards

Shared standards define cross-project expectations. They apply only within the scope stated by each document.

## Strength of guidance

- **Required:** projects in scope MUST follow the rule unless an explicit exception is recorded.
- **Recommended:** projects SHOULD follow the rule by default and document meaningful deviations.
- **Optional:** projects MAY adopt the guidance when it fits their context.

The terms **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** are used with their ordinary normative meaning. Profiles can add more specific guidance for a technology, but they must remain consistent with these shared standards.

Strength is part of the shared rule. It is different from a project’s audit status. For example, a Required rule can have the project status `Deferred`, while an Optional rule can be `Compliant`.

## Auditable rule format

Every shared-standard and profile rule MUST have a stable identifier. Use a readable namespace and sequential number, such as `DOC-001`, `TEST-001`, `TS-001`, `STYLE-001`, `ASTRO-001`, `ANGULAR-001`, `NEST-001`, or `GO-001`. An identifier MUST NOT be silently reused after a rule is removed.

Each rule should state:

- **Applicability** — which projects or situations the rule covers;
- **Strength** — Required, Recommended, or Optional;
- **Rule** — the normative expectation;
- **Evidence** — what an auditor should inspect; and
- **Verification** — how the expectation can be checked through documents, configuration, commands, tests, or review.

The project’s compliance status is recorded separately using the states defined in [`../agent-modes.md`](../agent-modes.md). An audit MUST cite the rule ID and evidence rather than reporting only a general impression.

Standards should be enforceable where practical through repository configuration, CI, tests, or lightweight future validation tooling.

## Standards index

- [Documentation](documentation.md)
- [Testing](testing.md)
- [TypeScript](typescript.md)
- [Styling](styling.md)
