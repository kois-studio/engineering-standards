# Styling Standard

**Scope:** web projects.

**Classification:** Recommended default.

## Rules

- A project SHOULD use one primary styling system for its application or site.
- Tailwind CSS is the preferred default for web projects.
- Manual CSS or SCSS SHOULD be minimal and limited to specialized animations, third-party integrations, global primitives, or cases where utility classes are genuinely unsuitable.
- Projects SHOULD avoid introducing multiple competing styling systems without a documented reason.
- Lucide is the preferred general-purpose SVG icon library unless the project has an existing coherent icon system or a specific product requirement.
- Styling exceptions SHOULD be kept local, named clearly, and documented when they affect shared primitives or project-wide conventions.

## Review questions

- Is the styling approach coherent across the project?
- Does custom CSS solve a real limitation or duplicate existing utilities?
- Are icons consistent in visual language, accessibility, and implementation?
