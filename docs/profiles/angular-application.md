# Angular Application Profile

**Use when:** the project is a complex web application with significant client-side state, navigation, forms, workflows, or authenticated user interactions.

**Scope:** Angular applications that adopt this profile.

## Rules

### ANGULAR-001 — Feature-oriented organization

- **Applicability:** Angular applications with multiple business capabilities.
- **Strength:** Recommended.
- **Rule:** The application SHOULD be organized by business feature and bounded responsibility rather than by framework artifact alone.
- **Evidence:** Source tree, feature modules, routes, and dependency boundaries.
- **Verification:** Confirm a feature’s UI, state, use cases, and data access can be located without traversing unrelated framework-wide folders.

### ANGULAR-002 — Component responsibility

- **Applicability:** Angular components.
- **Strength:** Recommended.
- **Rule:** Components SHOULD remain focused on presentation and orchestration; domain and data-access logic SHOULD be isolated.
- **Evidence:** Component files, services, domain modules, and tests.
- **Verification:** Review representative components for business rules or persistence logic that could be tested independently.

### ANGULAR-003 — Typed Angular APIs

- **Applicability:** Angular applications.
- **Strength:** Recommended.
- **Rule:** Applications SHOULD use Angular’s typed APIs and strict compiler settings.
- **Evidence:** Angular and TypeScript configuration, forms, HTTP clients, and templates.
- **Verification:** Run the effective type-check and inspect representative API, form, and template boundaries.

### ANGULAR-004 — Explicit workflow state

- **Applicability:** Complex Angular forms and multi-step workflows.
- **Strength:** Recommended.
- **Rule:** Applications SHOULD prefer reactive forms and explicit state transitions for complex workflows.
- **Evidence:** Form configuration, state models, transition logic, and workflow tests.
- **Verification:** Trace loading, validation, submission, cancellation, and failure states through the workflow.

### ANGULAR-005 — Styling and icon defaults

- **Applicability:** New Angular applications without an established styling or icon system.
- **Strength:** Optional.
- **Rule:** Tailwind CSS SHOULD be considered as the primary styling system where appropriate and Lucide SHOULD be considered for general-purpose icons.
- **Evidence:** Technology choices and project design documentation.
- **Verification:** Confirm the chosen systems are coherent and intentionally selected; do not treat another coherent choice as a defect solely because it differs from these defaults.

### ANGULAR-006 — Boundary validation

- **Applicability:** Angular applications consuming API responses or user input.
- **Strength:** Required.
- **Rule:** API responses and user input MUST be validated at application boundaries.
- **Evidence:** API adapters, form validators, schemas, and error handling.
- **Verification:** Trace representative external responses and user-controlled values into state and domain logic.

### ANGULAR-007 — State ownership and lifecycle

- **Applicability:** Shared Angular services and state.
- **Strength:** Required.
- **Rule:** Shared services and state MUST have an explicit ownership and lifecycle model.
- **Evidence:** Provider scopes, state stores, service definitions, and documentation.
- **Verification:** Identify who owns each shared state, how long it lives, and how it is reset or disposed.

### ANGULAR-008 — Independently testable business rules

- **Applicability:** Angular applications containing non-trivial business behavior.
- **Strength:** Recommended.
- **Rule:** Components SHOULD avoid embedding complex business rules that can be tested independently.
- **Evidence:** Component logic, domain/application services, and unit tests.
- **Verification:** Check whether core rules can be tested without rendering a component or starting a browser.

### ANGULAR-009 — Focused authorization and failure tests

- **Applicability:** Angular routes, guards, interceptors, and effects.
- **Strength:** Recommended.
- **Rule:** Routes, guards, interceptors, and effects SHOULD have focused tests for authorization and failure behavior.
- **Evidence:** Focused test files and authorization/failure cases.
- **Verification:** Run the tests and confirm denied, expired, unavailable, and malformed-input paths are represented.

### ANGULAR-010 — Managed reactive lifecycles

- **Applicability:** Angular observables, subscriptions, and signals with effects.
- **Strength:** Required.
- **Rule:** Observable or signal lifecycles MUST be managed so subscriptions and effects do not leak.
- **Evidence:** Subscription ownership, teardown mechanisms, signal effects, and lifecycle tests.
- **Verification:** Inspect long-lived components/services and test destruction, navigation, and repeated initialization behavior.

### ANGULAR-011 — Critical journey coverage

- **Applicability:** Angular applications with critical authenticated or multi-step user journeys.
- **Strength:** Recommended.
- **Rule:** Critical user journeys SHOULD have end-to-end coverage.
- **Evidence:** Journey definitions and end-to-end tests.
- **Verification:** Run the tests in a controlled environment and confirm they cover the user-visible contract.

## Review questions

- Are features and state boundaries understandable?
- Can business rules be tested without rendering a component?
- Are loading, empty, success, and failure states explicit?
- Are authorization boundaries enforced in both the UI and backend contract?

## Boundaries and exceptions

Angular is not a requirement for static or content-focused websites. A project may use another application framework when its team, dependencies, or operating environment make that choice more appropriate.
