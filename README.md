# Project Overview

This repository is structured for collaborative development with a Large Language Model (LLM).

This file `README.md` is located at the root of the project structure.

The LLM should begin by reading these files in this order (the numeric prefix marks the load order):

1. `prompts/01-contract.md`
2. `prompts/02-workflow.md`
3. `prompts/03-conventions.md`

These define the interaction rules, workflow, and formatting conventions.

The LLM must follow the workflow defined in `prompts/02-workflow.md` for every task.

Human contributors should begin by reading:

- `prompts/README.md`
- `documents/README.md`

Note there are rules meant only to constrain Aider behavior:

- `tools/aider-rules.md` (Aider users only)

All project features are defined in `prompts/features/` and implemented in `sources/`.

## Top-Level Map

- `README.md` is the project overview.
- `TODO.md` tracks pending and completed project tasks.
- `prompts/` contains LLM interaction rules, common requirements, feature requirements, task definitions, and episode work orders.
- `documents/` contains human-consumption documents: the interaction pattern, worked examples, and tool notes.
- `records/` contains version-controlled episode outcome records.
- `tools/` contains tool-specific rules.
- `tools/aider-rules.md` is used only with Aider.
- `sources/` contains implementations.
- `scripts/` contains project scripts.
- `tests/` contains tests and validation code.
- `dataflow.in/` contains input data.
- `dataflow.out/` contains generated data output (not version-controlled).
- `logs/` contains generated logs (not version-controlled).
- `site.in/` contains static-site input.
- `site.out/` contains generated static-site output (not version-controlled).
- `Makefile` drives the build (`make build`), the tests (`make test`), and cleanup (`make clean`).

## Worked Example

The repository includes one worked example that exercises the whole workflow:

- Feature: `prompts/features/01-site-build.md`
- Task: `prompts/tasks/01-site-build-implement.md`
- Script: `scripts/site-build.sh` generates `site.out/` from `site.in/`.
- Tests: `tests/00-skeleton.sh` and `tests/01-site-build.sh`
- Input: `site.in/hello.txt`

Run `make build` to generate the site and `make test` to run the tests.

## Canonical Files

The following filenames are canonical and must not be renamed or duplicated without an explicit task:

- `README.md`
- `TODO.md`
- `Makefile`
