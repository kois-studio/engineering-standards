# Project Work Queue

Use this template for the default unfinished-work system at `docs/work/TODO.md`.

The queue is a tracked, repository-local work system for developer agents and humans. It can link to GitHub issues or another external tracker, but the project documentation MUST state which system is authoritative when both exist.

Keep unfinished work here, including:

- approved implementation tickets;
- discoveries that should be addressed later;
- work that ended partially complete;
- blockers and unresolved implementation questions;
- standards gaps and review findings that have not been resolved.

Do not use this queue as a replacement for current architecture documentation or durable ADRs. Completed work should leave evidence in commits, pull requests, releases, or ADRs; it does not need to remain in the active queue.

## Work item format

```markdown
### [PROJECT-001] [P1] [feature] Short title

- **Status:** Proposed
- **Origin:** human / implementation / review / user feedback
- **Goal:** [the outcome this work should create]
- **Why now:** [user value, risk, dependency, or milestone]
- **Scope:** [what is included]
- **Non-goals:** [what is explicitly excluded]
- **Acceptance criteria:**
  - [observable criterion]
  - [observable criterion]
- **Verification:** [commands, tests, browser checks, review, or deployment check]
- **Affected areas:** [paths, modules, docs, or external systems]
- **Dependencies:** [other work or decisions]
- **Risks:** [important failure or scope risks]
- **Blocker or question:** [if blocked; otherwise None]
- **Next action:** [smallest useful next step]
- **Owner:** [person or agent role]
- **Last updated:** YYYY-MM-DD
```

## Statuses

- **Proposed** — discovered or suggested, not yet approved for autonomous implementation.
- **Ready** — approved and sufficiently defined for implementation.
- **Active** — currently being implemented by a person or agent.
- **Blocked** — cannot proceed until a named question, dependency, or external action is resolved.
- **Deferred** — intentionally postponed with a reason or milestone.

Projects MAY add statuses, but they SHOULD keep the meaning of these states clear. High-impact product, security, data, architecture, and deployment changes SHOULD remain `Proposed` or `Blocked` until the required human decision is recorded.
