# README for records

The record of each episode lives here.

A record is the outcome: what was done, what was decided, and where the work lives.

A record is version-controlled.

A record is written after the episode settles and the human reviews.

## Record File

One file per episode.

Name: `records/<number>-<episode-name>.md`.

Example structure:

```markdown
# Record: <episode name>

## Outcome

<What was done, in a few sentences.>

## Decisions

- <A decision made during review>.

## Verification

<What tests or checks passed.>

## Commits

- `<commit hash>` <commit message>
```

## Rules

Write the record only after review.

Reference the commit hashes.

Do not paste model transcripts into records.

Do not record generated output or logs.

## Canonical Files

The following filenames are canonical and must not be renamed or duplicated without an explicit task:

- `README.md` — this file.
