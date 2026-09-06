# Greenfield Project Design Workflow

**Mode:** `project-design`

**Goal:** turn an idea or incomplete project into an explicit, reviewable architecture and delivery contract before implementation begins.

## 1. Establish the decision context

The Tech Lead MUST identify what is known about:

- product purpose, users, and critical journeys;
- functional and non-functional requirements;
- security, privacy, and compliance constraints;
- expected scale, availability, latency, and failure tolerance;
- data ownership, retention, migration, and integration needs;
- team skills, operational capacity, hosting, and budget; and
- delivery constraints and expected evolution.

When critical information is missing, ask focused questions. Use the grill-with-docs workflow when it is available in the current environment. Do not make an irreversible technology or architecture choice merely because the user has not yet answered an important question.

## 2. Define the proposed system

Select applicable standards and profiles, then document the proposed:

- system boundaries and responsibilities;
- technology choices and their rationale;
- module or service boundaries and dependency direction;
- data model ownership and external contracts;
- authentication, authorization, and trust boundaries;
- deployment, configuration, observability, and recovery approach;
- testing and quality strategy; and
- first implementation slices and sequencing.

Every proposed choice MUST be labeled as proposed design, not current implementation fact.

## 3. Record durable decisions

Create ADRs for choices with meaningful architectural, operational, security, or policy consequences. Each ADR should include context, decision, consequences, alternatives, and unresolved risks. Open questions that do not yet have a decision belong in a tracked design-question document or backlog, not in an accepted ADR.

## 4. Produce the initial project package

The expected project artifacts are:

- `docs/AGENTS.md` — instructions for implementation agents working from the design;
- `docs/README.md` — documentation index;
- `docs/project-standards.yml` — selected standards, profiles, and deliberate exceptions;
- `docs/architecture/` — proposed system and boundary documents;
- `docs/decisions/` — ADR index and accepted or proposed decisions;
- `docs/questions.md` — unresolved decisions requiring user or team input; and
- `docs/work/TODO.md` — implementation preparation and follow-up work.

The package MUST distinguish proposed decisions, open questions, and implementation tasks. It MUST NOT claim that code, infrastructure, tests, or integrations exist before they do.

## 5. Validate readiness for implementation

Before handing off to developer agents, check that:

- the first implementation slice is clear;
- selected technologies have a documented rationale;
- security and data boundaries are explicit;
- unresolved questions have owners or next actions;
- the standards contract matches the proposed architecture; and
- the local `docs/AGENTS.md` explains how implementation agents should keep the design documentation current.
