#!/bin/sh
#
# tests-run.sh: run every test in tests/ in order; stop at the first failure.
# Invoked by `npm test`, which the top-level Makefile calls via `make test`.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

for test_file in "$REPO_ROOT"/tests/*.sh; do
    echo "=== $(basename "$test_file")"
    sh "$test_file" || {
        echo "tests-run: FAILED: $(basename "$test_file")" >&2
        exit 1
    }
done

echo 'tests-run: all tests passed'
exit 0
