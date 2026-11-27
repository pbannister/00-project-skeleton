# Prose Agents

This directory holds the three prompts for a prose-scoring pipeline.
Each file is the only prompt its agent ingests.

- `01-prose-scoring.md` - the scoring agent.
  It scores document readability and returns a JSON report plus a human report.
  It is read-only.
- `02-prose-improvement.md` - the improvement agent.
  It revises prose from a score report and returns the revised text plus a change log.
  It preserves facts, paths, commands, code, and meaning.
- `03-prose-supervision.md` - the super-agent.
  It runs the scoring agent, then the improvement agents when a score is bad, then a fresh re-score.
  It accepts a revision only when the re-score improves and no invariant is broken.

The pipeline is:

```
super-agent -> scoring agent -> (bad score?) -> improvement agents (concurrent, disjoint chunks) -> scoring agent -> report
```

`CONCURRENCY` controls how many improvement agents run at once.
Each agent gets a disjoint chunk of the targets, and one fresh scoring agent re-scores the merged result.

These are operational prompts for a separate pipeline.
They are shared, and the contract registers them as conditional conventions.
An ordinary task does not load them; load one only when running that stage of the pipeline.

The `documents/` corpus uses short declarative sentences, one sentence per line, and lists for parallel points.
The rubric treats that style as house style and does not penalize it.
It penalizes the style only where it removes the reasoning a reader needs.
