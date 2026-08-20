# Pattern of Interaction with an LLM

This document captures a conversation about how to interact with an LLM.

The conversation compared old patterns of human work with LLM work.

The analogies are strong.

## The Core Idea

The unit of work is a work item, not a conversation.

A conversation is ephemeral.

A work item is durable: goal, constraints, deliverable, and acceptance.

The human writes work items.

The LLM executes them.

The human reviews the results.

This is the email pattern applied to machines.

## Human Documents versus Prompts

Human documents persuade, justify, and record.

A human reader needs motivation, history, and defense of a decision.

A prompt constrains a literal-minded entity with a context window and no memory.

A prompt is a work order, not a whitepaper.

A work order states the goal, the constraints, the deliverable, and the definition of done.

The document habit that carries over is version control, single source of truth, and review cycles.

The document habit that does not carry over is narrative persuasion.

Keep the human-shaped document as durable memory.

Let prompts reference the document instead of restating it.

## Episodes

An episode is a bounded unit of strongly related work with one goal and one acceptance.

Group strongly related items into one episode.

One episode pays dispatch overhead once.

Dispatch overhead is prompt setup, context loading, and human attention per handoff.

One episode also preserves coherence.

A model that handles the whole episode keeps the episode's context.

A model that handles fragments loses context between fragments.

The queue holds episodes.

Sub-tasks live inside the episode.

Sub-tasks are the execution plan, drafted by the model and ratified by the human.

Sub-tasks are not decision points for the human.

Size an episode so one competent reviewer can review its complete diff in one sitting.

## Risk Items First

Put risk items first.

Phrase each risk item as a question.

A question is a hypothesis with a checkable answer.

Verify the risky assumption before building on it.

The model can draft the risk questions.

The human orders them and judges the answers.

## The TODO Habit

The TODO list is a queue of episodes.

Update it near daily.

Check off items done.

Cross out items deliberately dropped.

Carry forward items meant to be done soon.

Keep speculative items unchecked.

Groom the queue every few weeks.

The model can draft items.

The human decides.

## Noise

Watching a model think is a waste of human attention.

The model thinking is where the value is produced.

The problem is attention, not thinking.

Ask for artifacts, not transcripts.

An artifact is a summary, a diff, or test results.

Work asynchronously so there is nothing to watch.

## Async Interaction

Send off a work item, then proceed with other work.

Check for results later.

Git is the message channel.

The model commits on its branch.

The human merges when the episode settles.

The merge is the check-the-mailbox moment.

## Review

The review surface makes async trust possible.

Review the artifact, not the process.

The human is the synthesis point and the final authority.

The model proposes; the human disposes.

A model reviewing its own output in the same context is weak.

A fresh-context review pass finds misses, like fresh human eyes.

## Consensus Ritual

The old ritual: walk around, gather perspectives, synthesize, run past the group.

The LLM version: fan out several perspectives, synthesize yourself, review with fresh context.

Fan out can mean several agents with different expert angles.

Synthesis stays human.

The review pass uses fresh context.

## Isolation

Branches do not isolate working trees.

Git worktrees do.

Run the LLM in its own worktree on its own branch.

See `01-async-worktree.md` for the worked example.

## Intent and Record

A work order is intent.

Intent lives in `prompts/` before dispatch.

Results are the record.

The record is the diff, the decisions, and the outcome.

The record lives in `records/` after completion.

The repository history is the conversation's product, not the transcript.

## Notebooks

Notebooks are a thinking medium, not a work-item medium.

Notebooks have hidden state, non-linear execution, and noisy diffs.

Use notebooks for exploration.

Keep work items as version-controlled text.
