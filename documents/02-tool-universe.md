# The LLM Tool Universe

This document surveys LLM tools through the lens of the interaction pattern.

The lens asks four questions about a tool:

- Sync or async?
- How much human attention does it demand?
- What is the review surface?
- How does it integrate with git?

Each section groups tools by where they run.
The comparison table at the end applies the four questions to every tool.
Cells marked "not stated" are gaps in the source material, not judgments about
the tool.

## Terminal Code Agents

- Aider is a terminal code agent that edits files and commits with git.
- Aider is git-native.
- Every Aider change is a diff to review.
- Aider refreshes its repo map and warns about externally edited files.
- Aider refreshes its view of the files, but it does not give the agent a
  separate working tree.
- Claude Code is a terminal agent with background modes.
- Background agents run and notify on completion.

## IDE-Integrated Agents

Cursor and GitHub Copilot embed agents in the editor.

Copilot has a background-agents pattern built on git worktrees.

## Worktree Multiplexers

- dmux runs parallel coding agents, each in its own worktree.
- gwt runs AI coding sessions per worktree.
- gtr is a git worktree runner.
- rove runs coding agents on parallel tasks with isolated worktrees.
- Each tool solves the same problem: several agents writing at once without
  sharing a working tree.

## Harness Environments

- Agent harnesses orchestrate LLM work at scale.
- Harnesses dispatch work to subagents and notify on completion.
- Harnesses can serialize access so the human and the model never write
  concurrently.

## CI and PR-Based Agents

- OpenHands and similar agents take an issue and produce a pull request.
- The pull request is the review surface: it carries the diff, the discussion,
  and the merge decision.
- The platform review and merge queue are the async mechanics.

## Notebooks

- Jupyter notebooks are a thinking medium.
- Notebooks keep state, re-run cells, and mix text with results.
- Notebooks have hidden state and noisy diffs.

## Plain API and Scripting

- The model API can be driven directly.
- A queue of prompts can run as a batch job.
- Results land in files for later review.
- This is the email pattern with minimal tooling.

## Comparison

| Tool | Sync or async | Human attention | Review surface | Git integration |
|---|---|---|---|---|
| Aider | sync, in the terminal | a diff review per change | the diff | commits with git; refreshes the repo map |
| Claude Code | interactive; background modes | a completion notification | not stated | not stated |
| Cursor | interactive; in the editor | editor review | the editor diff | not stated |
| GitHub Copilot | background agents; otherwise in the editor | a completion notification | the editor or worktree diff | background agents use worktrees |
| dmux | parallel | per-worktree review | the worktree diff | one worktree per agent |
| gwt | parallel | per-session review | the worktree diff | one worktree per session |
| gtr | parallel | per-worktree review | the worktree diff | a worktree runner |
| rove | parallel | per-task review | the worktree diff | isolated worktrees |
| Agent harness | async at scale | dispatch and notification | not stated | not stated |
| OpenHands | async | PR review | the pull request | produces a PR |
| Jupyter | sync, interactive | cell-by-cell attention | a noisy diff | poor; hidden state |
| Plain API | batch | low; review files later | output files | not stated |

## Mapping to This Project

- Aider fits the review-surface pattern: every change is a diff.
- A worktree gives Aider isolation.
- An episode file is the work order.
- A record file is the outcome.

## What to use when

- Use Aider in a worktree when you want a git-native diff you can review.
- Use a harness when you need several agents and async notification.
- Use the plain API when the work is a batch and the output is files.

## Sources

- June 2025 Coding Agent Report: evaluation of 15 coding agents. https://github.com/The-Focus-AI/june-2025-coding-agent-report
- ai-agent-benchmark: comparison of 80+ agents. https://github.com/murataslan1/ai-agent-benchmark
- Claude Code background agents. https://github.com/marc-shade/agentic-system-oss/blob/master/intelligent-agents/CLAUDE_CODE_BACKGROUND_AGENTS.md
- Background coding agents with git worktrees. https://crazyrouter.com/en/blog/background-coding-agents-without-lock-in-git-worktrees
- dmux. https://github.com/sterlingchapman/dmux
- gwt. https://github.com/slowestmonkey/gwt
- gtr. https://landscape.jimmysong.io/zh/projects/git-worktree-runner/
- rove. https://github.com/Sma1lboy/rove
- aider-desk worktree isolation docs. https://deepwiki.com/hotovo/aider-desk/2.5-git-worktrees-and-isolation
- Parallel AI coding context collisions. https://1devtool.com/blog/context-collisions-parallel-ai-coding
- OpenHands. https://github.com/OpenHands/OpenHands

## Status

This document is a living survey.

Verify tool names and features before relying on them.
