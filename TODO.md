# TODO

## Open Questions

* [ ] play with Jupyter and decide where it fits in the work pattern.
* [ ] decide the fate of the DELTA correction protocol.
* [ ] work through the async-worktree example in `documents/01-async-worktree.md` on a multi-thread development project.
      — The homelab exercise was single-threaded (hardware), so it used checkpoint and handoff records instead;
      worktrees remain the pattern for parallel, file-isolated development (see `documents/00-pattern-of-interaction.md`).
* [ ] improve the human-oriented documents in `documents/`.
* [ ] read the tool-universe sources in `documents/02-tool-universe.md`.

## Recently Completed

* [x] give verification an observable channel and remove the unobservable rules (2026-09-24; review consolidation 5):
    * [x] a single `VERIFICATION:` line is always permitted output, regardless of the requested format; the workflow reports through it and the glossary defines it.
    * [x] the internal restatement and plan are declared working aids, not an inspectable obligation.
    * [x] terminology is recast observably: use the glossary terms, and add a new term to the glossary in the same change.
    * [x] "do not include assumptions" becomes "state an assumption the task left open; do not present it as a requirement".
    * [x] episode size gains an observable proxy: one feature or one work product per episode.
* [x] close the clarification and workflow deadlocks (2026-09-24; review consolidation 3):
    * [x] a materiality rule: ask only when the ambiguity can change the output, scope, or safety; otherwise proceed and state the assumption (common/02 Clarification Rules).
    * [x] a missing referenced file is reported when the task can proceed, and asked about only when it cannot.
    * [x] the test policy authorizes the test files the change requires, resolving the TDD-versus-scope deadlock.
    * [x] `Execute the next TODO task` now drafts a conforming task for ratification instead of acting on a one-line item.
    * [x] a task/feature conflict reports which file is believed stale rather than looping on a question.
    * [x] a clarification question is always permitted output; the override names the rule it replaces and never waives safety or authorization; the Definition of Done accepts a reported no-tools verification.
* [x] give each rule family one authoritative home (2026-09-24; review consolidation 2): duplicated rule text replaced with pointers — DELTA (contract §6), untrusted content and secrets (contract §8), scope, clarification, and anti-hallucination (common/02), output (contract §5), human override (contract §10); the glossary now defines terms and names the rules instead of restating them; `02-workflow.md` §5/§9, `03-conventions.md` §8, `common/02`, and the two `how-to-write-*` override sections are pointers.
* [x] fix the file-system contract (2026-09-24; review consolidation, C1): `prompts/01-contract.md` §7 listed only `README.md` as a permitted root file, though `TODO.md`, `PHASES.md`, `Makefile`, `package.json`, and `.gitignore` live there and the workflow requires touching `TODO.md`; the section now names the permitted root files, points at `tests/00-skeleton.sh` for the required set, and adds `tools/` to the directory list.
* [x] resolve the commit, record, and Definition of Done rules (2026-09-24; review consolidation 4): `prompts/02-workflow.md` §7.1 now states one rule set — a status update rides with the work commit, the outcome record is post-review and a separate commit, and a record citing its own hash is always that second commit; §7.2 scopes the regression test to executable-code fixes; `records/README.md`, `prompts/03-conventions.md` §6, and `documents/05-lessons-from-MI25.md` are aligned.
* [x] make the contract's authoritative-file registry complete (2026-09-24; review consolidation 1): `prompts/01-contract.md` §2 is now a table naming every authoritative rule file, its precedence level, what it defines, and when it applies — including `flavors/02`, the `how-to-write-*` files (marked as addressed to the human author), `records/README.md`, `tests/README.md`, the episode template and plan, `tools/`, and the indexes; a restatement elsewhere is declared a pointer, and §9 now names §2 as the authority lookup.
* [x] make the drift check meaningful (2026-09-24; follow-up to the skeleton drift detector):
    * [x] classify files as rules (byte-identical), append-only (skeleton text must lead the file; additions allowed), or template (informational), so a project's glossary terms, document index, episode index, and appended `## How this project does it` section are not false-positive drift.
    * [x] add the publishing-contract files that actually drifted in practice (`prompts/features/02-project-pages.md` fatal, `documents/06-project-pages.md` append-only).
    * [x] `tests/08-skeleton-diff.sh` now covers append and prepend-fork cases.
