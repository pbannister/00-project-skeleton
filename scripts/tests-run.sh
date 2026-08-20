#!/bin/sh
#
# tests-run.sh: run every test in tests/ in order; stop at the first failure.
# Invoked by `npm test`, which the top-level Makefile calls via `make test`.
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)

for test_file in "$repo_root"/tests/*.sh; do
    echo "=== $(basename "$test_file")"
    sh "$test_file" || {
        echo "tests-run: FAILED: $(basename "$test_file")" >&2
        exit 1
    }
done

echo 'tests-run: all tests passed'
exit 0
