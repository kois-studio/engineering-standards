# ADR: Tracked project work queue and implementation sessions

- **Status:** Accepted
- **Date:** 2026-09-06
- **Supersedes:** None
- **Superseded by:** None

## Context

AI-assisted projects need to preserve unfinished discoveries, partial work, blockers, and next actions across sessions. A single conversation is not a reliable project memory, and separate `TODO`, `PROPOSED`, and `STATUS` files can fragment the work state.

The standards system already defines Tech Lead bootstrap and design sessions, but it does not define a reusable implementation-session workflow or a canonical place for unfinished work.

## Decision

AI-ready projects will use a tracked work system under `docs/work/`, with `docs/work/TODO.md` as the default queue. Work items will carry explicit states such as `Proposed`, `Ready`, `Active`, `Blocked`, and `Deferred`, along with scope, acceptance criteria, verification, risks, dependencies, and next action.

The standards system will define a `project-implementation` session mode with two intents:

- `focused` — implement a specified ticket or goal and stop after verification;
- `advance` — perform a bounded review, select safe work, implement it, verify it, and update the queue.

Durable architecture and policy decisions remain ADRs. Current implementation facts remain in project documentation. A work queue is not a replacement for either.

## Consequences

Benefits:

- a fresh agent can continue work without the previous conversation;
- discoveries and partial work remain visible;
- focused sessions do not accidentally become broad planning sessions;
- advance sessions can be autonomous while retaining scope boundaries;
- work, decisions, and current-state documentation have distinct homes.

Costs and risks:

- agents and humans must keep the queue current;
- projects need a migration path if they already use another tracker;
- a Markdown queue is not a substitute for team-scale issue management;
- high-impact decisions still require explicit human or project-owner review.

## Alternatives considered

- Keep all work in a single `docs/TODO.md`: rejected because it does not distinguish standards remediation from general unfinished product work and does not define a session contract.
- Use separate `TODO.md`, `PROPOSED.md`, and `STATUS.md` files: rejected as the default because it fragments continuity; projects may still maintain specialized documents when their boundaries are clear.
- Require an external issue tracker: rejected as a universal requirement because small and self-hosted projects need a repository-local, reviewable baseline.
- Build a multi-agent orchestration service: rejected for now; the standards repository should define portable files and workflows, while agent platforms provide execution and parallelism.
