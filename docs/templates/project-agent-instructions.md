# Agent Instructions

This file is the canonical project-specific instruction entry point for AI developer agents.

## Read first

1. Read this file.
2. Read the project documentation index at `docs/README.md`.
3. Read the project standards contract at `docs/project-standards.yml`.
4. Read the current architecture and workflow documents relevant to the requested change.

## Project source of truth

- Current architecture and implementation facts: [replace with paths]
- Domain and business rules: [replace with paths]
- API and data contracts: [replace with paths]
- Operational procedures: [replace with paths]
- Durable project decisions: [replace with ADR index]
- Known gaps and deferred standards work: [replace with standards contract and any work items]
- Unfinished project work: [replace with `docs/work/TODO.md`]

## Working rules

- Do not invent behavior, architecture, or requirements that are not supported by the project or user instructions.
- Keep changes within the requested scope and preserve existing project conventions unless there is a documented reason to change them.
- Validate changes with the commands listed in the project documentation.
- Update current-state documentation when implementation behavior or architecture changes.
- Create or update an ADR for durable architectural or policy decisions.
- Do not treat deferred standards work as completed.
- Keep unfinished work in `docs/work/TODO.md`; record discoveries that are not addressed now instead of leaving them only in the session transcript.
- In a focused session, do not broaden the ticket without recording a separate work item. In an advance session, use the project work queue and implementation workflow to choose the next bounded slice.

## Verification commands

- Install: [replace with command]
- Format: [replace with command]
- Lint: [replace with command]
- Type-check: [replace with command or Not applicable]
- Tests: [replace with command]
- Build: [replace with command]
- Other important checks: [replace with commands]

## Safe change boundaries

[Describe actions that require explicit approval, production access boundaries, migration precautions, and rollback expectations.]
