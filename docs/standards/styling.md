# Styling Standard

**Scope:** web projects.

**Classification:** Recommended default.

Tailwind CSS and Lucide are optional defaults, not requirements. A project MUST NOT be considered non-compliant merely because it uses another coherent styling or icon system.

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

### STYLE-007 — Documented design reference

- **Applicability:** Web projects with multiple views or shared UI components.
- **Strength:** Recommended.
- **Rule:** A project SHOULD document its visual direction and its conventions for color, typography, spacing, and shared interaction states, so new UI can follow them without inferring them from existing code.
- **Evidence:** Design system or equivalent documentation, design tokens, and shared components.
- **Verification:** Confirm a new view could be built from the documented decisions and that representative views follow them.

### STYLE-008 — Rendered UI review

- **Applicability:** Changes that affect user-visible web UI.
- **Strength:** Recommended.
- **Rule:** UI changes SHOULD be inspected in a rendered browser at supported viewports before being considered complete, covering applicable empty, loading, error, hover, focus, and disabled states, and compared with the project’s design reference.
- **Evidence:** Screenshots, visual baselines, browser-check notes, or review records.
- **Verification:** Confirm a recent UI change has rendered evidence rather than only passing tests or source review.

### STYLE-009 — Interface craft baseline

- **Applicability:** Web projects with user-facing UI.
- **Strength:** Recommended.
- **Rule:** UI SHOULD keep body text to a readable line length (about 45–75 characters), use spacing that reflects grouping, use drawn icons rather than emoji or Unicode glyphs, name controls by their action, make error messages state the problem and the recovery, and reserve modals for tasks that need interruption or protected focus.
- **Evidence:** Rendered views, shared components, and interface copy.
- **Verification:** Inspect representative views and flows, including an error path.

### STYLE-010 — Deliberate visual patterns

- **Applicability:** Web projects with user-facing UI.
- **Strength:** Recommended.
- **Rule:** Common default patterns SHOULD appear only when the content or design reference justifies them: gradient text, decorative glass or blur, nested cards, same-size icon-heading-text grids as the page structure, and big-number hero metrics.
- **Evidence:** Design reference and representative views.
- **Verification:** For each pattern found, confirm it has a reason beyond being the default.

## Review questions

- Is the styling approach coherent across the project?
- Does custom CSS solve a real limitation or duplicate existing utilities?
- Are icons consistent in visual language, accessibility, and implementation?
- Can a new view follow a documented design reference rather than copying existing code?
- Was the latest UI change inspected in a rendered browser, including its non-default states?
- Do common default patterns appear because they were chosen?
