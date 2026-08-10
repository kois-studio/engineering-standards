# CI/CD Standard

**Scope:** production and non-trivial software projects that build, test, package, or deploy through an automated workflow.

**Classification:** Required baseline when applicable.

This standard is provider-neutral. Projects MAY use GitHub Actions, another hosted CI service, self-hosted runners, or an equivalent controlled system. The project’s available budget or hosted-runner quota may shape the implementation, but it MUST NOT silently remove required quality gates.

## Rules

### CI-001 — Automated validation pipeline

- **Applicability:** Production and non-trivial projects with source changes that can affect behavior, packaging, or deployment.
- **Strength:** Required when applicable.
- **Rule:** Projects MUST have an automated validation pipeline that runs for relevant changes and reports a clear pass or failure result.
- **Evidence:** CI configuration, workflow history, and project documentation.
- **Verification:** Trigger or inspect a representative change and confirm the pipeline runs, reports results, and is discoverable by contributors.

### CI-002 — Complete quality gates

- **Applicability:** Projects with the corresponding tool or artifact.
- **Strength:** Required when applicable.
- **Rule:** The pipeline MUST run the project’s applicable dependency installation, formatting check, lint check, type-check, tests or validation suite, build, and dependency/security checks. An inapplicable gate MUST be documented as such.
- **Evidence:** CI jobs, scripts, tool configuration, and project standards contract.
- **Verification:** Compare the pipeline with the project’s documented commands and confirm each applicable gate runs on the supported change path.

### CI-003 — Reproducible CI environment

- **Applicability:** All CI pipelines.
- **Strength:** Required.
- **Rule:** CI MUST use the project’s pinned runtime and dependency toolchain, committed lockfiles, reproducible installation mode, and explicitly configured environment inputs.
- **Evidence:** Runner configuration, tool-version files, lockfiles, install commands, and environment documentation.
- **Verification:** Run the pipeline from a clean environment and confirm it does not depend on untracked local state or undeclared global tools.

### CI-004 — Required checks protect delivery

- **Applicability:** Projects using pull requests, protected branches, or automated deployments.
- **Strength:** Required when applicable.
- **Rule:** A project MUST configure applicable CI failures to block merging or deployment through the platform’s available protection mechanism, unless an explicit emergency or exception process applies.
- **Evidence:** Branch protection, merge rules, deployment gates, and exception process.
- **Verification:** Inspect the repository settings or deployment configuration and confirm a failing required check cannot be silently treated as success.

### CI-005 — Safe workflow execution

- **Applicability:** CI pipelines handling repository write access, deployment credentials, or untrusted pull-request code.
- **Strength:** Required when applicable.
- **Rule:** CI workflows MUST use least-privilege permissions, MUST NOT expose secrets to untrusted code paths, and MUST keep sensitive values out of logs and artifacts.
- **Evidence:** Workflow permissions, secret scopes, event triggers, environment protections, and logs.
- **Verification:** Review pull-request execution paths and confirm untrusted changes cannot access deployment or write credentials without an intentional approval boundary.

### CI-006 — Resource and cost awareness

- **Applicability:** Hosted or metered CI environments.
- **Strength:** Recommended.
- **Rule:** CI SHOULD use caching, selective matrices, concurrency controls, and appropriate runner sizes to keep validation reliable and within the project’s resource budget.
- **Evidence:** Workflow timing, cache configuration, matrix strategy, concurrency settings, and budget policy.
- **Verification:** Inspect recurring runtime and resource usage and confirm the workflow has no unnecessary repeated work.

### CI-007 — Visible validation results

- **Applicability:** CI pipelines producing tests, scans, builds, or deployment artifacts.
- **Strength:** Recommended.
- **Rule:** CI SHOULD retain or expose enough logs, test results, scan results, and build metadata to diagnose failures and reproduce important outputs.
- **Evidence:** Artifacts, summaries, reports, retention settings, and project troubleshooting documentation.
- **Verification:** Inspect a successful and failed run and confirm a developer can understand the result without access to an ephemeral local machine.

## Review questions

- Does every relevant change run the appropriate validation gates?
- Can CI reproduce the project from a clean environment?
- Are failing checks actually connected to merge and deployment protection?
- Can untrusted pull-request code reach secrets or write permissions?
- Is the pipeline affordable and understandable for the repository’s hosting plan?

## Hosting and billing boundaries

The standard does not require GitHub Actions or any paid CI provider. GitHub’s current billing model gives public repositories free use of standard hosted runners, while private repositories receive plan-dependent included usage and may be blocked or billed after that allowance is exhausted. Projects using private repositories MUST verify their account’s current limits and document the chosen runner or alternative CI path.

See [GitHub Actions billing](https://docs.github.com/en/billing/concepts/product-billing/github-actions) for current provider-specific details. Do not copy plan quotas into a project standard because they can change independently of this repository.
