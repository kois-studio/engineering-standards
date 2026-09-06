# Documentation Agent Instructions

This repository is a source of shared standards, not a warehouse for every project’s documentation. Keep each document useful after the current task is complete.

## Choose the session mode first

Every session working from this repository MUST identify one operating mode before inspecting or changing files. See [`agent-modes.md`](agent-modes.md) for the complete routing contract.

Supported modes are:

- `project-bootstrap` — analyze and prepare an existing project for AI development.
- `project-design` — define and document a not-yet-started or early-stage project.
- `project-implementation` — implement approved project work in a focused or bounded advancement session.
- `standards-maintenance` — improve this engineering standards repository itself.

The user may declare a mode with either a structured block or an explicit line such as `MODE: EXISTING PROJECT TECH LEAD`. If the mode or target project is ambiguous, ask before making changes. Do not infer that every session in this repository is a standards-maintenance session.

Mode-specific workflows:

- [`workflows/project-bootstrap.md`](workflows/project-bootstrap.md)
- [`workflows/project-design.md`](workflows/project-design.md)
- [`workflows/project-implementation.md`](workflows/project-implementation.md)
- [`workflows/standards-maintenance.md`](workflows/standards-maintenance.md)

The project workflows produce documentation that belongs in the target project. They do not copy this repository wholesale into that project.

## Classify information before writing

Use this decision guide:

- **Shared standard:** a cross-project rule that should be followed now. Put it in `docs/standards/` and state its scope.
- **Technology profile:** guidance for choosing or organizing a technology or architecture. Put it in `docs/profiles/`.
- **Principle:** a broad, durable value that informs several standards. Put it in `docs/principles/`.
- **ADR:** a durable decision with context, alternatives, and consequences. Use `docs/templates/adr.md` and the policy in `docs/adr/README.md`.
- **Project current state:** a fact about one project’s architecture, domain, integrations, or implementation. Put it in that project’s repository.
- **Temporary work:** a task checklist, bug report, status update, or short-lived investigation. Put it in an issue, pull request, task plan, or explicitly temporary note.

Before creating a document, ask: “Will this still be useful after the current task is complete?” If not, it does not belong in permanent shared documentation.

## Standards and profiles

Write normative rules with **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY**. State the scope and classify guidance as Required, Recommended, or Optional where useful. Profiles may add specific guidance, but they must not silently contradict a shared standard.

Do not record a project’s actual modules, deployment architecture, database schema, or domain model here. Do not turn a profile preference into a mandatory migration without an explicit decision and rationale.

## ADRs and preserving decisions

Create an ADR for a durable architectural or policy decision that future contributors need to understand. Do not use ADRs for TODOs, task lists, bug reports, status updates, or notes that an old problem was fixed.

Accepted ADRs are generally immutable. When a decision changes, keep the original, create a new ADR, reference the previous ADR, and mark it superseded where appropriate. Never silently rewrite an accepted decision.

## Avoiding duplication and conflicts

- Search existing documents before adding a new rule or explanation.
- Keep one source of truth per topic; link to it rather than restating it.
- If two documents overlap, consolidate or make their boundaries explicit.
- If guidance conflicts, resolve the conflict in the more authoritative document, record a durable policy change with an ADR when appropriate, and update affected links and indexes.
- Make exceptions visible in the consuming project’s standards contract or project documentation.

## Maintenance checklist

When changing documentation:

- Update the relevant README index.
- Keep relative Markdown links valid.
- Use stable headings and descriptive filenames.
- Check that normative language still matches the intended strength.
- Preserve existing decisions and unrelated changes.
