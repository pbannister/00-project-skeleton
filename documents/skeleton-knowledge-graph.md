# Skeleton Knowledge Graph

A map of the skeleton's directories, the files that relate them, and the products they generate.
It is a reference for a project owner who is deciding where a file belongs.

How to read it: start at `01-contract.md`, which names the authoritative file for each rule.
The other edges show the workflow, the prompt corpus, the history, and the products.

Legend:

- A solid arrow is a structural relation: one file invokes, references, or produces another.
- A dotted arrow is an informational relation: one file explains or ignores another.
- A subgraph groups files by role.

```mermaid
graph LR
  subgraph prompts
    direction TB
    C01[01-contract.md]
    C02[02-workflow.md]
    C03[03-conventions.md]
    COMMON[common/01-universal-rules.md]
    FLAVORS[flavors/]
    CAPABILITIES[capabilities/]
    FEATURES[features/]
    HOWTO[how-to-write-*.md]
  end

  %% Authority
  C01 -->|authoritative| C02
  C01 -->|authoritative| C03
  C01 -->|authoritative| COMMON

  subgraph history
    direction TB
    EPISODES[episodes/]
    TASKS[tasks/]
    RECORDS[records/]
  end

  subgraph narrative
    DOCS[documents/]
  end

  subgraph tooling
    direction LR
    MAKE[Makefile]
    SCRIPTS[scripts/*.sh]
    TESTS[tests/*.sh]
    AIDER[.aider.*]
    CHILD[derived projects]
  end

  subgraph build
    MAKE -->|invokes| SCRIPTS
  end

  subgraph products
    direction TB
    OUT[site.out/ & dataflow.out/ & logs/]
  end

  subgraph agents
    PROMPTS_DIR[prompts/] --> OUT
  end

  %% Feature and task linkage
  TASKS -->|reference| FEATURES
  EPISODES -->|reference| FEATURES
  TASKS -->|load when needed| CAPABILITIES
  TASKS -->|load when needed| FLAVORS

  %% Workflow and scripts
  C02 -->|runs| SCRIPTS
  C02 -->|validates with| TESTS

  %% Generated artefacts
  SCRIPTS -.->|produce| OUT
  C01 -.->|ignores| OUT

  %% Records and documents are templates for derived projects
  RECORDS -->|template for| CHILD
  DOCS -->|reference for| CHILD

  %% Tool-specific config
  AIDER -.->|local tooling| CHILD
```
