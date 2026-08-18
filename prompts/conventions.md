# Conventions

These conventions define the stable rules for formatting, naming, and structuring all
project files. All LLM-generated output must follow these conventions exactly.

---

## 1. Indentation

- All files (prompts, scripts, and source code) must use **4-space indentation**.
- Tabs must not be used.
- Alignment must be explicit; no “clever” indentation styles.

## 1.1 Writing Style (Short Sentences)

Follow prompts/common/02-universal-rules.md for all writing-style stability rules.

- Use short, concise sentences.
- Use one sentence per line.
- This applies to all prompts, documentation, and generated text.
- This improves readability and makes git diff cleaner.
- Avoid long paragraphs.
- Avoid multi-sentence lines.

---

## 2. Directory Naming (Semantic-Sort Directories)

- Directory names must follow **semantic-sort naming**: shared prefixes that ensure
  related directories sort together naturally.
- Required directories:
    - prompts/
    - sources/
    - scripts/
    - tests/             (unit and integration tests for source code)
    - dataflow.in/      (input data)
    - dataflow.out/     (generated output, not version-controlled)
    - logs/             (generated logs, not version-controlled)
    - site.in/          (used for static website generation)
    - site.out/         (generated website, not version-controlled)
- Log filenames must begin with a sortable date-time prefix:
  `YYYY-MM-DD-HH-MM-SS-description.log`

---

## 3. Filename Structure

- Filenames must follow semantic-sort naming.
- Related files must share a structured prefix so they sort together.
- Patterns:
    - Features: `01-feature-name.md`
    - Scripts: `build-thing.sh`, `sync-site.sh`
    - Source modules: `aspect_facet_category.ext`
- Avoid CamelCase in filenames.
- Use hyphens or underscores for readability.
- Never invent naming schemes; follow the patterns defined here.

---

## 4. Identifier Naming (Semantic-Sort Naming)

All identifiers must follow **semantic-sort naming**, meaning names are composed of
ordered semantic components that ensure natural alphabetical sorting and grouping.

### 4.1 Large-Scope Identifiers

Use full semantic-sort names for anything beyond a few lines of scope:

- Variables: `aspect_facet_subfacet`
- Functions: `aspect_facet_operation()`
- Classes/types: `aspect_facet_type`
- Modules: `aspect_facet_category`

These names encode structure, improve refactoring, and preserve code intelligence.

### 4.2 Small-Scope Identifiers (few lines)

Short identifiers are permitted only when the scope is extremely small and clarity is
improved:

- `i` for index
- `s` for string
- `n` for count
- `p` for pointer
- `o` for object

When two related entities exist:

- `i1`, `i2` for source/destination indices
- `o1`, `o2` for source/destination objects

### 4.3 Ordered Transformation Pipelines

When applying a series of ordered transformations (common in web applications):

- Use ordered object names: `o1`, `o2`, `o3` … `o9`
- This makes the transformation sequence explicit.
- It also helps detect ordering errors:
  - `o2.name_set(o4.name_get())` is clearly out of order.

### 4.4 CamelCase Exceptions

CamelCase may be used only when strong community standards require
(e.g., Python class names, Java class names).

## 4.5 Writing Style in Code

Follow prompts/common/02-universal-rules.md for all writing-style stability rules.

- Use short, clear statements.
- Use one statement per line.
- Use semantic-sort naming for identifiers.
- Use braces for all control-flow blocks.
- Avoid clever formatting.
- Avoid dense code.
- Prefer clarity over compactness.

---

## 5. Code Formatting

- Use 4-space indentation.
- Use descriptive names for large-scope identifiers.
- Include docstrings or comments for all functions.
- Follow semantic-sort naming rules for all identifiers.
- Do not include commentary or explanation inside code unless explicitly requested.

## 5.1 Code Line Structure

Follow prompts/common/02-universal-rules.md for all writing-style stability rules.

- Use one statement per line.
- Never combine multiple statements on one line.
- Always surround blocks with { } even when the block contains a single statement.
- This applies to: if, else, for, while, switch, and all similar constructs.
- Use short lines for clarity.
- Avoid long chained expressions on one line.
- Prefer breaking long expressions into multiple semantic-sort components.

---

## 6. Output Rules

- Follow the exact output format specified in the task.
- Never mix instructions with output.
- Never include assumptions or invented requirements.
- Never modify existing files unless explicitly instructed.

## 7. Universal Failure-Prevention Rules

Follow prompts/common/02-universal-rules.md for all writing-style stability rules.
