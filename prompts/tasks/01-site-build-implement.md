# Task: Implement the Site Build feature

## TASK-DESCRIPTION
* Create `scripts/site-build.sh`.
The script generates `site.out/` from `site.in/`.
* Create `site.in/hello.txt` with example input content.
* Implement the requirements in `prompts/features/01-site-build.md` within the authorized files listed in `TASK-FILES`.

## TASK-OUTPUT
* Report the created files and the `make test` result.
* End with the `VERIFICATION:` line.

## TASK-CONTEXT
<note>
The authoritative requirements are `prompts/features/01-site-build.md`; the conventions are `prompts/03-conventions.md`. This task is the worked example for the project skeleton.
</note>

## TASK-FILES

| Operation | Path |
|---|---|
| create | `scripts/site-build.sh` |
| create | `site.in/hello.txt` |

## TASK-VERIFY
- Run: `make test` from the repository root.
- Expected: exit status 0.

OUTPUT: the created files and the `make test` result, ending with the `VERIFICATION:` line.
