#!/bin/sh
#
# Skeleton sanity test.
# Verifies that every required repository directory and canonical root file
# exists, as defined in prompts/03-conventions.md and README.md.
set -eu

REPO_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

REQUIRED_DIRS='
prompts
sources
scripts
tests
dataflow.in
dataflow.out
logs
site.in
site.out
documents
records
'

REQUIRED_FILES='README.md TODO.md Makefile'

for dir in $REQUIRED_DIRS; do
    if [ ! -d "$REPO_ROOT/$dir" ]; then
        echo "00-skeleton: missing required directory: $dir" >&2
        exit 1
    fi
done

for file in $REQUIRED_FILES; do
    if [ ! -f "$REPO_ROOT/$file" ]; then
        echo "00-skeleton: missing required root file: $file" >&2
        exit 1
    fi
done

echo '00-skeleton: structure ok'
exit 0
