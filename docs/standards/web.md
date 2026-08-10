# Web Accessibility and Frontend Quality Standard

**Scope:** web projects with public or authenticated frontend interfaces.

**Classification:** Required baseline when applicable.

Automated rendered-page audits complement source review and manual interaction testing. They MUST NOT be treated as proof that every accessibility or user-experience requirement is satisfied.

## Accessibility rules

### A11Y-001 — Semantic structure

- **Applicability:** Web pages and application views.
- **Strength:** Required when applicable.
- **Rule:** Pages MUST use semantic structure, meaningful headings, landmarks, and controls appropriate to their content and interaction.
- **Evidence:** Rendered DOM, templates, components, and accessibility tests.
- **Verification:** Inspect representative rendered views with browser accessibility tools and confirm structure communicates purpose without relying only on visual styling.

### A11Y-002 — Keyboard and focus access

- **Applicability:** Interactive web interfaces.
- **Strength:** Required when applicable.
- **Rule:** All essential interactions MUST be operable by keyboard, with logical focus order, visible focus indication, and no unintended focus traps.
- **Evidence:** Interactive components, focus styles, keyboard tests, and manual critical-flow checks.
- **Verification:** Complete representative flows using only keyboard navigation, including dialogs, menus, forms, and error recovery.

### A11Y-003 — Accessible names and forms

- **Applicability:** Web controls, forms, validation, and interactive components.
- **Strength:** Required when applicable.
- **Rule:** Controls MUST have accessible names, forms MUST have associated labels, and validation or status messages MUST be conveyed to assistive technologies and users who cannot rely on color alone.
- **Evidence:** Rendered accessibility tree, labels, ARIA usage, form tests, and error-state behavior.
- **Verification:** Inspect representative controls and submit invalid forms using keyboard and browser accessibility tools.

### A11Y-004 — Images and non-text content

- **Applicability:** Web pages containing images, icons, audio, video, or other non-text content.
- **Strength:** Required when applicable.
- **Rule:** Meaningful non-text content MUST have an appropriate text alternative or equivalent accessible representation; decorative content MUST be marked as decorative.
- **Evidence:** Image attributes, accessible names, captions, transcripts, and component conventions.
- **Verification:** Review representative content with images disabled or through a screen reader/accessibility tree.

### A11Y-005 — Visual and responsive usability

- **Applicability:** Web interfaces presented across viewport sizes or visual modes.
- **Strength:** Required when applicable.
- **Rule:** Text, controls, focus states, and meaningful status changes MUST remain usable across supported viewport sizes, zoom levels, and color or contrast conditions.
- **Evidence:** Responsive styles, design tokens, focus states, contrast checks, and device/viewport tests.
- **Verification:** Test representative pages at supported mobile and desktop sizes, zoom, and high-contrast or reduced-motion conditions where relevant.

### A11Y-006 — Manual critical-flow review

- **Applicability:** Web projects with important user journeys.
- **Strength:** Required when applicable.
- **Rule:** Critical user journeys MUST receive periodic manual accessibility review in addition to automated checks.
- **Evidence:** Review checklist, test notes, issue records, and critical journey documentation.
- **Verification:** Perform keyboard-only and appropriate assistive-technology checks for the most important journeys and track findings.

## Frontend quality rules

### WEB-001 — Rendered-page quality audit

- **Applicability:** Deployed or externally reachable frontend projects.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST run Lighthouse or an equivalent rendered-page audit against representative routes, covering applicable accessibility, performance, best-practice, and SEO checks.
- **Evidence:** Lighthouse or equivalent reports, audit configuration, representative URLs, and retained results.
- **Verification:** Run the audit against a clean production-like build and confirm the selected routes and categories match the project’s user and deployment risks.

### WEB-002 — Recurring audit cadence

- **Applicability:** Deployed frontend projects.
- **Strength:** Required when applicable.
- **Rule:** Rendered-page audits MUST run before release and after significant frontend, content, dependency, or deployment changes. Deployed projects SHOULD also run scheduled audits periodically.
- **Evidence:** CI or scheduled workflow, release checklist, audit history, and issue tracking.
- **Verification:** Confirm a recent release and significant frontend change each produced an audit result or an explicitly documented exception.

### WEB-003 — Representative route coverage

- **Applicability:** Frontends with multiple pages, authenticated areas, or distinct user journeys.
- **Strength:** Required when applicable.
- **Rule:** Audits MUST include representative public pages and, where supported, authenticated or stateful routes covering the project’s most important user journeys.
- **Evidence:** Route inventory, audit configuration, authentication setup, and journey documentation.
- **Verification:** Compare audited routes with the project’s architecture and critical-flow inventory; do not audit only the landing page when risk is elsewhere.

### WEB-004 — Actionable audit results

- **Applicability:** Projects running rendered-page audits.
- **Strength:** Recommended.
- **Rule:** Audit results SHOULD be retained, compared over time, and converted into prioritized remediation work. Scores SHOULD be treated as indicators, not as the sole definition of accessibility or quality.
- **Evidence:** Historical reports, thresholds, issue links, and remediation backlog.
- **Verification:** Confirm meaningful regressions are visible and actionable without requiring a perfect universal score.

## Review questions

- Can critical flows be completed with keyboard-only interaction?
- Are structure, names, labels, errors, focus, and alternatives accessible in rendered pages?
- Are public and authenticated routes included in quality audits?
- Do release and frontend-change workflows produce recent Lighthouse or equivalent results?
- Are automated findings complemented by manual review?

## References

- [Chrome Lighthouse](https://developer.chrome.com/docs/lighthouse/)
- [Lighthouse accessibility audits](https://developer.chrome.com/docs/lighthouse/accessibility/)
