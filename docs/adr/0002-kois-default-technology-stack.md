# ADR 0002: Kois default technology stack

- **Status:** Accepted
- **Date:** 2026-09-06
- **Supersedes:** None
- **Superseded by:** None

## Context

Kois projects vary from public portfolio websites to interactive applications and self-hosted systems. Without a default selection policy, each project can spend unnecessary design effort choosing a framework, and related projects can accumulate avoidable technology fragmentation.

The defaults must remain proportional to the project shape. A content-focused website does not need the same application architecture as a system with authentication, persistence, uploads, processing, and domain workflows. The policy must also preserve a legitimate escape hatch when another runtime provides a concrete benefit.

## Decision

Kois adopts the following recommended technology defaults:

- Astro for simple, content-focused, mostly static websites.
- Angular for interactive browser applications with meaningful client-side state, navigation, forms, or workflows.
- Angular + NestJS for full-stack TypeScript applications that own backend domain logic, persistence, authentication, files, jobs, or HTTP contracts.
- Go as an evidence-based alternative when its deployment, runtime, concurrency, resource, or team-capability characteristics provide a concrete advantage.

These are recommended defaults, not universal mandates. Projects may choose another coherent stack when they document the reason, trade-offs, applicable profiles, and verification evidence. Node.js LTS is the runtime default for the TypeScript path; it is not an alternative to NestJS. A project must select a concrete supported Node.js major version before implementation.

The detailed selection guidance is maintained in [`docs/profiles/kois-default-stack.md`](../profiles/kois-default-stack.md). Framework-specific guidance remains in the Astro, Angular, NestJS, and Go profiles.

## Consequences

Kois gains a predictable default vocabulary:

- Astro remains the proportionate choice for websites such as a portfolio or marketing site.
- Angular and NestJS become the default starting point for application projects such as Gallery.
- Developers can use existing Angular and NestJS expertise across projects.
- Future headless consumers and API integrations have a clear backend boundary when they are justified.
- The default can introduce more structure than a small full-stack prototype needs, so the first project slice must still remain narrow.
- Go remains available for real operational or runtime reasons rather than hypothetical performance claims.
- Projects choosing another stack must carry the documentation and verification cost of explaining that choice.

This decision does not require every Angular and NestJS project to use separate production deployments. A single Docker installation may package the Angular build and NestJS server when that is the simplest operator experience.

## Alternatives considered

- **No shared default:** rejected because repeated framework selection increases fragmentation and design overhead.
- **Angular for every project:** rejected because content-focused websites benefit from a smaller static/content-oriented architecture.
- **SvelteKit as the general full-stack TypeScript default:** not selected because Kois currently has stronger established Angular/NestJS expertise and profiles, while a single-framework default would need a new shared profile and project-specific evidence.
- **Go as the general backend default:** rejected because smaller operational footprint alone does not outweigh the team’s existing TypeScript/NestJS capability for ordinary Kois applications.
- **Mandatory framework choices with no exceptions:** rejected because project requirements, deployment constraints, and measured workload may justify another technology.
