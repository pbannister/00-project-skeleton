# Project Pages (publishing conventions)

This document summarizes the project-pages publishing conventions that a
project started from this skeleton adopts. The canonical, authoritative
description lives in the homelab project:
`documents/09-project-pages-conventions.md`. This document is the skeleton's
summary of it and points back to the canonical source.

## Why pages exist

A project's published pages are its **read interface**: status, live state,
work plan (TODO), rules (prompts), and knowledge (documents). A human or LLM
can understand the project — and decide how to work with it — without
escaping the project's sandbox.

## The standard page set

A project publishes a directory tree served at `/projects/<id>/`, with a
consistent relative nav. Every page is required:

| Page | Content |
|---|---|
| `index.html` | **Status**: what the project is, its current status, how it works. |
| `dashboard.html` | **Dashboard**: live state (point-in-time values from the owning host). |
| `todo.html` | **Condensed TODO**: open work items. |
| `prompts.html` | **Condensed prompts map**: every file in `prompts/` with a one-line purpose. |
| `documents.html` | **Condensed documents map**: every file in `documents/` with a one-line purpose. |

Rules:

- The condensed pages (`todo.html`, `prompts.html`, `documents.html`) are
  **generated at build time** from the project's own files — never
  hand-maintained. The generator is `scripts/site-condense.sh`, wired into
  `make site` alongside `scripts/site-build.sh`.
- Condensation means index/summary, not full text (see the homelab
  conventions doc for the exact rules).
- **Relative links only**, so the pages work at any depth under
  `/projects/<id>/`.
- Pages are self-contained (their own `<style>`/nav); the reference template
  is `site.in/template.html`.
- Recommended: a footer line linking back to `../` and naming the project.
- Generated output (`site.out/`) is gitignored; only `site.in/` is authored.

## Registration and publishing (homelab model)

- The project **registers once** in the homelab project's
  `sources/projects.yaml` (fields: `id`, `title`, `summary`, `status`,
  `visibility`, `self_published: true`, `pages_source`).
- `pages_source` tells the homelab how to read the project's generated tree:
  a path (`site.out/`, local or SSHFS) or an ssh command that streams the
  tree.
- **The homelab project is the only publisher.** It fetches every registered
  `pages_source`, runs the leak gate, and publishes with its own deploy.
  Projects do **not** push to the web server themselves — a project's
  `make deploy` is retired and only reminds you of this.
- Live-state freshness: the project refreshes its own state (`make state`,
  run on the owning host for hardware/network values) before the homelab
  publishes.

## Sanitization (non-negotiable)

Published pages must contain no MAC addresses, private LAN IPs, usernames,
home paths, or private-key material. The exact gate patterns live in the
homelab (`scripts/labs-deploy.sh`, `tests/03-labs-site.sh`,
`tests/06-project-pages.sh`); the homelab re-runs the gate at publish time.

## Conformance checklist

1. Read the canonical conventions doc in the homelab.
2. Generate the standard page set per the rules above (the skeleton's
   `site.in/` + `scripts/site-build.sh` + `scripts/site-condense.sh` +
   `make site` produce it).
3. Register once in the homelab `sources/projects.yaml` with a readable
   `pages_source`.
4. Confirm the leak gate passes over the generated output.
5. After a homelab deploy, verify
   `curl https://labs.bannister.us/projects/<id>/` returns 200 and the
   content is sanitized.

## Live example

- `amd-mi25-fan-service` (SSHFS at `~/remote/beast.lan/work/...`) and
  `model-elevation-earth` (`/home/preston/work/01-model-elevation-earth/`)
  are live at `labs.bannister.us/projects/<id>/` using exactly this pattern.
