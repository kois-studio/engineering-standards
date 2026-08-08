# Standards Maintenance Workflow

**Mode:** `standards-maintenance`

**Goal:** improve the shared engineering standards system without confusing shared policy with facts from an individual project.

## 1. Understand the change

Classify the requested work as a principle, shared standard, technology profile, ADR policy, template, workflow, validation tool, or temporary investigation. Read existing documents on the topic before adding new material.

If the request is actually about preparing an external project, switch to `project-bootstrap` or `project-design` rather than modifying shared standards to fit one project.

## 2. Maintain coherent policy

When changing guidance:

- state scope and classification;
- use normative language consistently;
- give rules stable identifiers when the rule is intended for audit or automation;
- define applicability and exceptions;
- identify how compliance can be verified;
- check that profiles do not silently contradict shared standards; and
- keep one source of truth for each topic.

Avoid rules that cannot be interpreted or evidenced by a project agent. Replace vague requirements with measurable guidance or explicitly classify them as recommendations.

## 3. Preserve decisions and compatibility

A material change to an established standard or profile requires an ADR according to [`../adr/README.md`](../adr/README.md). Accepted decisions should not be silently rewritten.

Update versioning, compatibility notes, templates, examples, and indexes when a change affects project consumers. Do not break existing project contracts without documenting the migration path.

## 4. Verify the repository

Before finishing, verify:

- all maintained Markdown links resolve;
- indexes include new or renamed documents;
- templates are internally consistent with the workflows;
- normative strength matches the stated classification;
- examples do not present project-specific facts as shared policy; and
- the final summary explains changed behavior, migration implications, and follow-up work.
