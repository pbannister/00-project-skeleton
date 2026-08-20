# Feature: Site Build

## Purpose

The project contains a static-site input directory (`site.in/`) and a generated static-site output directory (`site.out/`).

The Site Build feature provides the script that converts `site.in/` into `site.out/`.

## Requirements

- `scripts/site-build.sh` must generate the static site in `site.out/` from the input in `site.in/`.
- Each `site.in/*.txt` input file must produce `site.out/<name>.html`.
- Generated output must be identified as generated.
- The script must accept optional input and output directory arguments.
- When no arguments are given, the script must use `site.in/` and `site.out/` relative to the repository root.
- The script must be a POSIX shell script.

## Behavior

- Running the script recreates `site.out/` from `site.in/`.
- Re-running the script overwrites existing output deterministically.

## Dependencies

- None.
