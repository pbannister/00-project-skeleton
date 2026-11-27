# Readability Audit

Audit date: 2026-11-27.
Corpus: `documents/`, 12 Markdown files. This report is excluded from the count.
Threshold: 75.
Rubric: `prompts/prose/01-prose-scoring.md`.
Mode: apply. Three improvement chunks ran at concurrency 3.

This report records a score, a revision, and a paired re-score.
The paired re-score is the acceptance test.
A second full-corpus score describes the final state.

The corpus had already received one manual revision pass.
This run starts from that state.
The baseline below is the state at the start of this run, not the original skeleton.

## Method

- Score: a fresh scoring agent read all 12 documents and returned the section 11 report.
- Revise: three improvement agents, each with a disjoint chunk, read a filtered score report and wrote staged copies.
  The targets were the three triggered documents plus the two lowest-scoring non-triggered documents with major defects.
- Accept: a fresh scoring agent re-scored the merged 12-document corpus, blind to the change logs.
- Control: two scoring runs differ in severity, so a third fresh scorer scored the five baseline documents and their five revisions as ten blinded samples in one run.
  The paired deltas control for scorer severity.

Targets: `00-pattern-of-interaction.md`, `03-conversation-summary.md`, `06-project-pages.md`, `08-prompt-corpus-mindmap.md`, and `09-prompt-relations-graph.md`.
The other seven documents were not edited.

## Baseline

| Document | Genre | Score | Band | Triggered |
|---|---|---:|---|---|
| `00-pattern-of-interaction.md` | essay | 79.4 | Adequate | no |
| `01-async-worktree.md` | guide | 98.1 | Exemplary | no |
| `02-tool-universe.md` | reference | 94.4 | Exemplary | no |
| `03-conversation-summary.md` | summary | 74.4 | Adequate | yes |
| `04-lessons-from-homelab.md` | record | 97.5 | Exemplary | no |
| `05-lessons-from-MI25.md` | record | 96.3 | Exemplary | no |
| `06-project-pages.md` | specification | 85.0 | Strong | no |
| `07-prompt-maturity.md` | rubric | 86.3 | Strong | no |
| `08-prompt-corpus-mindmap.md` | diagram | 83.8 | Strong | yes |
| `09-prompt-relations-graph.md` | diagram | 81.3 | Strong | yes |
| `README.md` | index | 98.8 | Exemplary | no |
| `skeleton-knowledge-graph.md` | diagram | 95.0 | Exemplary | no |

Mean 89.2.
Median 90.3.
Lowest `03-conversation-summary.md`, 74.4.
Highest `README.md`, 98.8.

Below threshold: `03-conversation-summary.md`.
Triggered, lowest first:

1. `03-conversation-summary.md`, 74.4.
2. `09-prompt-relations-graph.md`, 81.3.
3. `08-prompt-corpus-mindmap.md`, 83.8.

The first scorer found no critical defect.
The paired control found one that the first scorer missed: the old `06` live example printed home paths in a document that its own sanitization section publishes.
That miss is one reason the paired control is the acceptance test.

## Paired control

One blind scorer scored the five baseline documents and the five revisions in one run.
Only the deltas are evidence; the absolute numbers are not comparable to the first audit.

| Document | Baseline | Revised | Delta | Decision |
|---|---:|---:|---:|---|
| `00-pattern-of-interaction.md` | 71.3 | 88.8 | +17.5 | accepted |
| `03-conversation-summary.md` | 78.1 | 78.8 | +0.7 | accepted |
| `06-project-pages.md` | 59.0 | 89.4 | +30.4 | accepted |
| `08-prompt-corpus-mindmap.md` | 84.4 | 94.4 | +10.0 | accepted |
| `09-prompt-relations-graph.md` | 76.3 | 85.6 | +9.3 | accepted |

`06` scored 59.0 before because its live example was a critical defect, and a critical defect caps the total at 59.0.
Its uncapped baseline was 80.6, so the uncapped delta is +8.8.
The capped delta is the rubric's score.

Mean before 73.8.
Mean after 87.4.
Mean delta +13.6.
No target regressed.
Every revised score is at or above 75.
No revised document has a critical defect.
`03-conversation-summary.md` gained the least and remains the weakest document; its residual defects are the first next action.

## What changed

The revisions are local to the named defects; each change log is in the run record.

