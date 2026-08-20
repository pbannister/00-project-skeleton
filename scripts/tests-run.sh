#!/bin/sh
#
# tests-run.sh: run every test in tests/ in order; stop at the first failure.
# Invoked by `npm test`, which the top-level Makefile calls via `make test`.
set -eu

DIRECTORY_SCRIPT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPOSITORY_ROOT=$(CDPATH= cd -- "$DIRECTORY_SCRIPT/.." && pwd)

for file_test in "$REPOSITORY_ROOT"/tests/*.sh; do
    echo "=== $(basename "$file_test")"
    sh "$file_test" || {
        echo "tests-run: FAILED: $(basename "$file_test")" >&2
        exit 1
    }
done

echo 'tests-run: all tests passed'
exit 0
