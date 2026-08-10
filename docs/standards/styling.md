# Styling Standard

**Scope:** web projects.

**Classification:** Recommended default.

## Rules

### STYLE-001 — Primary styling system

- **Applicability:** Web projects with shared UI or presentation code.
- **Strength:** Recommended.
- **Rule:** A project SHOULD use one primary styling system for its application or site.
- **Evidence:** Styling dependencies, configuration, component styles, and documented conventions.
- **Verification:** Inspect representative features and confirm the primary approach is coherent.

### STYLE-002 — Utility-first styling preference

- **Applicability:** New web projects without an established styling system.
- **Strength:** Optional.
- **Rule:** Tailwind CSS is the preferred default for web projects.
- **Evidence:** Styling dependencies and project design decisions.
- **Verification:** Confirm the selected system is intentionally chosen and consistently configured; do not treat another coherent system as a defect solely because it is not Tailwind.

### STYLE-003 — Specialized custom styling

- **Applicability:** Web projects using a utility-first or component styling system.
- **Strength:** Recommended.
- **Rule:** Manual CSS or SCSS SHOULD be limited to specialized animations, third-party integrations, global primitives, or cases where the primary system is genuinely unsuitable.
- **Evidence:** Custom stylesheet locations and usage.
- **Verification:** Review custom styles for a clear purpose and ensure they do not duplicate established project utilities or primitives.

### STYLE-004 — Avoid competing systems

- **Applicability:** Web projects with more than one styling system.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD avoid introducing multiple competing styling systems without a documented reason.
- **Evidence:** Dependencies, configuration, and project standards documentation.
- **Verification:** Identify each styling system, its ownership boundary, and the rationale for coexistence.

### STYLE-005 — General-purpose icons

- **Applicability:** Web projects requiring a general-purpose SVG icon library.
- **Strength:** Optional.
- **Rule:** Lucide is the preferred general-purpose SVG icon library unless the project has an existing coherent icon system or a specific product requirement.
- **Evidence:** Icon dependencies, design system documentation, and representative usage.
- **Verification:** Confirm icons are consistent in visual language, accessibility, licensing, and implementation.

### STYLE-006 — Local styling exceptions

- **Applicability:** Web projects with deviations from shared styling conventions.
- **Strength:** Recommended.
- **Rule:** Styling exceptions SHOULD be kept local, named clearly, and documented when they affect shared primitives or project-wide conventions.
- **Evidence:** Exception locations, names, and project documentation.
- **Verification:** Confirm an agent can identify why the exception exists and where its effects are allowed to spread.

## Review questions

- Is the styling approach coherent across the project?
- Does custom CSS solve a real limitation or duplicate existing utilities?
- Are icons consistent in visual language, accessibility, and implementation?
