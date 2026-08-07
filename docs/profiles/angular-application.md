# Angular Application Profile

**Use when:** the project is a complex web application with significant client-side state, navigation, forms, workflows, or authenticated user interactions.

## Preferred defaults

- Organize by business feature and bounded responsibility rather than by framework artifact alone.
- Keep components focused on presentation and orchestration; isolate domain and data-access logic.
- Use Angular’s typed APIs and strict compiler settings.
- Prefer reactive forms and explicit state transitions for complex workflows.
- Use Tailwind CSS as the primary styling system where appropriate and Lucide for general-purpose icons.
- Validate API responses and user input at boundaries.

## Rules

- Shared services and state MUST have an explicit ownership and lifecycle model.
- Components SHOULD avoid embedding complex business rules that can be tested independently.
- Routes, guards, interceptors, and effects SHOULD have focused tests for authorization and failure behavior.
- Observable or signal lifecycles MUST be managed so subscriptions and effects do not leak.
- Critical user journeys SHOULD have end-to-end coverage.

## Review questions

- Are features and state boundaries understandable?
- Can business rules be tested without rendering a component?
- Are loading, empty, success, and failure states explicit?
- Are authorization boundaries enforced in both the UI and backend contract?

## Boundaries and exceptions

Angular is not a requirement for static or content-focused websites. A project may use another application framework when its team, dependencies, or operating environment make that choice more appropriate.
