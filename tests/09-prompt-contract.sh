#!/bin/sh
#
# Prompt-contract test: validate the prompt corpus itself.
#
# Tier: tool-gated (python3). The prompts are the product, so their structural
# invariants are checked mechanically rather than trusted to prose:
#
#   * every literal path in the contract section 2 registry exists;
#   * every `prompts/...` path referenced anywhere resolves;
#   * feature and task numbers are unique;
#   * every task has TASK-DESCRIPTION and TASK-OUTPUT;
#   * every TASK-FILES path is repository-relative;
#   * every feature has Purpose, Requirements, Behavior, and Dependencies;
#   * PHASES.md has a parsable Current line with an allowed state;
#   * every universal rule file is listed in the section 2 registry.
set -eu

DIRECTORY_SCRIPT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPOSITORY_ROOT=$(CDPATH= cd -- "$DIRECTORY_SCRIPT/.." && pwd)

. "$DIRECTORY_SCRIPT/lib/test_helpers.sh"
skip_unless_tool python3

python3 - "$REPOSITORY_ROOT" <<'PY'
import glob
import os
import re
import sys

root = sys.argv[1]
failures = []


def read(rel):
    with open(os.path.join(root, rel), encoding="utf-8") as handle:
        return handle.read()


def exists(rel):
    return os.path.exists(os.path.join(root, rel))


prompt_files = []
for base, _dirs, names in os.walk(os.path.join(root, "prompts")):
    for name in names:
        if name.endswith(".md"):
            rel = os.path.relpath(os.path.join(base, name), root)
            prompt_files.append(rel)
prompt_files.sort()
texts = {rel: read(rel) for rel in prompt_files}

contract = texts.get("prompts/01-contract.md", "")
match = re.search(r"^## 2\..*?(?=^## 3\.)", contract, re.S | re.M)
if not match:
    failures.append("contract section 2 (authoritative rules) not found")
    section2 = ""
else:
    section2 = match.group(0)

# 1. Registry paths resolve.
for token in re.findall(r"`([^`]+)`", section2):
    if "*" in token or "<" in token or not ("/" in token or token.endswith(".md")):
        continue
    if not exists(token):
        failures.append(f"registry path does not exist: {token}")

# 2. Referenced prompt paths resolve.
for rel, text in texts.items():
    for token in re.findall(r"`(prompts/[A-Za-z0-9_./-]+)`", text):
        if "*" in token or "<" in token:
            continue
        if not exists(token.rstrip("/")):
            failures.append(f"{rel}: reference does not exist: {token}")

# 3. Numbering is unique.
for pattern, label in (("prompts/features/[0-9][0-9]-*.md", "feature"),
                       ("prompts/tasks/[0-9][0-9]-*.md", "task")):
    seen = {}
    for path in sorted(glob.glob(os.path.join(root, pattern))):
        base = os.path.basename(path)
        if base.startswith("00-"):
            continue
        seen.setdefault(base[:2], []).append(os.path.relpath(path, root))
    for number, paths in seen.items():
        if len(paths) > 1:
            failures.append(f"duplicate {label} number {number}: {paths}")

# 4. Tasks carry the required sections.
for path in sorted(glob.glob(os.path.join(root, "prompts/tasks/[0-9][0-9]-*.md"))):
    rel = os.path.relpath(path, root)
    if os.path.basename(rel).startswith("00-"):
        continue
    text = read(rel)
    for heading in ("## TASK-DESCRIPTION", "## TASK-OUTPUT"):
        if heading not in text:
            failures.append(f"{rel}: missing {heading}")

# 5. TASK-FILES paths are repository-relative.
for rel, text in texts.items():
    match = re.search(r"^## TASK-FILES\s*$(.*?)(?=^## |\Z)", text, re.S | re.M)
    if not match:
        continue
    for token in re.findall(r"`([^`]+)`", match.group(1)):
        if token.startswith("/") or ".." in token.split("/"):
            failures.append(f"{rel}: TASK-FILES path is not repository-relative: {token}")

# 6. Features carry the required sections.
for path in sorted(glob.glob(os.path.join(root, "prompts/features/[0-9][0-9]-*.md"))):
    rel = os.path.relpath(path, root)
    if os.path.basename(rel).startswith("00-"):
        continue
    text = read(rel)
    for heading in ("## Purpose", "## Requirements", "## Behavior", "## Dependencies"):
        if heading not in text:
            failures.append(f"{rel}: missing {heading}")

# 7. PHASES.md has a parsable current phase.
if not exists("PHASES.md"):
    failures.append("PHASES.md is missing")
else:
    match = re.search(r"^Current: phase (\d+) — (.+)$", read("PHASES.md"), re.M)
    if not match:
        failures.append("PHASES.md: no 'Current: phase N — ...' line")
    else:
        state = match.group(2).split("—")[-1].strip()
        if state not in ("not-started", "started", "complete"):
            failures.append(f"PHASES.md: invalid phase state: {state}")

# 8. Every universal rule file is in the registry.
universal = []
for pattern in ("prompts/common/*.md", "prompts/flavors/*.md",
                "prompts/how-to-write-*.md", "prompts/0[0-9]-*.md"):
    universal.extend(glob.glob(os.path.join(root, pattern)))
for path in sorted(universal):
    rel = os.path.relpath(path, root)
    if f"`{rel}`" not in section2 and f"`{os.path.dirname(rel)}/*.md`" not in section2:
        failures.append(f"not in the contract section 2 registry: {rel}")

if failures:
    for failure in failures:
        print(f"09-prompt-contract: {failure}", file=sys.stderr)
    sys.exit(1)

print("09-prompt-contract: ok")
PY

exit 0
