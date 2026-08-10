# Dependency and Supply Chain Standard

**Scope:** projects that use third-party packages, modules, libraries, actions, images, or other externally maintained dependencies.

**Classification:** Required baseline, with tool preferences marked Recommended.

A package manager is only one layer of supply-chain defense. Bun, pnpm, and npm can all be configured safely or unsafely; projects MUST rely on reproducible resolution, integrity checks, controlled install behavior, and vulnerability response rather than assuming a tool makes dependencies trustworthy.

## Rules

### DEP-001 — Declared and locked dependencies

- **Applicability:** Projects with external dependencies.
- **Strength:** Required.
- **Rule:** Dependency manifests and the ecosystem’s supported lockfile or integrity file MUST be committed to the repository. If the ecosystem does not provide a lockfile, the project MUST document how dependency versions and integrity are controlled.
- **Evidence:** Manifests, lockfiles, checksums, workspace configuration, and project documentation.
- **Verification:** Perform a clean checkout and confirm dependency resolution uses the committed declarations rather than an untracked local state.

### DEP-002 — Reproducible CI installation

- **Applicability:** Projects installing dependencies in CI or deployment environments.
- **Strength:** Required.
- **Rule:** CI and deployment environments MUST use a frozen, locked, or equivalent reproducible install mode and MUST fail when the dependency manifest and lockfile disagree.
- **Evidence:** CI configuration, deployment scripts, package-manager commands, and install logs.
- **Verification:** Change the manifest without updating the lockfile and confirm the supported CI install rejects the mismatch.

### DEP-003 — Pinned dependency toolchain

- **Applicability:** Projects with a package manager or dependency tool that has meaningful version differences.
- **Strength:** Required.
- **Rule:** The package-manager version and relevant runtime version MUST be pinned or otherwise reproducibly selected for local, CI, and deployment use.
- **Evidence:** `packageManager`, tool-version files, container images, CI setup, or equivalent configuration.
- **Verification:** Compare local and CI tool versions and confirm a new contributor can install the intended versions without relying on an unrecorded global installation.

### DEP-004 — Controlled install and build scripts

- **Applicability:** Package ecosystems that execute dependency lifecycle or build scripts.
- **Strength:** Required when applicable.
- **Rule:** Dependency install and build scripts MUST be reviewed and controlled. Projects SHOULD disable unneeded dependency scripts and MUST explicitly trust or allow packages whose scripts are required.
- **Evidence:** Package-manager configuration, trusted or allowed dependency lists, install scripts, and review records.
- **Verification:** Inspect the effective install behavior and confirm required scripts have an identified purpose rather than being accepted indiscriminately.

### DEP-005 — Purposeful direct dependencies

- **Applicability:** Projects with direct third-party dependencies.
- **Strength:** Recommended.
- **Rule:** Each direct dependency SHOULD have a current purpose, an identified project owner, and a maintained version policy. Unused or transitive dependencies SHOULD NOT be declared directly.
- **Evidence:** Dependency manifests, source usage, ownership documentation, and update history.
- **Verification:** Compare declared direct dependencies with actual usage and remove or explain unused entries.

### DEP-006 — Dependency vulnerability management

- **Applicability:** Maintained or deployed projects with third-party dependencies.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST have a repeatable way to detect, assess, prioritize, and remediate dependency vulnerabilities. Critical or actively exploited vulnerabilities MUST have an explicit response decision.
- **Evidence:** Audit tooling, CI checks, security alerts, ownership, issue records, and remediation history.
- **Verification:** Run the project’s supported audit or scanner command and confirm findings have an owner, severity, and disposition.

### DEP-007 — JavaScript and TypeScript package-manager preference

- **Applicability:** New JavaScript and TypeScript projects choosing a package manager.
- **Strength:** Recommended.
- **Rule:** Bun SHOULD be the default package manager for new JavaScript and TypeScript projects. pnpm SHOULD be preferred when its workspace model, compatibility, or team constraints make it the better fit. npm MAY be used when it is the project’s compatibility requirement, provided the Required dependency controls are equivalent.
- **Evidence:** Package-manager configuration, lockfile, toolchain pinning, and project decision documentation.
- **Verification:** Confirm the selected manager is used consistently in local development, CI, and deployment, and that its security controls are configured intentionally.

## Review questions

- Is dependency resolution reproducible from a clean checkout?
- Does CI reject manifest and lockfile drift?
- Is the package-manager and runtime toolchain pinned?
- Which dependency scripts can execute, and which are explicitly trusted?
- Are dependencies purposeful, maintained, and monitored for vulnerabilities?

## Boundaries and exceptions

The package-manager preference is not a migration mandate. Existing projects may remain on npm or another manager when compatibility, deployment, or ecosystem constraints justify it. The project MUST still satisfy the Required reproducibility, integrity, script-control, and vulnerability-management rules or record a visible exception.

## References

- [Bun lifecycle scripts](https://bun.sh/docs/pm/lifecycle)
- [Bun lockfile and frozen installs](https://bun.sh/docs/pm/lockfile)
- [pnpm install and frozen-lockfile behavior](https://pnpm.io/cli/install)
- [npm install and lockfile/script controls](https://docs.npmjs.com/cli/install/)
