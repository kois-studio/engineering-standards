# TypeScript Standard

**Scope:** TypeScript projects.

**Classification:** Recommended default; projects may document a justified alternative.

## Rules

- Projects MUST enable strict TypeScript checking unless a documented, bounded exception exists.
- Developers SHOULD avoid `any`. Untyped boundaries SHOULD use `unknown` followed by validation or narrowing.
- Public functions, module interfaces, API contracts, and domain boundaries SHOULD use explicit, meaningful types.
- Domain states SHOULD use discriminated unions or other precise types when that makes invalid states harder to represent.
- Data received from APIs, users, environment variables, files, and third-party services MUST be validated at the boundary; TypeScript types alone do not validate runtime data.
- Zod is the preferred runtime validation library for TypeScript projects when it fits the project’s needs. Equivalent schema-validation solutions MAY be used when required by the framework or environment.
- Compiler, formatter, and linter configuration MUST be committed to the repository.
- Biome is the preferred formatter and linter for TypeScript and JavaScript projects. A project using another coherent system SHOULD avoid adding a competing formatter or linter.

## Review questions

- Are strict checks enabled and passing?
- Are `any` uses intentional, narrow, and documented?
- Are external values validated before use?
- Are public contracts and domain states easy to understand?
- Is formatting and linting automated consistently in local development and CI?
