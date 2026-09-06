# Agent Session Modes

This repository supports four different kinds of AI sessions. The mode determines the agent’s role, the repository it may change, the questions it should ask, and the artifacts it must produce.

## Declare a mode

The preferred declaration is a small structured block at the beginning of the request:

```yaml
session_mode: project-bootstrap
target_project: /absolute/path/to/project
```

The supported values are:

| Mode | Natural-language alias | Primary subject |
| --- | --- | --- |
| `project-bootstrap` | Existing project Tech Lead | An existing project that needs to become AI-ready |
| `project-design` | Greenfield project Tech Lead | A project that is not yet started or is still being defined |
| `project-implementation` | Developer agent | An implementation session inside a prepared project |
| `standards-maintenance` | Engineering standards maintenance | This repository and its shared standards |

These aliases are convenient, but the structured `session_mode` value is canonical. A request may also use one of these explicit lines:

```text
MODE: EXISTING PROJECT TECH LEAD
MODE: GREENFIELD PROJECT TECH LEAD
MODE: PROJECT IMPLEMENTATION
MODE: ENGINEERING STANDARDS MAINTENANCE
```

If the mode is missing or ambiguous, the agent MUST ask which mode applies before making changes. The target project MUST be explicit for the two Tech Lead modes. A path outside this repository MUST be treated as a separate project and inspected under its own instructions.

Copy-paste prompt templates for all four modes are maintained in the root [`README.md`](../README.md). Users should start with the matching template and replace its bracketed values.

## Shared operating rules

All modes MUST:

- read the applicable instructions before changing files;
- preserve the distinction between observed facts, user decisions, agent recommendations, assumptions, and unknowns;
- use the repository’s existing source of truth when one exists;
- avoid inventing project architecture, behavior, dependencies, or compliance evidence;
- keep durable decisions separate from temporary tasks;
- leave indexes and links valid after documentation changes; and
- summarize changes, unresolved questions, and verification performed.

The Tech Lead modes MUST treat the target project as the source of truth for its current implementation. This repository provides the standards and process, not facts about the target project.

## Compliance states

When assessing a standard or profile rule, use one of these states:

- **Compliant** — evidence shows the rule is satisfied.
- **Partial** — the rule is partly satisfied or inconsistently applied.
- **Gap** — the rule is applicable and currently unsatisfied.
- **Deferred** — the gap is known and intentionally scheduled for later work.
- **Exception** — the project has consciously chosen an alternative and recorded why.
- **Not applicable** — the rule does not apply to this project, with a short reason.
- **Unknown** — there is not enough evidence yet; do not treat this as compliant.

`Deferred` and `Exception` require an explanation. A Tech Lead MUST NOT silently convert an unresolved gap into either state.

## Mode boundaries

### `project-bootstrap`

Use [`workflows/project-bootstrap.md`](workflows/project-bootstrap.md). The goal is to turn an existing project into a reliable local operating manual for future AI developer sessions. The agent should document the current system, select effective standards, and record prioritized remediation work. It MAY make documentation and clearly scoped readiness changes, but MUST NOT perform broad behavior-changing refactors as part of an initial analysis unless the user explicitly requests them.

### `project-design`

Use [`workflows/project-design.md`](workflows/project-design.md). The goal is to turn an idea or incomplete project into an explicit, reviewable design. The agent should interview the user about critical constraints, use a documentation-driven grilling workflow when available, and label proposed architecture as design rather than implementation fact.

### `project-implementation`

Use [`workflows/project-implementation.md`](workflows/project-implementation.md). The target project MUST already have a usable local documentation package or the session MUST first establish the missing minimum context. The session intent MUST be explicit:

- **focused** — implement the specified ticket or goal and stop after its acceptance criteria are verified;
- **advance** — inspect the project work queue, perform a bounded product/technical/UX checkpoint, implement approved work, verify it, and record the next work items.

Implementation agents MUST treat `docs/work/TODO.md` as the default source of unfinished work. New discoveries that are not addressed in the current session MUST become work items there with an appropriate state, rather than disappearing into the conversation. Agents MUST NOT silently turn high-impact product, architecture, security, data, or deployment decisions into implementation facts. They must record them as blocked questions, proposed work, or ADRs according to the project’s rules.

### `standards-maintenance`

Use [`workflows/standards-maintenance.md`](workflows/standards-maintenance.md). The goal is to improve this repository’s standards system. The agent should not silently switch into auditing an external project, and it MUST follow the documentation classification, indexing, and ADR rules in this file.
