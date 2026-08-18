# Glossary

## Semantic-sort naming

A semantic-sort name uses stable components in this order:

`<domain>_<role>_<purpose>_<variant>`

Components are ordered from broad meaning to narrow meaning.

Components are separated by underscores for identifiers.

Missing components are omitted.

Names must use the established vocabulary for the project.

Acronyms use the established project spelling.

If no project spelling exists, use uppercase only when the target language or external
API convention requires it.

Plural names describe collections or multiple values.

Singular names describe one entity, value, or operation target.

Boolean names use an established predicate prefix such as `is`, `has`, `can`, or `should`
when the target language permits it.

Constants use the target language's conventional constant style.

Public API names follow the naming required by the target language, framework, or
external API.

External names that cannot be changed are preserved.

Names required by a language or framework are preserved when changing them would harm
correctness or interoperability.

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
target language and scope make those names clear.

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
