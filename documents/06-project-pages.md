# Project Pages (publishing conventions)

This document summarizes the project-pages publishing conventions that a
project started from this skeleton adopts. The canonical, authoritative
description lives in the homelab project:
`documents/09-project-pages-conventions.md`. This document is the skeleton's
summary of it and points back to the canonical source.

Read it in seven parts: why pages exist, the standard page set, and the rules for the part you are building.
The remaining four are registration and publishing, sanitization, the conformance checklist, and the live example.

## Why pages exist

A project's published pages are its **read interface**: status, live state,
work plan (TODO), rules (prompts), and knowledge (documents). A human or LLM
can understand the project, and decide how to work with it, without escaping
the project's sandbox.

## The standard page set

A project publishes a directory tree served at `/projects/<id>/`, with a
consistent relative nav. Every page is required:

| Page | Content |
|---|---|
| `index.html` | **Status**: what the project is, its current status, how it works. |
| `dashboard.html` | **Dashboard**: live state (point-in-time values from the owning host). |
| `todo.html` | **Condensed TODO**: open work items. |
| `prompts.html` | **Prompts index**: the entire `prompts/` tree, grouped by directory, linking to full-text pages. |
| `documents.html` | **Documents index**: every file in `documents/`, linking to full-text pages. |
| `records.html` | **Records index**: every file in `records/`, linking to full-text pages. |

## Rules

Every rule in this section is a requirement unless it says `Recommended`.

### Page set

- The generated pages (`todo.html`, `prompts.html`, `documents.html`,
  `records.html`) are generated at build time from the project's own files.
  Never hand-maintain them.
  The generator is `scripts/site-condense.sh`, wired into `make site` alongside
  `scripts/site-build.sh`.
- Every `.md` file under `prompts/` (the entire tree), `documents/`, and
  `records/` is published as its own full-text page, for example
  `prompts-common-01-universal-rules.html`, linked from the index pages.
  Markdown is rendered with pandoc when available; otherwise use the minimal
  fallback.
- `todo.html` stays condensed: open items with their continuation text, and
  completed items summarized as a count.
- The page set is declared in `site.in/pages.nav` (optional).
  It is an ordered `href|Label` list that must contain the standard set.
  `make site` writes `site.out/pages.txt` for the homelab.
  When there is no file, the standard set is used.
  Extra pages are listed there and appear in the one nav.

### Navigation

- Use relative links only, so the pages work at any depth under
  `/projects/<id>/`.
- A page below the project root climbs out with `../`, one level per directory.
  Apply the prefix to the nav block only, never to a page's own relative links.
  A nav bug at depth is invisible at the root, so test both shapes.
- The homelab owns the one navigation bar.
  The template marks where it belongs with `<!-- HOMELAB-NAV -->` and must not
  contain a `<nav>` of its own.
  The homelab injects the bar (graphic, breadcrumb, and the project's page
  links) at publish time, and removes any project-authored `<nav>`.
  Projects never hardcode the labs site URL.

### Assets

- A served asset that a page loads (script, style, image, model) carries a
  content version in its URL.
  Its transitive imports carry versions too.
  The version makes the browser re-request a long-cached asset when its bytes
  change.

### Page content

- Replace the skeleton's placeholder `index.txt` and `dashboard.txt` before
  registering. A published placeholder describes a project that does not exist.
- Generate the dashboard from live state (the state file, the tool's own
  output, or the build manifest) rather than maintaining live values by hand.
- Pages are self-contained, with their own `<style>`; the reference template is
  `site.in/template.html`.
- The `<title>` of every page must be a real title, never the bare file name.
- Recommended: a footer line linking back to `../` and naming the project.

### Live state

Live state is placeholders plus a fetched state file.

- A page carries `__UPPERCASE_KEY__` placeholders.
- `scripts/site-state-fetch.sh` writes `dataflow.out/site-state.txt` as
  `KEY=value` lines. Set `SITE_STATE_FILE` to override the path.
- `scripts/site-build.sh` substitutes the values.
- A placeholder with no value renders as `unavailable`, so the pages build on a
  host that never ran the state fetch.
- Sanitize values at capture: the publishing gate refuses absolute home paths,
  and the values land in HTML.

### Generated output

- Generated output (`site.out/`) is gitignored; only `site.in/` is authored.

## Registration and publishing (homelab model)

### Registration

- The project registers once in the homelab project's `sources/projects.yaml`.
  The fields are `id`, `title`, `summary`, `status`, `visibility`,
  `self_published: true`, and `pages_source`.
- The registry `status` (active/planned/deferred/complete) is the
  human-declared activity, recorded once in the homelab registry.
- `pages_source` tells the homelab how to read the project's generated tree:
  a path (`site.out/`, local or SSHFS) or an ssh command that streams the tree.

### Publishing

- The homelab project is the only publisher.
  It fetches every registered `pages_source`, runs the leak gate, and publishes
  with its own deploy.
- Projects do not push to the web server themselves.
  A project's `make deploy` is retired and only reminds you of this rule.
- Live-state freshness: the project refreshes its own state (`make state`, run
  on the owning host for hardware and network values) before the homelab
  publishes.

## Sanitization (non-negotiable)

Published pages must contain no MAC addresses, private LAN IPs, usernames,
home paths, or private-key material.

The exact gate patterns live in the homelab project, as paths relative to its
root: `scripts/labs-deploy.sh`, `tests/03-labs-site.sh`, and
`tests/06-project-pages.sh`.
The homelab re-runs the gate at publish time.

The project runs its own gate first: `scripts/leak-gate.sh` over `site.out/`,
reading the patterns from `scripts/sensitive-patterns.sh`, their single source.
Do not inline the patterns in another script or test.
A duplicated pattern has already drifted once.

A record or document that describes the gate must not quote the refused
patterns verbatim.
A version that quotes them would fail its own gate.

Fix a false positive by tightening the pattern, not by suppressing the check.
Match private addresses only as dotted quads, so a numbered heading such as
`## 10. Human Override` still passes.

## Conformance checklist

1. Read the canonical conventions doc in the homelab.
2. Generate the standard page set per the rules above. The skeleton's
   `site.in/` + `scripts/site-build.sh` + `scripts/site-condense.sh` +
   `make site` produce it.
3. Register once in the homelab `sources/projects.yaml` with a readable
   `pages_source`.
4. Confirm the leak gate passes over the generated output.
5. After a homelab deploy, verify
   `curl https://labs.bannister.us/projects/<id>/` returns 200 and the
   content is sanitized.

## Live example

- `amd-mi25-fan-service` (an SSHFS path from `beast.lan`) and
  `model-elevation-earth` (a local path)
  are live at `labs.bannister.us/projects/<id>/` using exactly this pattern.
