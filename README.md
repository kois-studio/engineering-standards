# Engineering Standards

Engineering Standards is a versioned, shared reference and bootstrap system for engineering practices, documentation, technology profiles, architecture decisions, and AI-agent workflows. Its primary purpose is to help a Tech Lead agent prepare a project so that future developer agents can work from the project’s own documentation without repeatedly rediscovering its architecture or consulting this repository.

This repository is currently a **v0.3 working baseline**. It has an auditable rule catalog, Tech Lead workflows, project handoff templates, cross-project standards, and identity/account guidance, but it should continue to be validated against real projects.

## Why this exists

Projects often develop their own agent instructions, documentation habits, testing strategies, technology choices, and conventions. A shared standards system reduces avoidable fragmentation while allowing each project to retain its own architecture and justified exceptions.

The intended workflow has two layers of agents:

1. **Developer agents** work inside a project repository. They use that project's local documentation and standards contract, along with the selected profiles from this repository.
2. **Tech-lead agents** bootstrap or design projects, audit them against selected standards and profiles, and produce a self-contained project documentation package with evidence-based findings and prioritized follow-up work.

This repository supports three explicit session modes:

1. **Project bootstrap** — analyze an existing project and prepare it for AI development.
2. **Project design** — define and document a not-yet-started or early-stage project.
3. **Standards maintenance** — improve this repository and its shared standards system.

Sessions MUST declare their mode. See [`docs/agent-modes.md`](docs/agent-modes.md).

## Starting a session

Copy the prompt for the kind of session you want, then replace the values in brackets. These prompts assume the agent starts in this repository and has permission to inspect or update the target project when one is specified.

### 1. Prepare an existing project for AI development

Use this when the project already has code but its architecture, conventions, commands, and documentation are not ready for developer agents.

```text
MODE: EXISTING PROJECT TECH LEAD

You are the Tech Lead responsible for preparing this existing project for future AI developer agents.

Engineering standards repository: [absolute path to engineering-standards]
Target project: [absolute path to the existing project]

Read the engineering-standards repository, especially docs/AGENTS.md, docs/agent-modes.md, and docs/workflows/project-bootstrap.md. Then inspect the target project deeply, including its instructions, documentation, source structure, dependencies, configuration, CI, tests, integrations, and deployment setup.

Document the project progressively and accurately. Create or improve the target project’s docs/ package so a future developer agent can work from that documentation without re-checking the engineering-standards repository. Select the applicable standards and profiles, assess them using the defined compliance states, and record evidence, risks, priorities, exceptions, unknowns, and deferred work.

Do not invent facts. Do not perform broad behavior-changing refactors during this initial analysis unless I explicitly ask for them. You may make narrowly scoped documentation and AI-readiness changes. Ask me only about decisions that are genuinely critical; record other unknowns and continue.

Before finishing, verify the documentation index, project standards contract, commands, links, and prioritized TODOs. Summarize what was documented, what remains unresolved, and the recommended next sessions.
```

### 2. Design a project that has not started yet

Use this when the project is still an idea, requirements document, or empty repository.

```text
MODE: GREENFIELD PROJECT TECH LEAD

You are the Tech Lead responsible for defining and documenting this project before implementation begins.

Engineering standards repository: [absolute path to engineering-standards]
Target project or design workspace: [absolute path]
Project name: [name]
Initial idea or requirements: [short description or path to requirements]

Read the engineering-standards repository, especially docs/AGENTS.md, docs/agent-modes.md, and docs/workflows/project-design.md. Interview me about critical product, architecture, security, data, integration, operational, and delivery decisions. Use the grill-with-docs workflow when it is available in your environment.

Create a reviewable project design and the initial docs/ package for future implementation agents. Select applicable standards and profiles, propose the architecture and technology choices with rationale, define boundaries and important workflows, and record durable decisions as ADRs. Clearly distinguish proposed design, decisions, open questions, assumptions, and implementation tasks. Do not claim that code, infrastructure, tests, or integrations exist before they do.

Do not finalize high-impact choices while critical information is missing. Keep unresolved questions visible and actionable. Before finishing, verify that the first implementation slice, standards contract, architecture, security boundaries, and handoff instructions are clear.
```

### 3. Improve this engineering standards repository

Use this when the work is about the shared standards system itself, not an external project.

```text
MODE: ENGINEERING STANDARDS MAINTENANCE

You are maintaining and improving this engineering-standards repository. You are not acting as the Tech Lead of an external project in this session.

Read AGENTS.md, docs/AGENTS.md, docs/agent-modes.md, and docs/workflows/standards-maintenance.md before changing anything.

Current objective: [describe the standard, workflow, profile, template, validation tool, or documentation improvement]

Inspect existing documents first. Classify each proposed change correctly as a principle, shared standard, technology profile, ADR policy, template, workflow, or temporary work. Keep shared policy separate from project-specific facts, use precise normative language, preserve accepted decisions, update indexes and links, and add an ADR when the change materially alters an established standard or policy.

Implement the objective, validate the repository, and summarize the files changed, behavior affected, compatibility or migration implications, and any follow-up work. Do not modify an external project unless I explicitly change the session scope.
```

Projects should pin a standards version and select only the profiles that apply to them. They should reference this repository rather than copying its entire contents.

## Shared standards and project context

This repository is the source of truth for general principles, cross-project standards, technology profiles, documentation rules, ADR rules, reusable templates, and eventually validation or migration tooling.

An individual project remains the source of truth for its current architecture, implementation details, domain model, integrations, project-specific ADRs, and accepted exceptions. Shared documents must not invent or duplicate those details.

## Repository map

- [`AGENTS.md`](AGENTS.md) - agent entry point; redirects to the canonical instructions.
- [`CLAUDE.md`](CLAUDE.md) - Claude agent entry point; redirects to the canonical instructions.
- [`docs/README.md`](docs/README.md) - documentation index.
- [`docs/principles/`](docs/principles/README.md) - broad engineering principles.
- [`docs/standards/`](docs/standards/README.md) - cross-project standards.
- [`docs/profiles/`](docs/profiles/README.md) - technology and architecture profiles.
- [`docs/adr/`](docs/adr/README.md) - policy for architecture decision records.
- [`docs/templates/`](docs/templates/README.md) - reusable ADR and project contract templates.
- [`docs/workflows/`](docs/workflows/README.md) - mode-specific Tech Lead and maintenance workflows.
- [`scripts/validate-standards.rb`](scripts/validate-standards.rb) - lightweight standards metadata, link, and template validator.
- [`docs/versioning.md`](docs/versioning.md) - standards versioning and consumer migration policy.

## Documentation lifecycle

Current standards describe rules that should be followed now. Current project facts belong in the project repository. Durable architectural decisions belong in ADRs. Temporary work belongs in issues, pull requests, task plans, or deliberately temporary investigation notes.

When an established decision changes, preserve the original ADR and create a new ADR that references it. Do not rewrite history merely to make the documentation appear cleaner.

## Using this repository

A project can begin with a contract such as [`docs/templates/project-standards.yml`](docs/templates/project-standards.yml), selecting a standards version, relevant standards and profiles, compliance states, deferred work, and explicit exceptions. The project-bootstrap and project-design workflows explain how to produce the surrounding local documentation package.

Before proposing a new rule, read [`docs/AGENTS.md`](docs/AGENTS.md) and classify the information. Keep standards focused, enforceable where practical, and clear about whether they are Required, Recommended, or Optional.
