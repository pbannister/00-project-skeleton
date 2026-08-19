# Project Overview

This repository is structured for collaborative development with a Large Language Model (LLM).

This file `README.md` is located at the root of the project structure.

The LLM should begin by reading:
1. `prompts/contract.md`
2. `prompts/workflow.md`
3. `prompts/conventions.md`

These define the interaction rules, workflow, and formatting conventions.

Human contributors should begin by reading:
- `prompts/how-to-write-tasks.md`

All project features are defined in `prompts/features/` and implemented in `sources/`.

The LLM must follow the workflow defined in `prompts/workflow.md` for every task.

## Top-Level Map

- `README.md` is the project overview.
- `TODO.md` tracks pending and completed project tasks.
- `prompts/` contains LLM interaction rules, common requirements, feature requirements,
  and task definitions.
- `sources/` contains implementations.
- `scripts/` contains project scripts.
- `tests/` contains tests and validation code.
- `dataflow.in/` contains input data.
- `dataflow.out/` contains generated data output.
- `logs/` contains generated logs.
- `site.in/` contains static-site input.
- `site.out/` contains generated static-site output.

## Canonical Files

The following filenames are canonical and must not be renamed or duplicated without an explicit task:

- `README.md`
- `TODO.md`
