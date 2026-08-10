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

### TS-009 — Checked indexed access

- **Applicability:** TypeScript projects using arrays, records, maps, or index signatures.
- **Strength:** Required for new projects; Recommended for existing projects until adopted through tracked remediation work.
- **Rule:** Projects SHOULD enable `noUncheckedIndexedAccess` and `noPropertyAccessFromIndexSignature` to make potentially missing indexed values explicit. New projects MUST enable both options.
- **Evidence:** Effective `tsconfig` files, indexed access code, and migration or exception records.
- **Verification:** Inspect the effective compiler configuration and confirm indexed reads account for missing values rather than assuming every key exists.

### TS-010 — Teamwide compiler quality checks

- **Applicability:** TypeScript projects with shared source code and automated type-checking.
- **Strength:** Required for new projects; Recommended for existing projects until adopted through tracked remediation work.
- **Rule:** New projects MUST enable `noImplicitOverride`, `noImplicitReturns`, `noUnusedLocals`, `noUnusedParameters`, and `noFallthroughCasesInSwitch`. Existing projects SHOULD enable them and MUST record deferred migration work when they cannot do so immediately.
- **Evidence:** Effective `tsconfig` files, compiler output, and deferred-work records.
- **Verification:** Run the type-check command and confirm the configured checks are enforced in local development or CI.

### TS-011 — Exact optional-property semantics

- **Applicability:** TypeScript projects where the distinction between an omitted property and an explicit `undefined` value matters.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD consider enabling `exactOptionalPropertyTypes` when its stricter optional-property semantics improve domain or API correctness.
- **Evidence:** API and domain contracts, effective `tsconfig`, and compatibility decisions.
- **Verification:** Confirm optional properties have an intentional meaning and that the project’s choice is documented where the distinction affects behavior.

## Compiler configuration guidance

The following baseline is recommended for new TypeScript projects:

```jsonc
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "noPropertyAccessFromIndexSignature": true,
    "noImplicitOverride": true,
    "noImplicitReturns": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true
  }
}
```

This is a safety baseline, not a complete universal `tsconfig`. `target`, `module`, `moduleResolution`, `lib`, `isolatedModules`, `esModuleInterop`, decorators, declaration output, source maps, and build directories MUST be selected according to the project’s runtime, framework, packaging, and build tool. Angular-specific compiler settings belong in the Angular profile; NestJS decorator settings belong in the NestJS profile when required.

## Review questions

- Are strict checks enabled and passing?
- Are `any` uses intentional, narrow, and documented?
- Are external values validated before use?
- Are public contracts and domain states easy to understand?
- Is formatting and linting automated consistently in local development and CI?
