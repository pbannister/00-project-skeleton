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

## 3. Filename Structure

Feature numbers must be unique and must match the number referenced by the task, TODO
item, or feature dependency.

The feature name must be the established feature name.
Do not invent a new feature name when creating a feature file.

Scripts use names such as `build-thing.sh` and `sync-site.sh`.

Source modules use names such as `aspect_facet_category.ext`.

## 3.1 Filename Authority

Use an existing filename when the task identifies an existing file.

Before creating a file, inspect the relevant directory and reuse an established filename
pattern.

A filename is valid only if it is:

- Explicitly named by the task.
- Already present in the repository.
- Required by an established language, framework, or tool convention.
- Required by a referenced feature specification.
- Does not contain spaces or non-ASCII characters.

Do not invent filenames from an informal description.

Do not create synonymous, abbreviated, pluralized, or alternative filenames for an
existing concept.

If more than one filename is plausible, ask for clarification before creating a file.

If the required filename cannot be determined from the task, repository, conventions, or
feature specification, ask for the filename instead of guessing.

Do not rename an existing file to satisfy a naming preference unless the task explicitly
requests a rename.

## 4. Identifier Naming

Apply the rules in `prompts/flavors/semantic-sort-naming.md`.

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

For every `create`, `rename`, or `delete` operation, the task must identify the exact
source and target filename.

A directory name alone does not authorize creating a file with an invented name.

## 8. Output

Follow the exact output format specified by the task.

Do not include assumptions or invented requirements.

Do not modify unrelated files.
