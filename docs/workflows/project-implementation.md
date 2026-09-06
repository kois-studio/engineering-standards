# Project Implementation Workflow

**Mode:** `project-implementation`

**Goal:** allow a developer agent to make verified progress in a prepared project without depending on an indefinitely growing conversation.

## 1. Declare the session intent

The request MUST identify:

- the target project;
- `focused` or `advance` intent;
- the ticket, goal, or milestone when known;
- any explicit autonomy or safety boundaries.

Use `focused` when the human has a specific task. Use `advance` when the agent should inspect the project’s pending work and continue from the current state.

Example:

```yaml
session_mode: project-implementation
target_project: /absolute/path/to/project
session_intent: advance
```

## 2. Establish the current state

Before editing, the agent MUST read the project’s `docs/AGENTS.md`, `docs/README.md`, standards contract, relevant architecture and workflow documents, and `docs/work/TODO.md` when present. It MUST inspect the working tree, current branch, recent relevant commits, and available validation commands.

The agent MUST identify:

- the active ticket or the next `Ready` work item;
- the current implementation state;
- applicable acceptance criteria;
- the verification it can perform;
- any missing information that could change the implementation materially.

## 3. Focused sessions

For `focused` sessions, the agent SHOULD:

1. restate the goal and acceptance criteria;
2. inspect the relevant code and documentation;
3. implement only the requested scope and necessary supporting changes;
4. run the relevant verification;
5. update current-state documentation and the work item;
6. record newly discovered work in `docs/work/TODO.md`; and
7. stop when the acceptance criteria are met, the task is blocked, or the requested scope is no longer safe to infer.

A focused session MUST NOT turn into a general product-planning loop unless the human explicitly changes the intent.

## 4. Advance sessions

For `advance` sessions, the agent MAY iterate through bounded cycles:

1. **Review:** inspect the product direction, current architecture, UI/UX quality, testing, security, operations, and pending work relevant to the next slice.
2. **Choose:** select one or a small coherent group of `Ready` work items. If no suitable item exists, create `Proposed` items and promote only low-risk, clearly implied work according to the project’s autonomy policy.
3. **Plan:** define the slice, non-goals, affected areas, acceptance criteria, and verification before editing.
4. **Implement:** make the smallest coherent change that advances the selected work.
5. **Verify:** run tests, builds, linting, type checks, browser checks, security checks, or other applicable validation.
6. **Review:** inspect the diff for correctness, regression risk, scope drift, and documentation accuracy.
7. **Record:** update the work item, current-state documentation, decisions, and a checkpoint when the session pauses or crosses a meaningful boundary.
8. **Continue or stop:** continue only when the next action is safe and sufficiently specified.

The review phase may be performed by the same agent for lightweight work, but a fresh-context reviewer SHOULD be used for security-sensitive, cross-boundary, architectural, or milestone changes.

## 5. Scope and decision boundaries

Agents MAY autonomously fix low-risk issues that are clearly implied by the active acceptance criteria. They MUST record adjacent discoveries rather than silently expanding scope.

Agents MUST stop and record a `Blocked` item or request a decision when work would materially change:

- product purpose, target users, or core workflow;
- public API or persisted data contracts;
- authentication, authorization, privacy, or security boundaries;
- deployment model, infrastructure ownership, or data responsibility;
- a durable architecture or dependency choice;
- production data, external accounts, billing, or irreversible operations.

## 6. Verification and completion

An item MUST NOT be marked complete merely because code was written. Completion requires:

- acceptance criteria checked against observable behavior;
- applicable tests and quality commands run;
- failures and unrun checks recorded honestly;
- documentation updated when behavior or architecture changed; and
- no unresolved change hidden in the conversation only.

The agent MUST NOT claim a deployment, integration, user validation, or security property that it did not actually verify.

## 7. Checkpoint and handoff

At the end of a session, after a meaningful milestone, or before context becomes difficult to manage, write or update a project checkpoint using [`../templates/project-checkpoint.md`](../templates/project-checkpoint.md). The checkpoint MUST name the current commit or working-tree state, completed and unfinished work, verification results, risks, blockers, and the next safe action.

The project repository—not the conversation transcript—is the durable memory of the work.
