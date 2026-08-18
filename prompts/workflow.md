# LLM Workflow

This workflow defines the exact sequence the LLM must follow for every task in this
project. The workflow is mandatory and overrides any conflicting instructions unless
explicitly superseded by the human.

---

## 1. Load Project Rules

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

The LLM must read root TODO.md first to identify the active task (- [ ]).
The LLM must load only the feature prompt file explicitly linked to that active task 
(e.g., prompts/features/01-initial-feature.md), 
ignoring all other completed or pending feature files to preserve context window budget.

Before executing any task, the LLM must load and obey:

- prompts/contract.md
- prompts/conventions.md
- prompts/common/*
- prompts/features/* (only those relevant to the task)

These files define the project’s law, naming rules, formatting rules, and feature requirements.

### 1.1: TODO-Driven Context Loading

The LLM must read root TODO.md before starting any task.
The LLM must identify the active task marked with `- [ ]`.
The LLM must load only the single feature prompt file linked to the active task.
The LLM must ignore all other feature files to preserve context window budget.

---

## 2. Restate the Task

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

The LLM must begin every task by restating it in its own words. 
This ensures clarity and prevents misinterpretation.

- Use one sentence per line.
- Use short sentences.
- Use semantic-sort naming when restating.

Example:

    The task is to create a new script that performs X.

---

## 3. Ask Clarifying Questions (If Needed)

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

If any part of the task is ambiguous, missing, contradictory, or references a file
that does not exist, the LLM must ask clarifying questions before producing output.

The LLM must not guess or invent missing requirements.

---

## 4. Identify Relevant Prompts

The LLM must determine which prompts apply to the task:

- contract.md → interaction rules
- conventions.md → formatting and naming rules
- common/* → global project requirements
- features/* → feature definitions and implementation plans

Only load feature files relevant to the current task.

---

## 5. Plan the Work

Write Tests First: Before writing implementation code in `sources/`, 
write or update the corresponding test file in `tests/`.

Implement Feature: Write the source code in `sources/`.

Verify Execution: 
* Run the test suite (via a designated script in scripts/ or test runner) and confirm all tests pass. 
* A task cannot be marked complete in TODO.md if tests fail.

Before producing output, the LLM must generate a short, structured plan using
semantic-sort naming and 4-space indentation.

Example:

    plan:
        - analyze_feature_requirements
        - determine_required_files
        - generate_source_code
        - validate_against_conventions

The plan must be concise and must not include code.

- Use one sentence per line.
- Use semantic-sort naming in the plan.
- Use short plan steps.
- Use 4-space indentation.
- Models must not skip the plan.

### Section 5.1: Test-First Verification Gate

The LLM must write tests into tests/ before writing code into sources/.
The LLM must verify that all tests pass successfully.
The LLM must not declare any feature complete if tests fail.
The LLM must update TODO.md by changing `- [ ]` to `- [x]` upon completion.

---

## 6. Produce Output in Exact Format

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

The LLM must produce output **only** in the format specified by the task.

Rules:

- No commentary unless explicitly requested.
- No mixing instructions with output.
- No assumptions or invented requirements.
- Follow semantic-sort naming for all identifiers.
- Follow 4-space indentation.
- Follow directory and filename conventions.
- Follow feature numbering conventions.

If the task requests a file, produce only the file content.

If the task requests multiple files, produce them in the order specified.

---

## 7. Wait for DELTA Corrections

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

After producing output, the LLM must wait for human corrections.

Corrections must use the DELTA protocol:

    DELTA:
        Keep everything the same except X.

The LLM must:

- Apply only the requested changes.
- Not reinterpret or expand the correction.
- Not regenerate the entire output unless explicitly instructed.

---

## 8. Stability Rules

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

- The workflow must not be changed unless explicitly instructed.
- The LLM must not introduce new steps.
- The LLM must not skip steps.
- The LLM must not modify project structure or naming conventions.

---

## 9. Human Override

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

The human may override any rule in this workflow.

- Overrides must be explicit.
- When an override is given, the LLM must obey it strictly.
- Overrides apply to all rules unless stated otherwise.


