---
description: Add focused tests, debug failures, and fix the changed behavior
agent: build
---

Test and debug the requested changes.

Scope: `$ARGUMENTS`

- With no arguments, use staged and unstaged changes.
- `--base <ref>` uses `<ref>...HEAD`.
- Paths limit the scope to those files or directories.

Follow this loop:

1. **Inspect.** Read the scoped diff, applicable repository instructions, test configuration, and nearby tests. Identify the observable behavior that changed and use the nearest existing test framework and conventions.
2. **Cover.** Add or update the smallest focused test for each distinct changed behavior or bug symptom. Exercise public behavior and real production code; mock only unavoidable external boundaries. Do not install a framework, add broad suites, or create production hooks solely for testing.
3. **Run.** Execute the narrowest relevant test command and read its complete output. Do not claim test-first development for code that already existed before this command.
4. **Debug.** Classify each failure before editing:
   - Fix the test when its expectation or setup is wrong.
   - Trace and fix the production root cause when behavior is wrong.
   - Do not modify unrelated code for environment failures or pre-existing failures; report them separately.
   Never delete, skip, weaken, or blindly update a test merely to make it pass.
5. **Iterate.** Re-run the same focused test after each fix until it passes. If two attempts produce the same failure without new evidence, stop, summarize what was tried, and ask the user rather than guessing.
6. **Verify.** Run the nearest relevant module or component suite. When tests alone do not prove the user-visible behavior, run one practical check through the real CLI, API, UI, or public entry point.
7. **Report.** List tests and production files changed, exact commands run, fresh pass/fail results, pre-existing failures, and any remaining uncertainty. Do not commit or push unless explicitly requested.
