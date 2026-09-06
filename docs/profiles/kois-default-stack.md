# Kois Default Technology Stack

**Use when:** selecting the initial technology shape for a new project created or maintained under Kois.

**Classification:** Recommended default. This profile guides selection; it is not a mandatory technology mandate.

## Default selection matrix

| Project shape | Default selection | Why |
| --- | --- | --- |
| Content-focused, public, mostly static website | Astro | Keeps rendering, content, asset, and deployment complexity proportionate to a website. |
| Interactive browser application without a Kois-owned backend | Angular | Provides a consistent application framework for meaningful client state, navigation, forms, and workflows. |
| Full-stack application with Kois-owned domain logic, persistence, authentication, files, jobs, or HTTP contracts | Angular + NestJS | Provides a consistent frontend/backend boundary and established profiles for application and backend concerns. |
| Backend or service where Go provides a concrete operational or runtime advantage | Go | Supports a small deployable surface, explicit concurrency, and single-binary deployment when those benefits matter. |

The matrix is a starting point, not a substitute for understanding the product boundary. Astro is intended for content-focused websites, not complex authenticated applications. Angular and NestJS should not be added to a simple website merely to make the stack appear more sophisticated.

## TypeScript application default

For a new Kois full-stack TypeScript application, the default recommendation is:

```text
Angular frontend → NestJS backend → project-selected persistence and infrastructure adapters
```

The frontend and backend may be packaged in one Docker installation or deployed separately. The default does not require two operational environments. It does require that the UI, transport, application, domain, and infrastructure responsibilities remain understandable and testable.

Node.js is the runtime for this TypeScript default. “Node.js LTS” and “NestJS” are not competing choices: Node.js provides the runtime, while NestJS provides the backend application framework. Projects MUST select and document a concrete supported Node.js major version when implementation begins.

## When Go is preferable

Go MAY replace NestJS when the project has a documented, concrete reason such as:

- single-binary deployment is materially valuable for the target operators;
- measured concurrency, memory, startup, or CPU behavior makes Go a better fit;
- the runtime environment strongly favors Go and its standard tooling; or
- the team’s effective Go capability materially reduces delivery or operational risk.

“Go is theoretically faster” is not sufficient by itself. A Go choice should record the affected requirement, the expected benefit, and how the benefit will be verified.

## Exceptions and alternatives

A project MAY use another coherent technology when the choice is justified by its requirements, deployment model, contributor capability, existing integration, or measured behavior. The project documentation SHOULD record:

1. the selected runtime and application frameworks;
2. which default this differs from;
3. the concrete reason for the difference;
4. the trade-offs and new maintenance responsibilities; and
5. the evidence or review that will validate the choice.

An alternative must not be selected solely to anticipate hypothetical future scale, SDK consumers, MCP integrations, or a hosted SaaS model.

## Profile selection

Projects should select the technology profiles that correspond to the frameworks they actually use:

- Astro website → [Astro Website Profile](astro-website.md);
- Angular frontend → [Angular Application Profile](angular-application.md);
- NestJS backend → [NestJS Backend Profile](nestjs-backend.md); and
- Go backend → [Go Backend Profile](golang-backend.md).

The Kois default stack profile does not replace those profiles. It explains the default selection between them. A project using an alternative such as SvelteKit should not claim Angular or NestJS profile compliance; it should apply the shared technology-neutral standards and document the alternative’s boundaries and verification needs.

## Review questions

- Is the project a website, a browser application, or a full-stack system?
- Does it own backend domain logic, persistence, authentication, files, jobs, or external contracts?
- Is the chosen complexity proportionate to the first useful workflow?
- Would Angular + NestJS remove meaningful risk, or merely add a premature boundary?
- Would Go provide a concrete benefit that can be measured or verified?
- Are the selected profiles and any deviations recorded in the project standards contract?