- `00-pattern-of-interaction.md`: the opening states the document's job and reader; provenance moved to a closing note; `work item` and `work order` are defined once; the episode chain reads as connected sentences; the review-surface sentence is split; the missing possessive and heading case are fixed.
- `03-conversation-summary.md`: the changelog is grouped by outcome; the static-site bullets became a reasoned paragraph; the open status is stated once; the open questions are attributed to the conversation and pointed at `TODO.md`; the four questions are named.
- `06-project-pages.md`: the reading map names all seven sections; `Live state` moved under `Rules`; the asset-versioning sentences name the browser and the imports; the homelab test paths are qualified; the generated-page example is corrected to `prompts-common-01-universal-rules.html`; the live example no longer prints home paths.
- `08-prompt-corpus-mindmap.md`: the claim is scoped to the files drawn; a dated omission note names `prompts/10-project.md` and the four `prompts/prose/` files; the duplicate `flavors/01` load condition is explained; the load rule is separated from the baseline rule.
- `09-prompt-relations-graph.md`: the how-to and the legend are one key; dotted edges are defined by relation, not as authority pointers only; the `§`, `C1`, `W2`, and `ENF` labels are explained; the false "dashed cluster" sentence is removed; a dated scope note names the omissions.

The Mermaid blocks in `08` and `09` are byte-identical to their pre-run versions.
The invariant for diagram syntax forbade those edits, so the diagrams still carry the duplicate flavor node and the `01..05.md` shorthand.

## Final state

A fresh 12-document re-score of the final corpus:

- Mean 88.1.
- Median 89.1.
- Lowest `03-conversation-summary.md`, 78.1.
- Highest `05-lessons-from-MI25.md`, 95.6.
- Below threshold: none.
- Triggered: none.
- Critical defects: none.

The mean is 1.1 points below the baseline audit.
That is scorer severity, not a regression: the seven unchanged documents scored 3.8 points lower on average in that run.
The paired control above is the test of the revisions.

## Residual defects

- `00-pattern-of-interaction.md`: the Noise section is still a bullet chain; the three roles are stated twice; the close is provenance, not a status.
- `03-conversation-summary.md`: `Supporting Changes` is a catch-all; line 58 joins three independent clauses with commas; `SSG` is undefined at first use; the static-site paragraph still reads as a chain of assertions.
- `06-project-pages.md`: `Read it in seven parts` makes `it` ambiguous with the canonical homelab document; `Sanitization` sits after the publishing section it gates; `Recommended:` does not match the `Recommended` marker declared at line 35.
- `08-prompt-corpus-mindmap.md`: the `so` sentence reads as a false cause; the load rule is stated three times; the map has no axis legend.
- `09-prompt-relations-graph.md`: the dotted-arrow definition is still broad; `01..05.md` is shorthand, not a filename; the omission note is incomplete.
- The seven untouched documents carry minor residuals from the final re-score: a pronoun in `01`, the grouping and heading case in `02`, a missing date in `04`, a mixed-grammar list in `05`, a long sentence in `07`, two wording nits in `README.md`, and an unlabeled edge in `skeleton-knowledge-graph.md`.

## Next actions

1. Fix the comma splice and define `SSG` at first use in `03-conversation-summary.md`.
2. Rewrite the `06` opener as "This document has seven sections:" and move `Sanitization` before `Registration and publishing`.
3. Correct the same stale generated-page example in `prompts/features/02-project-pages.md` and the comments in `scripts/site-condense.sh`; both still say `prompts-common-02-universal-rules.html`, and `make site` writes `prompts-common-01-universal-rules.html`.
4. Run a second prose pass on the five targets with the residual list.
5. Do not edit the Mermaid blocks without a diagram-specific task; this pass preserved them byte for byte.

## Verification

- `make test` exited 0; all test files passed; the log is `logs/2026-11-27-03-25-36-test-run.log`.
- `make site` exited 0.
- `make check` reported `leak-gate: clean: site.out`.
- `site.out/prompts-common-01-universal-rules.html` exists, which confirms the slug correction.
- Five documents changed and seven did not, checked by SHA-256 against the pre-run snapshot.
- The Mermaid blocks in `08` and `09` are byte-identical to the pre-run versions.
- The improvement agents' projected scores were not used.
- No scoring agent edited a document.

## Reproduction

```
1. Score
   prompt: prompts/prose/01-prose-scoring.md
   corpus: documents/
   threshold: 75
   audit date: 2026-11-27

2. Improve
   prompt: prompts/prose/02-prose-improvement.md
   targets: 00, 03, 06, 08, 09
   mode: write; staging outside the corpus
   chunks: 3; concurrency: 3

3. Re-score the merged corpus
   prompt: prompts/prose/01-prose-scoring.md
   corpus: the merged 12-document corpus
   threshold: 75

4. Paired control
   prompt: prompts/prose/01-prose-scoring.md
   inputs: the five baseline documents and the five revisions, shuffled and blinded
```

SCORE: mean 89.2 before; 88.1 after the full re-score; 12 documents; 1 below threshold and 3 triggered before; 0 below and 0 triggered after.
PAIRED: 5 targets; mean 73.8 before; 87.4 after; mean delta +13.6; 0 regressions.
VERIFICATION: make test -> exit 0; make site -> exit 0; make check -> clean; 5 changed, 7 unchanged; Mermaid byte-identical.
