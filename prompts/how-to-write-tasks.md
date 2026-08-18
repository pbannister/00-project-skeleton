# How to Write Tasks

This document defines how the human must write tasks for the LLM. Following these rules
ensures the LLM can execute tasks deterministically using the workflow in
prompts/workflow.md and the rules in prompts/contract.md.

---

## 1. Task Structure

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.

The LLM will follow the workflow exactly and will not guess missing information.
Every task must contain the following sections in order:

[TASK]
A clear description of what you want the LLM to do.

[OUTPUT FORMAT]
A precise description of the required output format.

(Optional) [CONTEXT]
Any additional information the LLM needs (file contents, requirements, notes).

(Optional) [FILES]
A list of files involved in the task (existing or to be created).


---

## 2. Writing the [TASK] Section

Follow prompts/common/02-universal-rules.md for all writing-style rules.

The [TASK] section must:

- Describe the goal clearly.
- Use semantic-sort naming when referring to files or identifiers.
- Avoid ambiguity.
- Avoid assumptions.
- Avoid commentary.
- Avoid mixing instructions with output requirements.

Examples:

[TASK]
Create a new script in scripts/ named build_site.sh that generates site.out/.

[TASK]
Implement the feature defined in prompts/features/03-user-authentication.md.

[TASK]
Refactor sources/parser/tokenizer.cpp to use semantic-sort naming.

---

## 3. Writing the [OUTPUT FORMAT] Section

 Follow prompts/common/02-universal-rules.md for all output-format stability rules.

The [OUTPUT FORMAT] section tells the LLM *exactly* what to produce.

Rules:

- Be explicit.
- Specify file contents when needed.
- Specify ordering when multiple files are required.
- Specify whether commentary is allowed (default: not allowed).
- Specify indentation (default: 4 spaces).
- Specify whether to include filenames.

Examples:

[OUTPUT FORMAT]
Provide only the file content of scripts/build_site.sh.

[OUTPUT FORMAT]
Produce two files in this order:
1. sources/auth/auth_handler.cpp
2. sources/auth/auth_handler.h

[OUTPUT FORMAT]
Provide a semantic-sort plan followed by the code.

---

## 4. Writing the [CONTEXT] Section (Optional)

Follow prompts/common/02-universal-rules.md for all context-format rules.

Use [CONTEXT] when the LLM needs additional information:

- Existing file contents
- Requirements
- Notes
- Constraints
- Data samples

Example:

[CONTEXT]
Here is the current content of sources/parser/tokenizer.cpp:
<insert file content>

---

## 5. Writing the [FILES] Section (Optional)

Follow prompts/common/02-universal-rules.md for all file-description rules.

Use [FILES] when the task involves multiple files or when you want to be explicit.

Example:

[FILES]
- scripts/build_site.sh (new)
- site.in/template.html (existing)
- site.out/index.html (generated)

---

## 6. DELTA Corrections

Follow prompts/common/02-universal-rules.md for all DELTA-format rules.

When correcting LLM output, use the DELTA protocol:

DELTA:
    Keep everything the same except:
    - Replace the function aspect_facet_operation() with aspect_facet_new_operation().
    - Add a new variable parser_state_mode in the initialization block.

Rules:

- DELTA corrections must be minimal.
- DELTA corrections must not restate the entire task.
- DELTA corrections must not request unrelated changes.
- DELTA corrections must not request a full regeneration unless explicitly stated.

---

## 7. Naming in Tasks

Follow prompts/common/02-universal-rules.md for all naming rules.

When referring to identifiers, filenames, or directories:

- Use semantic-sort naming.
- Use structured prefixes.
- Use 4-space indentation when showing code.
- Use directory names exactly as defined:
    - dataflow.in/
    - dataflow.out/
    - logs/
    - prompts/
    - sources/
    - scripts/

Examples:

Correct:
    sources/auth/auth_handler.cpp

Correct:
    aspect_facet_subfacet

Correct:
    o1, o2, o3 for ordered transformations

Incorrect:
    authHandler.cpp
    handler.cpp
    data/in/
    data/out/

---

## 8. Prohibited Task Patterns

Follow prompts/common/02-universal-rules.md for all prohibited behaviors.

Do NOT:

- Ask the LLM to “figure out the best format.”
- Ask the LLM to “improvise.”
- Ask the LLM to “decide what files are needed.”
- Mix instructions with output.
- Use vague language (“clean this up,” “make this better”).
- Request changes without DELTA format.
- Request output without specifying format.

- Do not compress multiple sentences into one line.
- Do not compress multiple statements into one line.
- Do not omit braces in code examples.
- These rules prevent failure modes common in small models.
- These rules apply to all models.

---

## 9. Examples of Complete Tasks

### Example A — Creating a new script

[TASK]
Create a new script that builds the static site from site.in/ into site.out/.

[OUTPUT FORMAT]
Provide only the file content of scripts/build_site.sh.

[FILES]
- scripts/build_site.sh (new)

---

### Example B — Implementing a feature

[TASK]
Implement the feature defined in prompts/features/04-session-management.md.

[OUTPUT FORMAT]
Produce the following files in order:
1. sources/session/session_manager.cpp
2. sources/session/session_manager.h

[CONTEXT]
Follow semantic-sort naming and 4-space indentation.

---

### Example C — DELTA correction

DELTA:
    Keep everything the same except:
    - Rename variable session_state_mode to session_state_current_mode.
    - Add a new function session_state_reset().

---

## 10. Human Override

The human may override any rule in this document.

Overrides must be explicit.

When an override is given, the LLM must obey it strictly.

## 11. Universal Failure-Prevention Rules

Follow prompts/common/02-universal-rules.md for all universal failure-prevention rules.
