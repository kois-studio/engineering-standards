# Project Work System

Projects prepared with Engineering Standards use `docs/work/` as the default home for unfinished work.

The main queue is [`TODO.md`](TODO.md). It acts like a small repository-local work tracker without depending on a particular project-management product. It is intended to be readable by humans and agents, reviewable in Git, and easy to update during a coding session.

Use work-item states rather than separate permanent files for proposals, active work, blockers, or deferred work. Keep durable architecture and policy decisions in ADRs, current architecture in the project documentation, and temporary session continuity in a checkpoint or handoff.

The canonical ticket format is [`../templates/project-work.md`](../templates/project-work.md). The canonical session checkpoint format is [`../templates/project-checkpoint.md`](../templates/project-checkpoint.md).
