#!/bin/sh
#
# skeleton-diff.sh: report how a derived project's shared files differ from
# this skeleton.
#
# A project derived from the skeleton keeps its own copy of the shared rule
# files, and those copies drift as the skeleton evolves. Run this from the
# skeleton against a project:
#
#     sh scripts/skeleton-diff.sh ~/work/<project>
#
# Rule-file drift (the prompts tree and the directory READMEs) is a failure:
# the project's stated rules disagree with the skeleton's current rules. Drift
# in the reference scripts and template is reported as informational, because a
# project is expected to adapt them.
#
# A project is meant to customize a shared rule document by appending a project
# section, never by forking the shared text; see prompts/03-conventions.md 5.
set -eu

DIRECTORY_SCRIPT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SKELETON_ROOT=$(CDPATH= cd -- "${2:-"$DIRECTORY_SCRIPT/.."}" && pwd)
PROJECT_ROOT=${1:-}

if [ -z "$PROJECT_ROOT" ]; then
    echo 'skeleton-diff: usage: skeleton-diff.sh PROJECT_DIR [SKELETON_DIR]' >&2
    exit 2
fi

if [ ! -d "$PROJECT_ROOT" ]; then
    echo "skeleton-diff: project directory not found: $PROJECT_ROOT" >&2
    exit 2
fi

# Rule files: drift is a failure. The list is canonical for this skeleton.
FILES_RULES='
prompts/01-contract.md
prompts/02-workflow.md
prompts/03-conventions.md
prompts/README.md
prompts/common/00-overview.md
prompts/common/01-requirements.md
prompts/common/02-universal-rules.md
prompts/common/03-glossary.md
prompts/flavors/01-semantic-sort-naming.md
prompts/flavors/02-cpp-conventions.md
prompts/how-to-write-tasks.md
prompts/how-to-write-features.md
prompts/how-to-write-episodes.md
prompts/how-to-write-research.md
prompts/episodes/00-episodes.md
prompts/episodes/01-episode-template.md
prompts/episodes/02-episode-plan.md
records/README.md
documents/README.md
tests/README.md
'

# Reference artifacts: drift is informational; a project adapts these.
FILES_TEMPLATE='
scripts/site-build.sh
scripts/site-condense.sh
scripts/tests-run.sh
tests/00-skeleton.sh
site.in/template.html
'

count_drift=0
count_missing=0
count_template=0

report_group() {
    mode=$1
    shift
    for rel in "$@"; do
        file_skeleton="$SKELETON_ROOT/$rel"
        file_project="$PROJECT_ROOT/$rel"
        if [ ! -f "$file_project" ]; then
            echo "skeleton-diff: missing in project: $rel"
            count_missing=$((count_missing + 1))
            continue
        fi
        if [ ! -f "$file_skeleton" ]; then
            echo "skeleton-diff: not in this skeleton: $rel"
            continue
        fi
        if ! diff -q "$file_skeleton" "$file_project" >/dev/null 2>&1; then
            if [ "$mode" = 'rule' ]; then
                echo "skeleton-diff: drift: $rel"
                count_drift=$((count_drift + 1))
            else
                echo "skeleton-diff: adapted (informational): $rel"
                count_template=$((count_template + 1))
            fi
        fi
    done
}

report_group rule $FILES_RULES
report_group template $FILES_TEMPLATE

echo "skeleton-diff: $count_drift rule file(s) drifted, $count_missing missing, $count_template reference artifact(s) adapted"

if [ "$count_drift" -ne 0 ] || [ "$count_missing" -ne 0 ]; then
    echo 'skeleton-diff: shared rule files differ; update them, and append a project section instead of forking shared text (conventions 5).' >&2
    exit 1
fi

exit 0
