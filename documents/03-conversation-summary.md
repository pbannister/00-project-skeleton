# Conversation Summary

This document summarizes a conversation about working with an LLM.

The conversation started as a question about interaction patterns.

It ended with changes to this skeleton.

## The Pattern

- The unit of work is a work item, not a conversation.
- A prompt is a work order, not a whitepaper.
- Group strongly related items into an episode with one goal and one acceptance.
- Phrase risk items as questions and put them first.
- Treat the TODO list as a queue of episodes.
- Decouple human attention from the model's process.
- Dispatch work asynchronously and review artifacts later.
- Use git as the message channel.
- Keep the human as the synthesis point and final authority.
- Use worktrees to isolate LLM work.
- Separate intent from record.
- Use notebooks for exploration, not for work items.
- The full pattern is in `00-pattern-of-interaction.md`.

## The Skeleton Changes

- The interaction pattern was captured in `00-pattern-of-interaction.md`.
  The async-worktree worked example was added in `01-async-worktree.md`, and the tool-universe survey was added in `02-tool-universe.md`.
- `docs/` was renamed to `documents/`.
  `documents/` and `records/` were registered in the contract, conventions, README map, and skeleton test.
- The record convention was established in `records/README.md`.
  Episode authoring gained `prompts/how-to-write-episodes.md` and `prompts/episodes/01-episode-template.md`, and the episode rules were reformatted as Markdown lists.

### Supporting Changes

- Whole-word naming and one-item-per-line shell lists were codified in `prompts/03-conventions.md`.
- Open questions were added to `TODO.md`; the Open Questions section below records the four the conversation named.
- The DELTA provenance was noted as an open question.

## Preferences

- Use whole words in directory and filenames.
- Break long quoted lists in shell scripts to one item per line.
- Format rule lists as Markdown lists.
- Keep the skeleton tool-agnostic where possible.
- Communicate with substance only; no mechanical compliments.

## Static-Site Discussion

The skeleton demonstrates static-site generation without an SSG.
`scripts/site-build.sh` already wraps `site.in/*.txt` in literal HTML pages.
A minimal Markdown-to-HTML transformation is tempting, but it cuts close to replicating an SSG.
A hand-rolled transformer owns escaping, code fences, and Mermaid blocks.
Mermaid can render client-side in the browser, keeping the host rsync-only, and the client-side rendering choice is accepted.
The Markdown-to-HTML transformation still needs a parser, and a parser is a build-time dependency.
Near-literal output serves developer readers.
Non-developer readers want styling and navigation, which is SSG territory.
The Markdown-to-HTML change is open, the conversation tracked it in `TODO.md`, and the current build is still the literal text-to-HTML version.

## Open Questions

The conversation named four open questions: Jupyter, static-site generation, the DELTA protocol, and the tool universe.
`TODO.md` holds the current list.
The static-site question has the most detail; the other three are named but not yet scoped.

## Related Documents

- `00-pattern-of-interaction.md` — the interaction pattern.
- `01-async-worktree.md` — the async-worktree worked example.
- `02-tool-universe.md` — the tool survey.