* [x] pre-ignore scratch trees in `.gitignore` (2026-09-24; Tier 2 from the recent-project lessons): `.tmp-*`, `_site/`, `node_modules/`, and Python bytecode caches, so a pipeline or test that creates one does not dirty the tree.
* [x] add the skeleton drift detector and the append-not-fork rule (2026-09-24; Tier 2 from the recent-project lessons): derived projects froze their prompt copies at fork, so a project's stated rules could contradict its scripts.
    * [x] `scripts/skeleton-diff.sh` reports rule-file drift (fatal) and reference-artifact adaptation (informational) between a project and the skeleton; it already finds real drift in elseon and gnome.
    * [x] `tests/08-skeleton-diff.sh` covers clean, rule drift, and adaptation.
    * [x] `README.md` gains "Keeping Current with this Skeleton"; conventions §5 says to append a project section instead of forking shared text.
* [x] encode the publishing lessons (2026-09-24; Tier 2 from the recent-project lessons):
    * [x] the shared nav must be depth-adjusted (`../` per level) for a page below the project root, applied to the nav block only.
    * [x] replace the skeleton's placeholder `index.txt`/`dashboard.txt` before registering; a placeholder publishes a project that does not exist.
    * [x] generate the dashboard from live state, never hand-typed values.
    * [x] every served asset URL carries a content token, including transitive imports; the build fails when the stamp misses.
    * [x] landed in `prompts/features/01-site-build.md`, `prompts/features/02-project-pages.md`, `documents/06-project-pages.md`, and `prompts/03-conventions.md` §6.
* [x] add the research and decision-record guidance (2026-09-24; Tier 2 from the recent-project lessons): `prompts/how-to-write-research.md` defines one criteria file with a changelog, one study per candidate with fixed headings and evidence rules, the fan-out-then-synthesize method, the durable survey index, and the dated options-ladder decision record; registered in `prompts/README.md`.
* [x] ship the suggested episode plan (2026-09-24; Tier 2 from the recent-project lessons): `prompts/episodes/02-episode-plan.md` breaks `PHASES.md` into suggested episodes, named by phase and letter so dispatch-time renumbering cannot invalidate it; registered in `prompts/episodes/00-episodes.md` and referenced from `prompts/how-to-write-episodes.md` §9.
* [x] encode the record-keeping lessons (2026-09-24; Tier 2 from the recent-project lessons): `records/README.md` gains the two-commit rule for a record's own hash, the fails-against-old-code regression rule, the do-not-quote-the-gate rule, date-prefixed filenames, unattributable-drift handling, and "unexplained is a result"; `prompts/02-workflow.md` §7.1/§7.2 and `prompts/common/02-universal-rules.md` carry the matching rules.
* [x] organize the test suite (2026-09-24; Tier 2 from the recent-project lessons):
    * [x] `scripts/tests-run.sh` runs every test and reports `PASS`/`FAIL` with a summary, instead of stopping at the first failure.
    * [x] `tests/lib/test_helpers.sh` holds the shared skip/fail/pass helpers; `tests/05`–`07` use `skip_unless_tool`.
    * [x] `tests/README.md` documents the reserved number bands, the helper directory, the sandbox rule, and the fixture rule.
    * [x] `prompts/02-workflow.md` §4.1/§4.2 encode the skip idiom and the organization rules.
* [x] add the release and pinned-dependency conventions (2026-09-24; Tier 2 from the recent-project lessons): `prompts/03-conventions.md` §6.4 encodes publish gating, deterministic packing, versionless asset names, checksums/version/notes, installer rules, atomic install, and re-runnable publishing; §6.5 covers pinning a dependency to a tag and asserting the pin.
    * [x] ship `scripts/release-gate.sh` (refuses a dirty tree, a `-changes` version, and a version that does not name HEAD) and `tests/07-release-gate.sh`.
* [x] add the generated-data-product conventions (2026-09-24; Tier 2 from the recent-project lessons): `prompts/03-conventions.md` §6.3 encodes numbered stages and work products, reuse/`--refresh`/`--retry-failed`, file-named make rules, the no-dead-placeholder rule, a cheap `all` target, raw caches with provenance, `manifest.json`, `check`/`--check`, manual `clean` for expensive outputs, independent verification, and units in exchange formats.
    * [x] model the `all` target in the skeleton `Makefile` (defaults to `build`).
