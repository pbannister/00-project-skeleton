#!/bin/sh
#
# Skeleton sanity test.
# Verifies that every required repository directory and canonical root file
# exists, as defined in prompts/03-conventions.md and README.md.
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

required_dirs='prompts sources scripts tests dataflow.in dataflow.out logs site.in site.out documents records'
required_files='README.md TODO.md Makefile'

for dir in $required_dirs; do
    if [ ! -d "$repo_root/$dir" ]; then
        echo "00-skeleton: missing required directory: $dir" >&2
        exit 1
    fi
done

for file in $required_files; do
    if [ ! -f "$repo_root/$file" ]; then
        echo "00-skeleton: missing required root file: $file" >&2
        exit 1
    fi
done

echo '00-skeleton: structure ok'
exit 0
