# LLM Interaction Contract

This contract defines the fixed rules the LLM must follow for all tasks in this project.
These rules override any conflicting instructions unless explicitly superseded by the human.

---

## 1. Scope of Obedience
- You must obey the instructions in:
  - prompts/contract.md
  - prompts/workflow.md
  - prompts/conventions.md
  - prompts/common/*
  - prompts/features/*
- You must treat these files as authoritative project law.

---

## 2. Task Execution Rules
- Every task must follow the workflow in `prompts/workflow.md`.
- Never begin a task without restating it first.
- Never produce output until clarifying questions (if any) are answered.
- Never mix instructions with output.
- Never change the workflow or conventions unless explicitly instructed.
- Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

---

## 3. Output Rules
- Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.
- Always follow the exact output format specified in the task.
- Never add commentary, explanations, or meta‑discussion unless requested.
- Never include assumptions or invented requirements.
- Never include code outside the requested file or format.
- Never modify existing files unless the task explicitly instructs you to.

---

## 4. Correction Rules (DELTA Protocol)
When the human requests changes:
- Use DELTA format:
  - “DELTA: Keep everything the same except X.”
- Apply only the requested changes.
- Do not reinterpret or expand the correction.
- Do not regenerate the entire output unless explicitly told to.

---

## 5. File System Rules
- All new files must be placed in the correct directory:
  - prompts/ for prompt files
  - sources/ for source code
  - scripts/ for shell scripts
  - dataflow.in/ for input data
  - dataflow.out/ for generated output (not version-controlled)
  - logs/ for generated log files (not version-controlled)
  - site.in/ as input for static site generation
  - site.out/ as output for static site generation (not version-controlled)
- Log filenames must begin with a sortable date-time prefix:
  YYYY-MM-DD-HH-MM-SS-<description>.log
- Never create files outside the project structure.
- Directory names must follow semantic-sort naming, using shared prefixes to ensure
  related directories sort together.

---

## 6. Consistency Rules
- Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.
- Maintain consistent naming, formatting, and structure as defined in `prompts/conventions.md`.
- Maintain consistent terminology across all prompts and outputs.
- Maintain consistent feature numbering in `prompts/features/`.
- All prompts and source code must use 4-space indentation.
- All filenames must follow structured naming conventions that ensure related items
  sort together naturally.
- All identifiers must follow semantic-sort naming. Names must be composed of ordered
  semantic components (aspect_facet_subfacet) that ensure natural alphabetical sorting
  and grouping of related items.
- Single-word identifiers must not be used except where strong community standards
  require them (e.g., Python builtins).
- Semantic-sort naming includes scope-based identifier length:
    - Short identifiers (i, s, n, p, o, o1, o2...) are permitted only in very small scope.
    - Larger scope requires full semantic-sort names.


---

## 7. Clarification Rules
- Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.
- If any part of a task is ambiguous, ask clarifying questions before producing output.
- If a task contradicts the contract or workflow, ask for resolution.
- If a task references missing files, ask whether to create them.

---

## 8. Prohibited Behaviors
- Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.
- Do not invent features, requirements, or files.
- Do not modify the contract, workflow, or conventions unless explicitly instructed.
- Do not produce partial or speculative implementations.
- Do not produce commentary unless requested.

---

## 9. Human Override
- The human may override any rule in this contract.
- Overrides must be explicit.
- When an override is given, obey it strictly.

---

## 10. Contract Stability
- prompts/common/02-universal-rules.md is part of the stable contract.
- This contract remains in effect for the entire project.
- All tasks must begin by assuming this contract is loaded.

