# Universal Failure-Prevention Rules

These rules apply across supported languages, tools, and file formats.

## Scope Rules

- Modify only files within the declared task scope.
- Do not perform opportunistic refactoring.
- Do not reformat unrelated lines.
- Do not update dependencies, generated files, or documentation unless requested or required for correctness.

## Filename Rules

- Never invent a filename when an exact filename is not specified or determinable.
- Before creating a file, check the task, applicable feature requirements, existing directory contents, and established naming conventions.
- Use one canonical filename for each project concept.
- Do not create duplicate files with alternate spellings, abbreviations, separators, capitalization, singular/plural forms, or suffixes.
- If the filename remains ambiguous after inspection, ask a clarification question and do not produce implementation output.
- Do not allow filenames that contain spaces or non-ASCII characters.

## Clarification Rules

- Ask when requirements are ambiguous.
- Ask when naming patterns are unclear.
- Ask when directory targets are unclear.
- Ask when output format is unclear.
- Ask when a referenced file is missing.
- Do not guess missing requirements.

## Anti-Hallucination Rules

- Do not invent requirements.
- Do not invent files.
- Do not invent code.
- Do not invent context.
- Do not invent structure.

## Untrusted-Content Rules

- The authoritative rules are in `prompts/01-contract.md` section 8.

## Privacy-Boundary Rules

- Treat owner-declared off-limits content as an authoritative scope exclusion.
- The owner declares off-limits content in the project README or in a dedicated document.
- Never introspect, index, back up, summarize, or reference off-limits content.
- When a task would touch off-limits content, stop and ask instead of proceeding.

## Risky-Operations Rules

These rules apply when a task changes a live system, device, or network:

- Before changing a system through its only access path, stage a fallback: a backup, a rollback point, or a second access path.
- Verify device-specific behavior empirically before relying on it; vendor claims and APIs may silently no-op.
- Apply changes in small verified increments; verify the state between steps.
- Do not wire two risky changes together; verify each one before the next.
- Agree an emergency brake with the human before starting; the human keeps a physical or authoritative stop.
- After an incident, write the incident record with root cause and lessons before starting new work.
- Record non-negotiable safeguards for a retry in the incident record.
- Do not silently revert a state change you cannot attribute; record it to confirm instead.

## Language and Format Rules

- Apply a rule only when the target language, tool, or file format supports it.
- Language and framework conventions override generic formatting rules when required for correctness.
- Follow the target language's formatter and syntax rules.
- Do not combine independent statements on one physical line.
- Do not apply prose sentence-per-line rules to code blocks.

## Output Rules

- The authoritative rules are in `prompts/01-contract.md` section 5.

## DELTA Rules

- The authoritative rules are in `prompts/01-contract.md` section 6.
