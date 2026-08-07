# Architecture Decision Records

Architecture Decision Records (ADRs) capture durable decisions that are useful to understand later. They explain why a direction was chosen, not what tasks happen to be active.

## Create an ADR when

- a decision has meaningful architectural, operational, security, or policy consequences;
- multiple reasonable alternatives were considered;
- future contributors would benefit from the context and trade-offs; or
- an established shared standard or profile is being materially changed.

Do not use an ADR for temporary TODOs, task checklists, bug reports, status updates, or a note that an old problem was fixed.

## Lifecycle

Accepted ADRs should generally be immutable. If a decision changes:

1. Keep the original ADR.
2. Create a new ADR using [`docs/templates/adr.md`](../templates/adr.md).
3. Reference the previous ADR in `Supersedes`.
4. Mark the previous ADR as `Superseded` and link to the new ADR when appropriate.

Use a stable, sortable filename such as `0001-short-title.md`. Keep an index in the directory where the ADRs live and link related decisions.

## Suggested statuses

- **Proposed** — under discussion and not yet adopted.
- **Accepted** — the current decision.
- **Superseded** — replaced by a later decision.
- **Rejected** — considered and explicitly not chosen.

The ADR body should include context, decision, consequences, and alternatives considered. Project-specific ADRs belong in the project repository; this directory defines the shared policy for writing them.
