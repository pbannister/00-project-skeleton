# Project Overview

This repository is structured for collaborative development with a Large Language Model (LLM).

This file `README.md` is located at the root of the project structure.

The LLM should begin by reading:
1. `prompts/contract.md`
2. `prompts/workflow.md`
3. `prompts/conventions.md`

These define the interaction rules, workflow, and formatting conventions.
The LLM must follow the workflow defined in `prompts/workflow.md` for every task.

Human contributors should begin by reading this file and:
- `prompts/README.md`

All project features are defined in `prompts/features/` and implemented in `sources/`.


## Top-Level Map

- `README.md` is the project overview.
- `TODO.md` tracks pending and completed project tasks.
- `prompts/` contains LLM interaction rules, common requirements, feature requirements,
  and task definitions.
- `sources/` contains implementations.
- `scripts/` contains project scripts.
- `tests/` contains tests and validation code.
- `dataflow.in/` contains input data.
- `dataflow.out/` contains generated data output (not version-controlled).
- `logs/` contains generated logs (not version-controlled).
- `site.in/` contains static-site input.
- `site.out/` contains generated static-site output (not version-controlled).
- `Makefile` drives the build (`make build`), the tests (`make test`), and cleanup
  (`make clean`).

## Worked Example

The repository includes one worked example that exercises the whole workflow:

- Feature: `prompts/features/01-build-site.md`
- Task: `prompts/tasks/01-implement-build-site.md`
- Script: `scripts/site-build.sh` generates `site.out/` from `site.in/`.
- Tests: `tests/00-skeleton.sh` and `tests/01-build-site.sh`
- Input: `site.in/hello.txt`

Run `make build` to generate the site and `make test` to run the tests.

## Canonical Files

The following filenames are canonical and must not be renamed or duplicated without an explicit task:

- `README.md`
- `TODO.md`
- `Makefile`