* [x] preserve nested lists in the condensed `todo.html` (2026-09-24; Tier 1 from the recent-project lessons): the old renderer flattened them and counted only lowercase, top-level completed items.
    * [x] `scripts/site-condense.sh` renders nesting with an indentation stack; completed items (`[x]` or `[X]`) are counted, never listed.
    * [x] `tests/06-todo-condense.sh` (tool-gated on python3) covers nesting, continuation lines, the counts, and balanced markup.
* [x] extend the site-build contract and its worked example (2026-09-24; Tier 1 from the recent-project lessons): the feature doc omitted asset pass-through, live state, generated artifacts, and deterministic trees that six projects already implement.
    * [x] `scripts/site-build.sh` copies authored assets verbatim and excludes `template.html` and `pages.nav`.
    * [x] `prompts/features/01-site-build.md` states the asset, live-state, generated-artifact, and deterministic-tree rules.
    * [x] ship an example `site.in/pages.nav`, and assert the asset copy and the two exclusions in `tests/01-site-build.sh`.
* [x] ship `scripts/version-generate.sh` (2026-09-24; Tier 1 from the recent-project lessons): `prompts/03-conventions.md` §6.2 names it canonical, but the skeleton shipped no implementation.
    * [x] generalized from the gnome-appimage-integration implementation; writes `dataflow.out/build/generated/version_info.h` and the gitignored build counter.
    * [x] `tests/05-version-generate.sh` (tool-gated on git) checks the `date-branch-hash` shape, the tag and `-changes` suffixes, and the counter.
* [x] register `PHASES.md` as a required root file (2026-09-24; Tier 1 from the recent-project lessons): the project-pages conventions depend on it, but the README map, the Canonical Files list, and the skeleton test omitted it.
    * [x] add it to the `README.md` top-level map and Canonical Files.
    * [x] require it in `tests/00-skeleton.sh`.
    * [x] add the keep-it-current rule to `prompts/03-conventions.md` §6.
* [x] build hygiene: start the site build from an empty output tree, and make `clean` remove directories (2026-09-24; Tier 1 from the recent-project lessons):
    * [x] `scripts/site-build.sh` clears `site.out/` first (keeping `.gitkeep`), so a renamed or removed page cannot linger as a published orphan.
    * [x] `make clean` uses `rm -rf`, so a pipeline's output subdirectories are actually removed (the old `rm -f` failed on a directory).
    * [x] `tests/01-site-build.sh` seeds a stale page and the placeholder and asserts the page is removed and the placeholder kept.
