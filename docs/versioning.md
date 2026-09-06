# Standards Versioning

**Current working version:** `0.5.0`

The `0.5.0` baseline includes the `0.4.0` auditable rule model, Tech Lead workflows, project handoff templates, cross-project security/operations standards, expanded technology profiles, the provider-neutral Identity and Accounts Standard, the Clerk Identity Profile, the project implementation/work-queue workflow, and the Kois default technology-selection policy.

Projects MUST pin the standards version and SHOULD also record the exact source revision or tag used during their bootstrap. A project may remain on an older version while it plans migration; it must not silently apply rules from a newer version.

## Versioning policy

- **Patch version:** editorial corrections, link repairs, and clarifications that do not change applicability, strength, or required project behavior.
- **Minor version:** additive standards, profiles, templates, workflows, or recommendations that do not invalidate an existing compliant project.
- **Major version:** removed or renamed rule IDs, changed applicability, strengthened or weakened Required behavior, incompatible contract changes, or migrations requiring coordinated project work.

Before `1.0.0`, a minor version may contain breaking rule changes because the standards system is still establishing its public contract. Those changes MUST still be called out explicitly in migration notes.

When a change affects an accepted architectural or policy decision, create an ADR even when the version change is minor or major. Keep accepted ADRs immutable and document migration work in the new version’s release notes.

## Consumer migration

When adopting a newer version, a Tech Lead MUST compare the project contract with the new catalog, assess newly applicable rules, and record gaps as compliant, deferred, excepted, or not applicable with evidence. Version upgrades MUST NOT be represented as complete merely because the project updated a version string.

## 0.4.0 migration notes

Projects using AI developer agents SHOULD adopt `project-implementation` mode and SHOULD move unfinished work into `docs/work/TODO.md` using the project work-item format. Existing `docs/TODO.md` files MAY remain temporarily, but their contents SHOULD be migrated or linked from the new work queue so a fresh agent has one clear place to find unfinished work.

## 0.5.0 migration notes

Projects selecting a new technology SHOULD review the [Kois default stack profile](profiles/kois-default-stack.md). Existing projects do not need to migrate frameworks. New full-stack TypeScript projects should assess Angular + NestJS by default and document any alternative. Projects already using SvelteKit or another framework may remain on it; they should document the framework choice and apply the shared technology-neutral standards without claiming unselected framework profiles.
