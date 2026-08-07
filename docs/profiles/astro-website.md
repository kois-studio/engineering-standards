# Astro Website Profile

**Use when:** the project is primarily a static, content-focused, or performance-oriented website and does not require a large client-side application runtime.

## Preferred defaults

- Use Astro’s build and content capabilities as the primary rendering model.
- Prefer static generation or server rendering according to content freshness, personalization, and hosting needs.
- Keep client-side JavaScript at the smallest useful boundary; use islands for interactive behavior.
- Use Tailwind CSS as the primary styling system and Lucide for general-purpose icons where suitable.
- Validate content and external data at ingestion boundaries.
- Use semantic HTML, accessible navigation, meaningful document metadata, and optimized images.

## Rules

- Interactive islands MUST have a clear reason to run in the browser.
- Content collections or equivalent content schemas SHOULD validate required fields and frontmatter.
- Pages SHOULD have deterministic builds and stable URLs unless a deliberate routing strategy says otherwise.
- Browser-dependent behavior SHOULD be covered by focused end-to-end tests for critical journeys.

## Review questions

- Is client-side JavaScript limited to necessary interactions?
- Are content, images, metadata, and links validated?
- Is the rendering strategy appropriate for freshness and deployment constraints?
- Are accessibility and responsive behavior tested for important pages?

## Boundaries and exceptions

Astro is not a requirement for complex client-side applications with substantial state and workflows. An existing website may use another framework when its architecture and operational constraints justify it.
