# Conventions

These conventions define formatting, naming, and repository structure.

## 1. Formatting

Use the target language, tool, or file format's required syntax and formatter.

Use four spaces for indentation when the target format supports configurable indentation.

Do not use tabs when the target format supports spaces instead.

Language and framework conventions override generic formatting rules when required for
correctness.

Use one sentence per line for prose and documentation when practical.

Do not apply prose sentence-per-line rules to code blocks.

Do not combine independent statements on one physical line when the target language
supports separating them.

Always follow the target language's brace and block syntax.

## 2. Directory Naming

Use stable, semantic-sort directory names.

The required directories are:

- `prompts/`
- `sources/`
- `scripts/`
- `tests/`
- `dataflow.in/`
- `dataflow.out/`
- `logs/`
- `site.in/`
- `site.out/`

Use `tests/` for unit tests, integration tests, script tests, and prompt validation.

Use `dataflow.in/` for input data.

Use `dataflow.out/` for generated data output.

Use `logs/` for generated logs.

Use `site.in/` for static-site input.

Use `site.out/` for generated static-site output.

Generated output directories are not version-controlled except for placeholder files
required to preserve the directory structure.

Log filenames must begin with
`YYYY-MM-DD-HH-MM-SS-description.log`.

## 3. Filename Structure

Use semantic-sort filenames.

Related files must share a structured prefix.

Feature files use `01-feature-name.md`.

Scripts use names such as `build-thing.sh` and `sync-site.sh`.

Source modules use names such as `aspect_facet_category.ext`.

Avoid CamelCase in filenames unless required by an external convention.

Use hyphens or underscores for readability.

Do not invent naming schemes.

## 4. Identifier Naming

Use semantic-sort identifiers composed of ordered semantic components.

Use the order:

`<domain>_<role>_<purpose>_<variant>`

Order components from broad meaning to narrow meaning.

Use the established project vocabulary.

Use descriptive names for identifiers with broad scope.

Short identifiers such as `i`, `s`, `n`, `p`, and `o` are permitted only in very small
scopes.

Use `o1`, `o2`, and `o3` for ordered transformations only when the target language and
scope make the sequence clear.

Preserve external names that cannot be changed.

Preserve names required by a language, framework, or public API.

Use the target language's conventional styles for constants, booleans, classes, and
public APIs when those styles are required for correctness or interoperability.

## 5. Documentation

Document public APIs, non-obvious behavior, invariants, side effects, and externally
visible formats.

Do not add comments that merely restate the code.

Include comments or docstrings only when requested or when they explain non-obvious
behavior.

## 6. Repository Hygiene

Maintain `.gitignore` rules for generated output and logs.

Preserve required empty directories with placeholder files when the repository requires
them.

Generated files must be identified as generated.

Generated files must not be edited manually unless explicitly requested.

Generated output must be written only to the designated output directory.

Source files, prompt files, and generated files must not be mixed.

## 7. File Operations

Every task must explicitly identify each file operation as one of:

- `create`
- `modify`
- `delete`
- `rename`
- `inspect`

A file listed as existing is not automatically authorized for modification.

## 8. Output

Follow the exact output format specified by the task.

Do not include assumptions or invented requirements.

Do not modify unrelated files.
