# Engineering Standards

Engineering Standards is a versioned, shared reference for engineering practices, documentation, technology profiles, and architecture decision records. It is intended to guide projects, developers, and AI agents without replacing the project repository as the source of truth for project-specific facts.

This repository is currently a **v0.1 foundation**. The structure and initial standards are useful starting points, but they may be refined as they are applied to real projects.

## Why this exists

Projects often develop their own agent instructions, documentation habits, testing strategies, technology choices, and conventions. A shared standards system reduces avoidable fragmentation while allowing each project to retain its own architecture and justified exceptions.

The intended workflow has two layers of agents:

1. **Developer agents** work inside a project repository. They use that project's local documentation and standards contract, along with the selected profiles from this repository.
2. **Tech-lead agents** periodically audit a project against its selected standards and profiles. They produce evidence-based findings and should normally propose changes through a pull request.

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

## Documentation lifecycle

Current standards describe rules that should be followed now. Current project facts belong in the project repository. Durable architectural decisions belong in ADRs. Temporary work belongs in issues, pull requests, task plans, or deliberately temporary investigation notes.

When an established decision changes, preserve the original ADR and create a new ADR that references it. Do not rewrite history merely to make the documentation appear cleaner.

## Using this repository

A project can begin with a small contract such as [`docs/templates/project-standards.yml`](docs/templates/project-standards.yml), selecting a standards version, relevant profiles, and explicit exceptions. The contract format is intentionally small and may evolve.

Before proposing a new rule, read [`docs/AGENTS.md`](docs/AGENTS.md) and classify the information. Keep standards focused, enforceable where practical, and clear about whether they are Required, Recommended, or Optional.
