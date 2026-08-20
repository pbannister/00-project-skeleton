# Conventions

These conventions define formatting, naming, and repository structure.

## 1. Formatting

- Use 4-space indents in code and Markdown when the format supports configurable indentation.
- Do not use tabs when the format supports spaces.
- Use one sentence per line in Markdown, so `git diff` is easier to read.
- Break long quoted lists in shell scripts to one item per line, so `git diff` is easier to read.
- Use UPPERCASE names for shell variables that stay constant once defined.
- Use whole words in shell variable names; do not abbreviate.
- Give shell constants at least two words in semantic-sort order, broad first.
- Prefix shell variable names with the type word, like `file_input`.
- Use short, concise sentences in the style of Douglas Adams.
- Do not apply sentence-per-line rules to code blocks.
- Do not combine independent statements on one physical line.
- Follow the target language's formatter and syntax rules.
- Follow the target language's brace and block syntax.
- Language and framework conventions override generic rules when required for correctness.

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
- `documents/`
- `records/`

- Use `tests/` for unit, integration, script, and prompt-validation tests.
- Use `dataflow.in/` for input data.
- Use `dataflow.out/` for generated data output.
- Use `logs/` for generated logs.
- Use `site.in/` for static-site input.
- Use `site.out/` for generated static-site output.
- Use `documents/` for human-consumption documents.
- Use `records/` for version-controlled episode outcome records.
- Generated output directories are not version-controlled.

## 3. Filename Structure

- Feature numbers must be unique and must match the task, TODO item, or feature dependency.
- Use the established feature name.
- Do not invent a new feature name.
- Use whole words in directory and filenames.
- Do not use abbreviations in directory and filenames.
- Scripts use semantic-sort names such as `site-build.sh` and `site-sync.sh`.
- Script names order components from broad meaning to narrow meaning: `<domain>-<role>.sh`.
- Source modules use names such as `aspect_facet_category.ext`.

## 3.1 Filename Authority

- Use an existing filename when the task identifies an existing file.
- Before creating a file, reuse an established filename pattern.
- A filename is valid only if it is:
    - explicitly named by the task.
    - already present in the repository.
    - required by an established language, framework, or tool convention.
    - required by a referenced feature specification.
    - free of spaces and non-ASCII characters.
- Do not invent filenames from an informal description.
- Do not create synonymous, abbreviated, pluralized, or alternative filenames for an existing concept.
- If more than one filename is plausible, ask for clarification.
- If the required filename cannot be determined from the task, repository, or conventions, ask instead of guessing.
- Do not rename an existing file unless the task explicitly requests it.

## 4. Identifier Naming

- Apply the rules in `prompts/flavors/01-semantic-sort-naming.md`.
- Language-specific naming rules live in `prompts/flavors/`.

## 5. Documentation

- Document public APIs, non-obvious behavior, invariants, side effects, and externally visible formats.
- Do not add comments that merely restate the code.
- Include comments only when requested or when they explain non-obvious behavior.

## 6. Repository Hygiene

- Maintain `.gitignore` rules for generated output and logs.
- Preserve required empty directories with placeholder files.
- Generated files must be identified as generated.
- Do not edit generated files manually unless explicitly requested.
- Write generated output only to the designated output directory.
- Do not mix source, prompt, and generated files.
- Commit messages use one line in imperative mood with a conventional prefix (`feat:`, `fix:`, `docs:`, `test:`, `chore:`, `refactor:`) and a short summary.
- A commit contains only the files of one completed task.
- Never commit generated output or logs.

## 7. File Operations

Every task must identify each file operation as one of:

- `create`
- `modify`
- `delete`
- `rename`
- `inspect`

- A file listed as existing is not automatically authorized for modification.
- For every `create`, `rename`, or `delete` operation, the task must identify the exact source and target filename.
- A directory name alone does not authorize creating a file with an invented name.

## 8. Output

- Follow the exact output format specified by the task.
- Do not include assumptions or invented requirements.
- Do not modify unrelated files.
