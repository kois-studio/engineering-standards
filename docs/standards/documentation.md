# Documentation Standard

**Scope:** repositories that adopt the shared documentation standard, especially repositories using AI coding agents.

**Classification:** Required unless an explicit project exception is recorded.

## Rules

### DOC-001 — AI agent instructions

- **Applicability:** Projects using AI coding agents.
- **Strength:** Required.
- **Rule:** Projects using AI agents MUST provide `/docs/AGENTS.md` with project-specific instructions and source-of-truth boundaries.
- **Evidence:** A tracked `docs/AGENTS.md` file containing project-specific instructions.
- **Verification:** Inspect the file and confirm it identifies the documentation entry point, source-of-truth boundaries, and safe change expectations.

### DOC-002 — Documentation index

- **Applicability:** Projects with maintained project documentation.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD provide `/docs/README.md` as a navigable index for current documentation.
- **Evidence:** A `docs/README.md` file linking to maintained project documents.
- **Verification:** Follow the index links and confirm important maintained documents are reachable.

### DOC-003 — Single source of truth

- **Applicability:** All project documentation.
- **Strength:** Required.
- **Rule:** Each topic MUST have one clear source of truth. Other documents SHOULD link to it rather than duplicate it.
- **Evidence:** Topic ownership and links between related documents.
- **Verification:** Search for duplicated guidance and confirm conflicting copies are consolidated or explicitly scoped.

### DOC-004 — Valid maintained links

- **Applicability:** Maintained project documentation.
- **Strength:** Required.
- **Rule:** Links in maintained documentation MUST remain valid.
- **Evidence:** Link targets and repository structure.
- **Verification:** Run an available link checker or resolve local links during review.

### DOC-005 — Current-state accuracy

- **Applicability:** Documentation describing implemented project behavior or architecture.
- **Strength:** Required.
- **Rule:** Current-state documentation MUST be updated when documented behavior or architecture changes.
- **Evidence:** Relevant change history and current implementation.
- **Verification:** Compare documentation with the changed code, configuration, and tests during review.

### DOC-006 — Durable documentation boundaries

- **Applicability:** All project documentation.
- **Strength:** Required.
- **Rule:** Temporary tasks, resolved defects, status updates, and scratch investigations MUST NOT become permanent documentation unless they contain durable reasoning or a lasting decision.
- **Evidence:** Document classification, issue links, and ADRs.
- **Verification:** Confirm temporary work has an appropriate temporary home or has been converted into durable reasoning or a decision.

### DOC-007 — Project-fact ownership

- **Applicability:** Shared standards repositories and project documentation systems.
- **Strength:** Required.
- **Rule:** Project-specific architecture, domain, integrations, and implementation facts MUST remain in the project repository.
- **Evidence:** Location of project facts and references from shared standards.
- **Verification:** Confirm shared documents describe policy and profiles rather than claiming facts about an individual project.

### DOC-008 — Visible exceptions

- **Applicability:** Projects adopting any shared standard or profile.
- **Strength:** Required.
- **Rule:** Exceptions to an adopted standard MUST be visible in the project’s standards contract or project documentation.
- **Evidence:** A linked exception with rationale and affected rule IDs.
- **Verification:** For each non-compliant Required or Recommended rule, check for either remediation work or a documented exception.

## Review questions

- Does this document describe a current rule, a current project fact, a durable decision, or temporary work?
- Is another document already the source of truth for this topic?
- Are the scope and strength of each rule clear?
- Do indexes and links still point to the right documents?
