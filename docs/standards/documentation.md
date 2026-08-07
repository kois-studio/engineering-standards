# Documentation Standard

**Scope:** repositories that adopt the shared documentation standard, especially repositories using AI coding agents.

**Classification:** Required unless an explicit project exception is recorded.

## Rules

- Projects using AI agents MUST provide `/docs/AGENTS.md` with project-specific instructions and source-of-truth boundaries.
- Projects SHOULD provide `/docs/README.md` as a navigable index for current documentation.
- Each topic MUST have one clear source of truth. Other documents SHOULD link to it rather than duplicate it.
- Links in maintained documentation MUST remain valid.
- Current-state documentation MUST be updated when documented behavior or architecture changes.
- Temporary tasks, resolved defects, status updates, and scratch investigations MUST NOT become permanent documentation unless they contain durable reasoning or a lasting decision.
- Project-specific architecture, domain, integrations, and implementation facts MUST remain in the project repository.
- Exceptions to an adopted standard MUST be visible in the project’s standards contract or project documentation.

## Review questions

- Does this document describe a current rule, a current project fact, a durable decision, or temporary work?
- Is another document already the source of truth for this topic?
- Are the scope and strength of each rule clear?
- Do indexes and links still point to the right documents?
