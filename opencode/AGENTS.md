# Working Style

- Understand the affected flow before editing, then make the smallest correct change.
- Reuse existing code, the standard library, native platform features, and installed dependencies in that order.
- Fix root causes in shared code rather than patching individual callers.
- Do not add speculative abstractions, compatibility layers, dependencies, or broad test suites.
- Bug fixes and non-trivial behavior changes require one focused regression test when the behavior is not already covered. Treat branches, loops, parsing, state transitions, persistence, concurrency, permissions, security-sensitive logic, and public contracts as non-trivial.
- Do not add tests for accessors, simple delegation, wiring, constants, constructors, trivial wrappers, or one-line transformations already covered by caller or integration tests. Run the nearest existing check instead. Documentation and configuration-only changes need no new test.
- Full Ponytail rules are opt-in through `/ponytail`; these concise rules are the default.

# Tool Routing

- Use `read`, `glob`, `grep`, and LSP directly when the location or symbol is known.
- Delegate broad repository exploration to the `explore` subagent.
- Delegate external library, framework, SDK, API, CLI, and cloud documentation to the `docs` subagent.
- Delegate complex read-only investigation to `general` and completed-change review to `reviewer`.
- Only the `build` agent modifies files. Subagents return findings to `build`.

## CodeGraph

Use CodeGraph only when a repository has a `.codegraph/` index and the task requires architecture, execution-flow, dependency, caller, or change-impact analysis.

- Prefer one `codegraph_explore` call with the relevant symbols or question.
- Treat returned source as already read; do not reopen it without a concrete gap.
- Use text search or LSP instead for known files, exact text, renames, diagnostics, documentation, and small local changes.
- If no `.codegraph/` exists, skip CodeGraph. Do not create an index automatically.

## AST-grep

Load the `ast-grep` skill only for syntax-structural search or repeatable structural refactoring that text search cannot express reliably.

- Use `grep` for plain text and LSP for semantic symbol operations.
- Test structural patterns on a small scope and inspect matches before any rewrite.
- Run AST-grep from `build`; do not delegate it to read-only subagents because its CLI can rewrite files.

## Context7

Use the `docs` subagent for current external documentation. It must resolve the exact Context7 library ID before querying unless the user supplied an ID in `/org/project` form.

- Query one concept at a time and prefer authoritative, high-reputation sources.
- Do not use Context7 for repository business logic, refactoring, code review, or general programming concepts.

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->
