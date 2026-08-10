# Astro Website Profile

**Use when:** the project is primarily a static, content-focused, or performance-oriented website and does not require a large client-side application runtime.

**Scope:** Astro websites and comparable content-focused sites that adopt this profile.

## Rules

### ASTRO-001 — Primary Astro rendering model

- **Applicability:** Projects adopting the Astro website profile.
- **Strength:** Recommended.
- **Rule:** The project SHOULD use Astro’s build and content capabilities as the primary rendering model.
- **Evidence:** Astro configuration, page structure, and rendering setup.
- **Verification:** Confirm Astro is used for the primary page-rendering responsibility and that another runtime has not become the de facto application framework without documentation.

### ASTRO-002 — Deliberate rendering strategy

- **Applicability:** Astro pages and routes.
- **Strength:** Recommended.
- **Rule:** The project SHOULD prefer static generation or server rendering according to content freshness, personalization, and hosting needs.
- **Evidence:** Route configuration, deployment configuration, and content requirements.
- **Verification:** Compare the rendering choice with freshness, personalization, and hosting constraints.

### ASTRO-003 — Minimal client-side JavaScript

- **Applicability:** Astro websites.
- **Strength:** Recommended.
- **Rule:** Client-side JavaScript SHOULD be kept at the smallest useful boundary; interactive behavior SHOULD use islands where appropriate.
- **Evidence:** Client directives, island components, bundles, and page scripts.
- **Verification:** Inspect interactive pages and confirm browser JavaScript has a documented user-facing purpose.

### ASTRO-004 — Styling and icon defaults

- **Applicability:** New Astro websites without an established styling or icon system.
- **Strength:** Optional.
- **Rule:** Tailwind CSS SHOULD be considered as the primary styling system and Lucide SHOULD be considered for general-purpose icons where suitable.
- **Evidence:** Technology choices and project design documentation.
- **Verification:** Confirm the chosen systems are coherent and intentionally selected; do not treat another coherent choice as a defect solely because it differs from these defaults.

### ASTRO-005 — Ingestion boundary validation

- **Applicability:** Content collections and external data consumed by Astro websites.
- **Strength:** Required.
- **Rule:** Content and external data MUST be validated at ingestion boundaries.
- **Evidence:** Content schemas, parsers, fetch validation, and build-time error handling.
- **Verification:** Trace representative content and external data into pages and confirm invalid data fails safely or is handled explicitly.

### ASTRO-006 — Accessible content presentation

- **Applicability:** Public Astro websites.
- **Strength:** Recommended.
- **Rule:** Pages SHOULD use semantic HTML, accessible navigation, meaningful document metadata, and optimized images.
- **Evidence:** Page templates, metadata components, navigation, image configuration, and accessibility tests.
- **Verification:** Review representative pages and run available accessibility and image/performance checks.

### ASTRO-007 — Justified interactive islands

- **Applicability:** Interactive Astro islands.
- **Strength:** Required.
- **Rule:** Interactive islands MUST have a clear reason to run in the browser.
- **Evidence:** Island components, client directives, and documented interaction requirements.
- **Verification:** For each island boundary, identify the interaction that requires client execution and remove or reconsider unnecessary hydration.

### ASTRO-008 — Content schemas

- **Applicability:** Astro projects using content collections or equivalent structured content.
- **Strength:** Recommended.
- **Rule:** Content collections or equivalent content schemas SHOULD validate required fields and frontmatter.
- **Evidence:** Content collection definitions, schemas, and content fixtures.
- **Verification:** Run the content validation command or build and confirm invalid required fields are rejected.

### ASTRO-009 — Deterministic URLs and builds

- **Applicability:** Astro websites with generated pages.
- **Strength:** Recommended.
- **Rule:** Pages SHOULD have deterministic builds and stable URLs unless a deliberate routing strategy says otherwise.
- **Evidence:** Routing configuration, generated output, redirects, and deployment rules.
- **Verification:** Build repeatedly and inspect URL generation, redirects, and dynamic route behavior.

### ASTRO-010 — Browser behavior coverage

- **Applicability:** Browser-dependent behavior on Astro websites.
- **Strength:** Recommended.
- **Rule:** Browser-dependent behavior SHOULD be covered by focused end-to-end tests for critical journeys.
- **Evidence:** End-to-end tests and critical journey documentation.
- **Verification:** Run the focused tests in a controlled browser environment and confirm they cover the important interaction contract.

## Review questions

- Is client-side JavaScript limited to necessary interactions?
- Are content, images, metadata, and links validated?
- Is the rendering strategy appropriate for freshness and deployment constraints?
- Are accessibility and responsive behavior tested for important pages?

## Boundaries and exceptions

Astro is not a requirement for complex client-side applications with substantial state and workflows. An existing website may use another framework when its architecture and operational constraints justify it.
