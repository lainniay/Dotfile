---
name: ast-grep
description: Structural code search and refactoring
---

# ast-grep

ast-grep searches and transforms code based on AST structure rather than raw text.

## Decide Before Using

Ask:

> "Does this task require matching code structure rather than exact text?"

If no, use grep or another text-search tool.

## Use ast-grep When

* Searching for code with a specific syntax structure.
* Matching expressions regardless of variable names or formatting.
* Finding related code patterns across many files.
* Performing safe, repeatable structural replacements.
* Migrating framework APIs or deprecated syntax.
* Enforcing or auditing coding patterns.
* Refactoring patterns that cannot be reliably matched with text search.

Examples:

* Find calls to a function with a specific argument structure.
* Replace deprecated API calls across the repository.
* Find functions that contain a particular statement pattern.
* Detect unsafe or prohibited code constructs.

## Do Not Use ast-grep For

* Plain text, comments, documentation, or configuration lookup.
* Exact string or filename searches.
* Simple searches where grep is sufficient.
* Exact symbol definitions, references, or renames.
* Type-aware or semantic analysis.
* Compiler diagnostics.

Use:

* grep/search for text matching.
* LSP for symbol navigation, references, and renames.
* compiler or type-checker tools for semantic and type errors.

## Workflow

1. Confirm the target pattern is syntax-based.
2. Test the pattern on a small scope.
3. Review matches before applying changes.
4. Apply transformations only to intended files.
5. Run formatting, tests, and static analysis afterward.

## Safety

For large-scale rewrites:

* Avoid patterns that match overly broad syntax.
* Prefer the narrowest reliable AST pattern.
* Inspect representative matches before replacement.
* Verify the diff after transformation.
