# Example Project Archetypes

These examples show how the shared catalog can be selected for the three target project shapes. They are illustrative; a Tech Lead MUST confirm applicability from the actual project.

## Astro portfolio website

Typical selections:

- Standards: documentation, testing, styling, security, dependencies, CI/CD, operations, web.
- Profile: [Astro website](../profiles/astro-website.md).
- Common `Not applicable` rules: authentication, API contracts, database migrations, service health probes, and runtime shutdown when the site is fully static.
- Important checks: content and link integrity, generated output, Lighthouse audits, metadata, responsive behavior, and accidental client-side data exposure.

## Angular application

Typical selections:

- Standards: documentation, testing, TypeScript, styling, security, dependencies, CI/CD, operations, API, web.
- Profile: [Angular application](../profiles/angular-application.md).
- Account-based applications SHOULD also select the [Clerk identity profile](../profiles/clerk-identity.md) when Clerk is used.
- Important checks: strict compiler settings, state ownership, authentication flows, server-side authorization, loading/error states, contract alignment, critical end-to-end journeys, and rendered-page audits.

## NestJS or Go API

Typical selections:

- Standards: documentation, testing, security, dependencies, CI/CD, operations, API, data.
- Profile: [NestJS backend](../profiles/nestjs-backend.md) or [Go backend](../profiles/golang-backend.md).
- Account-based SaaS APIs SHOULD also select the [Clerk identity profile](../profiles/clerk-identity.md) when Clerk is used.
- Important checks: module/package boundaries, input validation, stable errors, authz, database migrations, query limits and indexes, Redis cache correctness, idempotency, timeouts, health/readiness, graceful shutdown, and contract tests.
