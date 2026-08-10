# Security Standard

**Scope:** all software projects that adopt the shared standards. Individual rules apply according to the project’s data, users, interfaces, and deployment exposure.

**Classification:** Required baseline, with applicability recorded per rule.

Security controls MUST be proportionate to the project’s risk. A rule that does not apply MUST be marked `Not applicable` with a reason; it MUST NOT be silently ignored.

## Rules

### SEC-001 — Security context and trust boundaries

- **Applicability:** All projects.
- **Strength:** Required.
- **Rule:** Projects MUST document security-sensitive assets, trust boundaries, external actors, and the responsibilities of the project versus its hosting platform or external providers.
- **Evidence:** Architecture, threat notes, data-flow documents, deployment documentation, and project standards contract.
- **Verification:** Identify what must be protected, where untrusted input enters, which components cross trust boundaries, and who owns each security responsibility.

### SEC-002 — Secret management

- **Applicability:** All projects with credentials, tokens, keys, certificates, or other sensitive configuration.
- **Strength:** Required.
- **Rule:** Secrets MUST NOT be committed to the repository, exposed in client bundles, or written to logs. Runtime secrets MUST be supplied through an appropriate secret or environment configuration mechanism.
- **Evidence:** Configuration schemas, environment examples, secret-manager configuration, repository history checks, and logs.
- **Verification:** Scan tracked files and history where appropriate, inspect build output for client exposure, and confirm invalid or missing secrets fail safely.

### SEC-003 — Authentication and authorization

- **Applicability:** Projects with user accounts, protected resources, privileged operations, or service-to-service identity.
- **Strength:** Required when applicable.
- **Rule:** Protected capabilities MUST authenticate callers and MUST authorize each sensitive operation according to explicit ownership, role, or policy rules. Client-side checks MUST NOT be the sole enforcement point.
- **Evidence:** Identity configuration, authorization policies, server-side guards or middleware, domain checks, and denied-access tests.
- **Verification:** Exercise allowed, denied, unauthenticated, expired, and cross-tenant or cross-owner scenarios at every relevant entry point.

### SEC-004 — Untrusted input and output safety

- **Applicability:** Projects receiving user, API, file, message, or third-party input, or rendering data into an interpreter or browser.
- **Strength:** Required when applicable.
- **Rule:** Untrusted input MUST be validated at the boundary and MUST be safely encoded, parameterized, or otherwise handled before it reaches a database, command, template, browser, or other interpreter.
- **Evidence:** Schemas, parsers, parameterized queries, output encoding, sanitization, content-security controls, and negative tests.
- **Verification:** Trace representative untrusted values through the system and test malformed, oversized, unexpected, and injection-oriented inputs.

### SEC-005 — Sensitive data protection

- **Applicability:** Projects processing personal, financial, confidential, credential, or otherwise sensitive data.
- **Strength:** Required when applicable.
- **Rule:** Sensitive data MUST be minimized, access-controlled, protected in transit, and protected at rest where the risk and platform support require it. Retention and deletion behavior MUST be documented where applicable.
- **Evidence:** Data classification, storage configuration, transport configuration, access policies, retention rules, and deletion workflows.
- **Verification:** Trace sensitive data through storage, transport, logs, backups, and integrations; confirm unnecessary collection and retention are avoided.

### SEC-006 — Safe logging and error exposure

- **Applicability:** Projects with runtime logs, APIs, background jobs, or user-visible errors.
- **Strength:** Required when applicable.
- **Rule:** Logs and errors MUST provide useful diagnostic context without exposing secrets, credentials, sensitive data, internal stack details, or attack-enabling information to unauthorized consumers.
- **Evidence:** Logger configuration, redaction rules, error contracts, exception handling, and representative logs.
- **Verification:** Exercise representative failures and inspect operator logs and externally visible responses separately.

### SEC-007 — Least privilege

- **Applicability:** Projects using users, service accounts, cloud resources, databases, queues, caches, or third-party integrations.
- **Strength:** Required when applicable.
- **Rule:** Identities and integrations MUST receive only the permissions required for their responsibilities, and privileged access MUST have an identified owner and review path.
- **Evidence:** IAM policies, database roles, service-account configuration, integration scopes, and ownership documentation.
- **Verification:** Compare granted permissions with actual operations and identify unused, shared, or unowned privileged access.

### SEC-008 — Security behavior testing

- **Applicability:** Projects with authentication, authorization, sensitive data, public interfaces, or security-sensitive workflows.
- **Strength:** Required when applicable.
- **Rule:** Security-sensitive behavior MUST have automated or repeatable tests covering rejection, isolation, and failure behavior appropriate to its risk.
- **Evidence:** Authentication and authorization tests, input rejection tests, isolation tests, security checks, and CI results.
- **Verification:** Confirm tests cover both permitted and denied paths and run them through the project’s supported validation workflow.

### SEC-009 — Vulnerability response

- **Applicability:** Deployed or maintained projects with dependencies, infrastructure, or external exposure.
- **Strength:** Recommended.
- **Rule:** Projects SHOULD have a documented process for receiving, assessing, prioritizing, and remediating security vulnerabilities.
- **Evidence:** Dependency tooling, issue process, ownership, response targets, and recent remediation history.
- **Verification:** Identify who receives vulnerability signals, how severity is assessed, and how remediation status becomes visible.

## Review questions

- What assets, actors, and trust boundaries matter to this project?
- Where are authentication and authorization enforced, and are they enforced beyond the UI?
- Could untrusted data reach an interpreter, browser, database, command, or log unsafely?
- Are secrets and sensitive data absent from source, bundles, logs, and unnecessary retention?
- Are security failures tested and observable without exposing dangerous details?

## Boundaries and exceptions

Security requirements are applicability-scoped rather than technology-specific. A static site may have no authentication or database rules, but it still needs appropriate secret hygiene, safe content handling, dependency hygiene, and deployment protections. A project exception MUST identify the affected rule, rationale, owner, scope, and compensating control where one exists.