* [x] make the `PHASES.md` parser tolerant and validating (2026-09-24; Tier 1 from the recent-project lessons):
    * [x] `scripts/site-condense.sh` now takes the state as the last dash field, so `Current: phase N — <description> — state` parses (gnome's line did not, and lost its phase silently).
    * [x] an unknown state leaves `phase.txt` unwritten with a warning instead of emitting a wrong phase.
    * [x] `tests/04-phase-parse.sh` covers the descriptive form, the short form, and the invalid state.
* [x] add the sanitization gate the conventions required but the skeleton did not ship (2026-09-24; Tier 1 from the recent-project lessons):
    * [x] `scripts/sensitive-patterns.sh` is the single source of the publish patterns; never inline them elsewhere.
    * [x] `scripts/leak-gate.sh` refuses leaks over a file or tree and prints the first matches.
    * [x] `tests/03-leak-gate.sh` covers clean content (public IPs, `## 10.` headings), refused content, a missing path, and single-source drift.
    * [x] encode the rule in `prompts/03-conventions.md` §6, `prompts/features/02-project-pages.md`, and `documents/06-project-pages.md`.
* [x] add the live-state mechanism the project-pages conventions already named (2026-09-24; Tier 1 from the recent-project lessons):
    * [x] `scripts/site-state-fetch.sh` (`make state`) writes `dataflow.out/site-state.txt` as `KEY=value` lines, sanitized at capture.
    * [x] `scripts/site-build.sh` substitutes `__KEY__` placeholders from the state file; a key with no value renders as `unavailable`.
    * [x] `site.in/dashboard.txt` is a live-state example; `documents/06-project-pages.md` and `prompts/features/02-project-pages.md` document the mechanism.
    * [x] `tests/01-site-build.sh` covers substitution and the portable fallback.
* [x] repair skeleton inconsistencies: `logs/`, `.gitkeep` files, `make test` wiring.
* [x] add worked example: Site Build feature, task, script, input, and tests.
* [x] harden the workflow: Definition of Done, git commit step, verification-failure loop.
* [x] define the workflow for "tasks" versus "features".
    * [x] should long form tasks be in `prompts/tasks/` and follow the `prompts/how-to-write-tasks.md` guidance?
    * [x] should there be guidance for how to write features in `prompts/how-to-write-features.md`?

* [x] include a map of the prompts in `prompts/README.md` if missing
* [x] include top-level map of project in `README.md` if missing

- [x] Create project structure.
- [x] Write initial prompts.
* [x] study `prompts/flavors/01-semantic-sort-naming.md` and remove similar naming rules from other prompts.
* [x] capture the interaction-pattern conversation in `documents/00-pattern-of-interaction.md`.
* [x] add the async-worktree worked example in `documents/01-async-worktree.md`.
* [x] add the tool-universe survey in `documents/02-tool-universe.md`.
* [x] add `prompts/how-to-write-episodes.md` and `prompts/episodes/01-episode-template.md`.
* [x] establish the intent/record separation with `records/README.md`.
* [x] register `documents/` and `records/` in the contract, conventions, README map, and skeleton test.
* [x] extract the site-build HTML structure into `site.in/template.html`.
* [x] use UPPERCASE names for constant shell variables in scripts and tests.
* [x] apply semantic-sort naming to shell constant variables.
* [x] apply type-prefix naming to shell variable names.
* [x] incorporate the homelab lessons into the skeleton (2026-08-23):
    * [x] add outcome, incident, and handoff record forms to `records/README.md`.
    * [x] add risky-operations and privacy-boundary rules to `prompts/common/02-universal-rules.md`.
    * [x] add test tiers (portable, tool-gated, live-state) to `prompts/02-workflow.md` §4.1.
    * [x] add generated-documentation and live-state-verification conventions to `prompts/03-conventions.md`.
    * [x] add skeleton-startup guidance and privacy-boundary note to `README.md`.
    * [x] add the worktrees-versus-records section to `documents/00-pattern-of-interaction.md`.
    * [x] add `documents/04-lessons-from-homelab.md` and register it in `documents/README.md`.
    * [x] note in `prompts/features/00-features.md` that bundled features are examples.
* [x] incorporate the homelab project-pages publishing conventions (2026-08-25):
    * [x] standard page set: rename `hello.txt` to `index.txt` (status page), add
          `dashboard.txt`, standard 5-page nav in `site.in/template.html`.
    * [x] add `scripts/site-condense.sh` (todo/prompts/documents generator, from the
          MI25 fan-service) and wire `make site` (`site-build.sh` + `site-condense.sh`).
    * [x] retire `make deploy` — publishing goes through the homelab (homelab-publish).
    * [x] add `documents/06-project-pages.md` (conventions summary) and
          `prompts/features/02-project-pages.md` (feature).
* [x] capture the MI25 fan-service project process lessons (2026-08-24):
    * [x] encode the record-update rule: when a task changes a status, update the
          referenced record in the same commit (the MI25 record `09-project-site.md`
          said "not yet implemented" after the deployment was live).
    * [x] document that generated build trees are path-bound: clean them when the
          repository is reached through a different path (SSHFS vs native mount; a
          stale CMakeCache broke the MI25 build after the mount path changed).
    * [x] add timestamped test-run logging to `scripts/tests-run.sh` (the MI25
          project writes `logs/YYYY-MM-DD-HH-MM-SS-test-run.log`).
* [x] decide the site-build approach: literal text-to-HTML, Markdown-to-HTML, or a static-site generator such as 11ty.
      — **Decided 2026-08-23 by the homelab exercise**: the literal text-to-HTML site-build is kept as the minimal
      worked example; a real site used Eleventy (a static-site generator); model-driven documents use a custom
      generator with a provenance header. Encoded in `prompts/03-conventions.md` §6.1.
