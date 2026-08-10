# TypeScript Standard

**Scope:** TypeScript projects.

**Classification:** Recommended default; projects may document a justified alternative.

## Rules

### TS-001 — Strict compiler checking

- **Applicability:** TypeScript projects.
- **Strength:** Required.
- **Rule:** Projects MUST enable strict TypeScript checking unless a documented, bounded exception exists.
- **Evidence:** `tsconfig` files, compiler output, and any exception record.
- **Verification:** Inspect the effective TypeScript configuration and run the project’s type-check command.

### TS-002 — Avoid unsafe `any`

- **Applicability:** TypeScript source code.
- **Strength:** Recommended.
- **Rule:** Developers SHOULD avoid `any`. Untyped boundaries SHOULD use `unknown` followed by validation or narrowing.
- **Evidence:** Explicit `any` usages and boundary types.
- **Verification:** Run lint or type tooling where available and review remaining `any` uses for narrow scope and rationale.

### TS-003 — Explicit public contracts

- **Applicability:** Public functions, module interfaces, API contracts, and domain boundaries in TypeScript projects.
- **Strength:** Recommended.
- **Rule:** Public functions, module interfaces, API contracts, and domain boundaries SHOULD use explicit, meaningful types.
- **Evidence:** Exported declarations, DTOs, schemas, and domain interfaces.
- **Verification:** Review representative public boundaries for inferred or ambiguous contracts.

### TS-004 — Precise domain states

- **Applicability:** TypeScript domains with multiple meaningful states or transitions.
- **Strength:** Recommended.
- **Rule:** Domain states SHOULD use discriminated unions or other precise types when that makes invalid states harder to represent.
- **Evidence:** State types, transition logic, and exhaustive handling.
- **Verification:** Inspect whether valid states and transitions are explicit and whether impossible combinations are rejected by the type system.

### TS-005 — Runtime boundary validation

- **Applicability:** Data received from APIs, users, environment variables, files, and third-party services in TypeScript projects.
- **Strength:** Required.
- **Rule:** Data received from external or runtime-controlled boundaries MUST be validated before use; TypeScript types alone do not validate runtime data.
- **Evidence:** Schemas, parsers, guards, validation pipes, and boundary tests.
- **Verification:** Trace representative inputs from each external boundary into application logic and confirm invalid data is rejected or handled safely.

### TS-006 — Runtime validation solution

- **Applicability:** TypeScript projects that need runtime schema validation.
- **Strength:** Optional.
- **Rule:** Zod is the preferred runtime validation library when it fits the project’s needs. Equivalent schema-validation solutions MAY be used when required by the framework or environment.
- **Evidence:** Dependency configuration and validation implementation.
- **Verification:** Confirm the chosen solution is coherent, maintained, and used consistently at applicable boundaries.

### TS-007 — Committed tool configuration

- **Applicability:** TypeScript and JavaScript projects using compiler, formatter, or linter tooling.
- **Strength:** Required.
- **Rule:** Compiler, formatter, and linter configuration MUST be committed to the repository.
- **Evidence:** Tracked configuration files and package scripts.
- **Verification:** Confirm a clean checkout can discover and run the configured tools without relying on untracked local settings.

### TS-008 — Coherent formatting and linting

- **Applicability:** TypeScript and JavaScript projects using formatting or linting.
- **Strength:** Recommended.
- **Rule:** Biome is the preferred formatter and linter for TypeScript and JavaScript projects. A project using another coherent system SHOULD avoid adding a competing formatter or linter.
- **Evidence:** Tool configuration, dependencies, and CI scripts.
- **Verification:** Confirm formatting and linting have one clear source of truth and are applied consistently in local development and CI.

## Review questions

- Are strict checks enabled and passing?
- Are `any` uses intentional, narrow, and documented?
- Are external values validated before use?
- Are public contracts and domain states easy to understand?
- Is formatting and linting automated consistently in local development and CI?
