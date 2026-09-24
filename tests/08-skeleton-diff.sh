#!/bin/sh
#
# Skeleton-drift test (scripts/skeleton-diff.sh).
#
# Tier: portable. Compares the skeleton against itself (clean), against a copy
# with one shared rule file changed (fatal drift), and against a copy with only
# the reference site script changed (informational adaptation).
set -eu

DIRECTORY_SCRIPT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPOSITORY_ROOT=$(CDPATH= cd -- "$DIRECTORY_SCRIPT/.." && pwd)
SCRIPT_DIFF="$REPOSITORY_ROOT/scripts/skeleton-diff.sh"

DIRECTORY_TEST=$(mktemp -d)
trap 'rm -rf "$DIRECTORY_TEST"' EXIT HUP INT TERM

fail() {
    echo "08-skeleton-diff: $1" >&2
    exit 1
}

# The skeleton against itself has no drift.
if ! output_clean=$(sh "$SCRIPT_DIFF" "$REPOSITORY_ROOT" 2>&1); then
    fail "the skeleton reported drift against itself: $output_clean"
fi

# A copy of the skeleton is the project under test.
DIRECTORY_PROJECT="$DIRECTORY_TEST/project"
mkdir -p "$DIRECTORY_PROJECT"
(cd "$REPOSITORY_ROOT" && tar --exclude=./.git --exclude=./site.out \
    --exclude=./dataflow.out --exclude=./logs -cf - .) \
    | (cd "$DIRECTORY_PROJECT" && tar -xf -)

# A changed rule file is fatal drift.
printf '%s\n' 'locally forked rule' >> "$DIRECTORY_PROJECT/prompts/02-workflow.md"
if output_drift=$(sh "$SCRIPT_DIFF" "$DIRECTORY_PROJECT" 2>&1); then
    fail 'a changed rule file was accepted'
fi
printf '%s\n' "$output_drift" | grep -q 'drift: prompts/02-workflow.md' \
    || fail 'the drifted rule file was not named'

# Restore the rule file; a changed reference script is informational only.
cp "$REPOSITORY_ROOT/prompts/02-workflow.md" "$DIRECTORY_PROJECT/prompts/02-workflow.md"
printf '%s\n' '# local adaptation' >> "$DIRECTORY_PROJECT/scripts/site-build.sh"
if ! output_adapted=$(sh "$SCRIPT_DIFF" "$DIRECTORY_PROJECT" 2>&1); then
    fail 'a reference-script adaptation was treated as fatal'
fi
printf '%s\n' "$output_adapted" | grep -q 'informational' \
    || fail 'the adapted reference script was not reported'

echo '08-skeleton-diff: ok'
exit 0
