# NestJS Backend Profile

**Use when:** a TypeScript backend benefits from modular architecture, dependency injection, and HTTP or event-driven APIs.

## Preferred defaults

- Organize modules around business capabilities and explicit boundaries.
- Keep controllers and message handlers thin; place use-case orchestration in application services.
- Keep domain rules independent from transport and infrastructure where practical.
- Use DTOs and runtime validation at HTTP, event, configuration, and persistence boundaries.
- Use consistent error mapping, structured logging, and request correlation appropriate to the deployment.
- Use unit tests for domain and application logic, integration tests for adapters, and end-to-end tests for important API contracts.

## Rules

- Each module MUST have a clear responsibility and public interface.
- Cross-module dependencies SHOULD be explicit and SHOULD NOT rely on internal implementation details.
- Controllers MUST NOT be treated as the sole enforcement point for authorization or domain invariants.
- External input MUST be validated before entering application logic.
- Errors exposed through APIs or events MUST use a stable, documented contract without leaking secrets or internal stack details.
- Configuration MUST be validated at startup and secrets MUST NOT be committed.

## Review questions

- Are module boundaries aligned with business responsibilities?
- Are transport, application, domain, and infrastructure concerns appropriately separated?
- Are validation, authorization, error handling, and observability consistent?
- Are database and external-service integrations covered by meaningful tests?

## Boundaries and exceptions

NestJS is a preferred TypeScript backend profile, not a universal requirement. A smaller service may reasonably use a lighter framework when the resulting boundaries and operational behavior remain clear.
