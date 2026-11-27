# Prompt Corpus Mind-Map

A visual map of the prompt files drawn below, grouped by role and load condition.

As of 2026-11-27, the map omits `prompts/10-project.md` and the four files under `prompts/prose/`.

The always-loaded baseline applies to every task.
It lists `flavors/01-semantic-sort-naming.md`, which also appears under Language flavors, so that file loads on every task.
Capability files load only when a task touches them.
The remaining language-flavor files load only when a task touches them.
An authoring guide loads when its artifact is written or validated.
The feature, task, and episode files are dispatched work, not standing rules.
The glossary is a reference and defines no rule.

Load a non-baseline branch only when the task touches it.

```mermaid
mindmap
  root((prompts/))
    Always-loaded baseline
      01-contract.md
      02-workflow.md
      03-conventions.md
      common/01-universal-rules.md
      flavors/01-semantic-sort-naming.md
    Capabilities (load only when touched)
      capabilities/artifacts/01-generated-documentation.md
      capabilities/artifacts/02-version-information.md
      capabilities/artifacts/03-generated-data-products.md
      capabilities/artifacts/04-release-and-publishing.md
      capabilities/artifacts/05-pinned-dependencies.md
      capabilities/execution/06-execution-boundary.md
      capabilities/execution/07-session-log.md
      capabilities/execution/08-delegation-authority.md
      capabilities/execution/09-failure-attribution.md
    Language flavors
      flavors/01-semantic-sort-naming.md
      flavors/02-cpp-conventions.md (C++)
    Authoring guides (how-to-write-*.md)
      how-to-write-tasks.md
      how-to-write-features.md
      how-to-write-episodes.md
      how-to-write-research.md
    Feature requirements
      features/00-features.md
      features/01-site-build.md (worked example)
      features/02-project-pages.md
    Task definitions
      tasks/00-tasks.md
      tasks/01-site-build-implement.md (worked example)
      tasks/02-milestone-phases-remove.md
    Episodes
      episodes/00-episodes.md
      episodes/01-episode-template.md
      episodes/02-episode-plan.md
    Glossary (reference, no rule)
      common/03-glossary.md
```
