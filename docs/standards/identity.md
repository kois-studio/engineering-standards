# Identity and Accounts Standard

**Scope:** projects with user accounts, authentication, protected resources, organization membership, or service-to-service identity.

**Classification:** Required baseline when applicable.

An identity provider and the application domain have different responsibilities. The identity provider is responsible for authenticating and managing identities; the application is responsible for its domain model, product state, entitlements, resource ownership, and business authorization.

## Rules

### IDN-001 — Explicit identity-provider boundary

- **Applicability:** Projects using an external or platform identity provider.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST document which identity capabilities are owned by the provider and which user, account, membership, entitlement, and business capabilities are owned by the application.
- **Evidence:** Architecture documentation, identity configuration, application models, and project standards contract.
- **Verification:** Identify the source of truth for authentication, profile fields, application user records, organizations, permissions, plans, and preferences.

### IDN-002 — Stable external identity mapping

- **Applicability:** Projects with an external identity provider and application-owned user data.
- **Strength:** Required when applicable.
- **Rule:** The application MUST store the provider’s stable subject identifier in its own user or identity mapping record and MUST enforce uniqueness. Email addresses MUST NOT be used as the immutable identity key.
- **Evidence:** Database schema, unique constraints, identity adapter, and account lookup code.
- **Verification:** Trace sign-in and account lookup flows and confirm identity resolution uses the stable provider subject rather than mutable profile fields.

### IDN-003 — Application-owned product state

- **Applicability:** Applications with user-owned product data, plans, preferences, onboarding, usage, or domain relationships.
- **Strength:** Required when applicable.
- **Rule:** Product state MUST be stored in the application’s authoritative data store or the appropriate billing/domain system. Identity-provider metadata MUST NOT be used as a general-purpose application database.
- **Evidence:** Application schema, billing integration, metadata usage, and domain services.
- **Verification:** Confirm plans, subscriptions, entitlements, onboarding state, preferences, resource ownership, and business relationships are queryable and managed where the application owns them.

### IDN-004 — Backend authorization authority

- **Applicability:** Projects with protected capabilities or resources.
- **Strength:** Required when applicable.
- **Rule:** The backend or authoritative application service MUST enforce resource ownership, tenant boundaries, entitlements, and business authorization. Client-side checks and identity-provider UI state MUST NOT be the sole enforcement point.
- **Evidence:** Authorization policies, service-layer checks, database filters, and denied-access tests.
- **Verification:** Attempt protected operations through direct requests, alternate clients, and manipulated client state.

### IDN-005 — Verified identity claims

- **Applicability:** Applications consuming identity-provider tokens or assertions.
- **Strength:** Required when applicable.
- **Rule:** The application MUST verify identity tokens or assertions using the provider’s supported server-side mechanism before trusting identity or authorization context.
- **Evidence:** Middleware, token verification configuration, key rotation handling, and authentication tests.
- **Verification:** Exercise valid, expired, malformed, wrong-audience, and wrong-issuer credentials and confirm rejection behavior.

### IDN-006 — Explicit identity lifecycle

- **Applicability:** Applications storing local user, account, membership, or identity projections.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST define behavior for identity creation, profile updates, deactivation, deletion, account recovery, and local-data retention or anonymization.
- **Evidence:** Lifecycle handlers, deletion workflows, privacy documentation, webhooks or reconciliation jobs, and tests.
- **Verification:** Trace provider lifecycle events to local records and confirm delayed, repeated, and failed updates have safe behavior.

### IDN-007 — Safe identity synchronization

- **Applicability:** Applications synchronizing identity-provider events into local data.
- **Strength:** Required when applicable.
- **Rule:** Identity synchronization MUST verify event authenticity, be idempotent, tolerate retries and delay, and expose failures for remediation. Critical synchronous flows MUST NOT depend on an asynchronous synchronization event unless the dependency is explicit and handled safely.
- **Evidence:** Webhook verification, event IDs, upserts, retry handling, reconciliation, observability, and failure tests.
- **Verification:** Replay events, deliver them out of order, delay them, and simulate processing failure.

### IDN-008 — Minimal identity data duplication

- **Applicability:** Applications copying provider profile data into local storage.
- **Strength:** Required when applicable.
- **Rule:** Projects SHOULD copy only identity fields needed by application behavior, display, search, analytics, or legal requirements. Each duplicated field MUST have a documented source of truth and update strategy.
- **Evidence:** Local user schema, field mappings, synchronization code, and data classification.
- **Verification:** Review duplicated fields and confirm stale or conflicting profile data cannot silently change authorization or billing decisions.

### IDN-009 — Separate users, accounts, and memberships

- **Applicability:** Multi-tenant or organization-based SaaS applications.
- **Strength:** Required when applicable.
- **Rule:** Individual users, tenant or organization accounts, and memberships MUST be modeled as distinct concepts when users can belong to multiple accounts or when account-level ownership differs from user identity.
- **Evidence:** Data model, membership constraints, authorization policies, and tenant-scoped queries.
- **Verification:** Test one user in multiple accounts, role changes, removal from an account, and cross-account access attempts.

## Review questions

- Who owns authentication, profile identity, product state, entitlements, and authorization?
- Is the external subject ID stored and uniquely indexed locally where needed?
- Could a user change an email, metadata field, or client-side claim and gain access improperly?
- Are identity lifecycle events safe under delay, retry, duplication, and deletion?
- Are user, tenant/account, and membership concepts modeled separately when required?
