# Existing Project Bootstrap Workflow

**Mode:** `project-bootstrap`

**Goal:** turn an existing, AI-unprepared project into a project with a trustworthy local documentation and standards contract that future developer agents can use without re-reading this repository.

## 1. Establish scope and instructions

The Tech Lead MUST:

1. Confirm the target project path and intended scope.
2. Read the target project’s agent instructions, README files, documentation indexes, contribution guidance, and local standards contracts before editing.
3. Inspect the repository structure, package manifests, build configuration, CI, tests, environment examples, deployment configuration, and recent history as appropriate.
4. Record what was inspected and any important areas that could not be verified.

Do not assume the project’s framework or architecture from its directory name. Confirm it from repository evidence.

## 2. Build an evidence-based project model

Document the current system progressively. At minimum, cover the applicable items below:

- purpose, users, and major capabilities;
- runtime and deployment shape;
- entry points and important workflows;
- module, feature, or package boundaries;
- data stores, external services, queues, caches, and integrations;
- authentication and authorization boundaries;
- configuration, secrets, and environment requirements;
- test layers and reliable commands;
- build, lint, format, type-check, and deployment commands;
- operational risks, constraints, and known failure modes; and
- important architectural decisions and project-specific conventions.

Facts MUST be supported by repository evidence or an explicit user statement. Mark assumptions and unknowns rather than filling gaps with plausible details.

## 3. Select and assess standards

Select the shared standards and profiles that apply based on the project’s actual technologies and responsibilities. Assess each applicable rule using the compliance states in [`agent-modes.md`](../agent-modes.md).

For every non-compliant state, record:

- the rule or stable rule reference;
- the evidence and affected area;
- risk or consequence;
- recommended remediation;
- priority;
- dependencies or prerequisites; and
- whether the work is immediate, deferred, or an explicit exception.

Do not force all standards to be satisfied during the analysis session. A precise deferred gap is better than a rushed, unverified migration.

## 4. Produce the project documentation package

Create or improve the following artifacts in the target project when they are applicable:

- `docs/AGENTS.md` — local instructions, safe change boundaries, source-of-truth map, and verification expectations;
- `docs/README.md` — navigable documentation index and onboarding path;
- `docs/project-standards.yml` — pinned standards version, selected standards and profiles, compliance summary, exceptions, and deferred work;
- architecture documentation — current system overview and relevant boundary or flow documents;
- operations documentation — setup, commands, environments, deployment, and troubleshooting;
- project ADR index and ADRs for durable project decisions; and
- `docs/work/TODO.md` or an equivalent tracked work queue for standards gaps and follow-up work.

Do not create documents for areas that do not apply. Do not copy the whole standards repository. The project documentation should contain the effective rules and concise rationale needed by future agents, with a pinned reference to the canonical standards version for deeper context.

## 5. Make the project ready for developer agents

The local `docs/AGENTS.md` MUST tell future agents:

- which documentation to read first;
- where current architecture and project facts live;
- which standards and profiles are effective;
- what is known to be incomplete;
- how to validate changes; and
- when to update documentation or create an ADR.

The Tech Lead MAY make narrowly scoped readiness changes such as adding documentation indexes, standard commands, or missing configuration examples. Broad refactors, dependency upgrades, and behavior changes require separate authorization or follow-up work.

## 6. Close the analysis

Before finishing, verify that:

- the documentation index reaches every maintained document;
- commands in the documentation are accurate or explicitly marked unverified;
- the standards contract is internally consistent;
- no unknown has been reported as compliant;
- deferred work is actionable and prioritized; and
- the final summary identifies remaining questions, risks, and recommended next sessions.

The output is successful when a new developer agent can start from the project’s `docs/AGENTS.md` and understand how to work safely without rediscovering the project from scratch.
