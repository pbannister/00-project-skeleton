# README for prompts

- `contract.md` defines instruction precedence, authority, safety, interaction phases, and
  output rules.
- `workflow.md` defines the execution sequence for tasks.
- `conventions.md` defines formatting, naming, repository structure, and file operations.
- `how-to-write-tasks.md` defines the format and rules for human-authored tasks.
- `common/00-overview.md` describes the purpose of shared prompt files.
- `common/01-requirements.md` defines requirements that apply globally.
- `common/02-universal-rules.md` defines scope, clarification, safety, anti-hallucination,
  and output rules.
- `common/03-glossary.md` defines project terminology and protocol concepts.
- `features/` contains feature-specific requirements.
- `tasks/` contains task-specific prompt definitions.

## Loading Rules

Always load the authoritative project-rule files listed in `workflow.md`.

Load only feature or task files explicitly referenced by the current task or by a
directly referenced dependency.

## Canonical Files

The following filenames are canonical and must not be renamed or duplicated without an explicit task:

- `contract.md`
- `conventions.md`
- `workflow.md`
- `how-to-write-tasks.md`
- `common/00-overview.md`
- `common/01-requirements.md`
- `common/02-universal-rules.md`
- `common/03-glossary.md`

