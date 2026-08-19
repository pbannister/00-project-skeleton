# Glossary

## Semantic-sort naming

The complete semantic-sort naming rules are defined in
`prompts/flavors/semantic-sort-naming.md`.

## DELTA protocol

DELTA applies minimal corrections.

A DELTA applies to the immediately preceding assistant output unless another artifact is
identified.

A DELTA changes only the named portions.

A DELTA does not regenerate full output unless explicitly requested.

If a DELTA cannot be applied without changing additional portions, clarification is
required.

## Universal failure-prevention rules

Universal failure-prevention rules apply across supported languages, tools, and file
formats.

These rules define scope, clarification, anti-hallucination, safety, and output
behavior.

## One-sentence-per-line

Each prose sentence occupies one line when the applicable document convention requires
it.

This rule does not apply to code blocks.

## One-statement-per-line

Independent statements must not be combined on one physical line when the target
language supports separating them.

The target language formatter and syntax rules take precedence.

## Feature file

A file in `prompts/features/`.

A feature file defines a project capability.

A feature file describes requirements and behavior.

A feature file applies only when referenced by the task or a directly referenced feature
dependency.

## Plan block

A block listing ordered steps.

A plan block uses semantic-sort naming where applicable.

A plan block precedes implementation only when requested by the output format.

## Output block

A block containing final output.

An output block follows the exact requested format.

An output block contains no unrequested commentary.

## Context block

A block providing additional information.

A context block contains file contents, requirements, notes, samples, or constraints.

A context block does not add instructions unless explicitly labeled as a constraint.

## Scope-based identifier length

Short identifiers exist only in small scopes.

Large-scope identifiers require descriptive semantic-sort naming.

Scope determines identifier length.

## Ordered transformation pipeline

An ordered transformation pipeline uses names such as `o1`, `o2`, and `o3` when the
target language and scope make the sequence clear.

The sequence encodes transformation order.

## Generated file

A generated file is produced by a script, build tool, generator, or other automated
process.

Generated files must be identified as generated.

Generated files must not be edited manually unless explicitly requested.

Generated output must be written only to the designated output directory.

## Stability rules

Stability rules define project behavior that should not change without explicit
instruction.
