---
description: Add and run focused tests for existing changes without modifying production code
agent: build
---

Add tests for the requested changes without modifying production code.

Scope: `$ARGUMENTS`

- With no arguments, use staged and unstaged changes.
- `--base <ref>` uses `<ref>...HEAD`.
- Paths limit the scope to those files or directories.

1. Inspect the scoped diff, applicable repository instructions, test configuration, and nearby tests. Identify the observable behavior that changed and whether existing caller or integration tests already cover it.
2. Add or update a focused test only for an uncovered bug symptom or non-trivial behavior involving branches, loops, parsing, state transitions, persistence, concurrency, permissions, security-sensitive logic, or a public contract. Exercise public behavior and real production code; mock only unavoidable external boundaries.
3. Do not add tests for accessors, simple delegation, wiring, constants, constructors, trivial wrappers, or one-line transformations already covered by existing tests. Run the nearest existing check and report `No new test needed` instead.
4. Reuse the nearest existing test framework and conventions. Do not install a framework, add broad suites, introduce test-only production hooks, or pursue one-test-per-function coverage.
5. Run the narrowest relevant test command and read its complete output. Correct the test only when its expectation or setup is wrong; never weaken, skip, or blindly update it to pass.
6. Do not modify production code. If a valid test exposes a production defect, report the failure and stop.
7. Report tests changed, exact commands run, fresh results, pre-existing failures, and any behavior that lacks a practical automated test.
