# Clerk Identity Profile

**Use when:** a web application needs user accounts, authentication, OAuth, sessions, MFA, email verification, or Clerk Organizations.

**Scope:** projects adopting Clerk as their identity provider.

Clerk is the **Recommended default** identity provider for new account-based web projects in this standards system. Existing projects may use another provider when compatibility, product, compliance, or operational constraints justify it.

## Rules

### CLERK-001 — Clerk as identity boundary

- **Applicability:** Projects adopting this profile.
- **Strength:** Recommended default for new account-based web projects.
- **Rule:** Clerk SHOULD own authentication, passwords, OAuth, sessions, MFA, email verification, and provider-managed identity lifecycle. The application SHOULD own product users, plans, preferences, onboarding, entitlements, and domain relationships.
- **Evidence:** Clerk configuration, application schema, identity architecture, and project standards contract.
- **Verification:** Confirm the boundary is documented and that product state is not hidden inside Clerk configuration or metadata.

### CLERK-002 — Local Clerk subject mapping

- **Applicability:** Clerk applications with application-owned user data.
- **Strength:** Required when applicable.
- **Rule:** The application MUST store the stable Clerk user ID, commonly as `clerkUserId`, in a uniquely constrained local identity or user mapping record. Email MUST NOT be the immutable lookup key.
- **Evidence:** Database schema, unique index, account lookup code, and identity adapter.
- **Verification:** Trace sign-in, account creation, email change, and lookup behavior.

### CLERK-003 — Deliberate local user projection

- **Applicability:** Clerk applications deciding whether to maintain a local user record.
- **Strength:** Required when applicable.
- **Rule:** A local user projection SHOULD be created when the application needs application-owned data, relationships, searchable users, analytics, local authorization, or domain workflows. Projects that only need the current authenticated identity MAY use verified Clerk session data without duplicating the full Clerk user record.
- **Evidence:** User schema, feature requirements, session usage, and synchronization design.
- **Verification:** Confirm the local projection exists for a real application need and does not duplicate provider data without purpose.

### CLERK-004 — Verified idempotent Clerk webhooks

- **Applicability:** Clerk applications using webhooks to synchronize local data.
- **Strength:** Required when applicable.
- **Rule:** Clerk webhook endpoints MUST verify the webhook signature, parse and validate the event, process events idempotently, tolerate retries and eventual consistency, and expose failed processing for remediation. Relevant `user.created`, `user.updated`, and `user.deleted` events SHOULD be handled when a local projection exists.
- **Evidence:** Webhook endpoint, signing-secret configuration, event ID handling, upserts, retries, logs, and tests.
- **Verification:** Replay signed events, reject unsigned or invalid events, deliver duplicates and out-of-order events, and simulate handler failures.

### CLERK-005 — Limited non-authoritative metadata

- **Applicability:** Clerk applications using Clerk public, private, or unsafe metadata.
- **Strength:** Required when applicable.
- **Rule:** Clerk metadata MUST remain small, intentional, and non-authoritative for core product state. Plans, subscriptions, entitlements, onboarding state, and durable application relationships MUST live in the application or billing data store. Sensitive metadata MUST NOT be exposed through unsafe or public metadata.
- **Evidence:** Metadata fields, session-token claims, application schema, billing integration, and authorization code.
- **Verification:** Confirm metadata is not used as an unbounded or query-critical database and that client-writable metadata cannot influence authorization or billing.

### CLERK-006 — Server-side authorization

- **Applicability:** Clerk applications with protected resources or operations.
- **Strength:** Required when applicable.
- **Rule:** Clerk authentication context MAY identify the caller and active organization, but the backend MUST enforce application resource ownership, tenant scope, entitlements, and business permissions.
- **Evidence:** Server-side token handling, authorization policies, database filters, service methods, and denied-access tests.
- **Verification:** Bypass UI checks and attempt cross-user, cross-organization, expired-session, and unauthorized operations directly.

### CLERK-007 — Organization and membership modeling

- **Applicability:** Clerk applications supporting teams, workspaces, organizations, or multi-tenant SaaS.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST document whether Clerk Organizations, application-owned organizations, or a hybrid model is authoritative for membership and role context. Resource authorization MUST use the active organization only as context and MUST verify the requested resource’s tenant boundary.
- **Evidence:** Organization configuration, local account/membership schema, token handling, routes, and authorization tests.
- **Verification:** Test multiple organizations per user, multiple tabs or active contexts, membership changes, and cross-organization resource access.

### CLERK-008 — Synchronization delay and outage behavior

- **Applicability:** Clerk applications depending on local identity projections or Clerk services during runtime.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST document behavior when Clerk webhooks are delayed or unavailable, and MUST avoid treating a stale local projection as proof of current authentication. Critical flows MUST use the authoritative verified session context or an explicit fallback strategy.
- **Evidence:** Request authentication flow, webhook reconciliation, error handling, operational documentation, and tests.
- **Verification:** Simulate delayed events, unavailable Clerk APIs, stale local data, and new-user onboarding.

## Review questions

- Is Clerk being used for identity rather than as the application database?
- Is `clerkUserId` unique and separate from mutable email fields?
- Are local projections necessary and synchronized safely?
- Are metadata fields small, non-sensitive, and non-authoritative?
- Are Clerk identity and organization claims rechecked by backend authorization?

## References

- [Clerk user synchronization](https://clerk.com/docs/guides/development/webhooks/syncing)
- [Clerk user metadata](https://clerk.com/docs/guides/users/extending)
- [Clerk Organizations](https://clerk.com/docs/guides/organizations/overview)
- [Clerk webhook verification](https://clerk.com/docs/guides/development/webhooks/overview)
