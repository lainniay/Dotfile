---
name: codegraph
description: Use CodeGraph for repository architecture exploration, dependency tracing, execution flow analysis, and change impact analysis.
---

# CodeGraph

CodeGraph analyzes relationships between repository components.

Use it when understanding dependencies or flows is the main challenge.
Do not use it as a replacement for LSP or text search.

---

# Decide Before Using

Ask:

> "Do I need to understand relationships between multiple components?"

If no, do not use CodeGraph.

## Do not use CodeGraph for

- Small/local changes with obvious code locations.
- Single-file modifications.
- Known symbol edits.
- Simple bug fixes with a clear execution path.
- Documentation, formatting, or configuration changes.
- Exact symbol lookup, rename, type information, compiler issues.
- Text or filename search.

Use:

- LSP for symbol-level operations.
- Search tools for text lookup.

---

# Use CodeGraph When

- Entering an unfamiliar repository.
- Understanding architecture.
- Tracing request or execution flows.
- Finding callers or callees.
- Understanding dependencies between modules.
- Estimating change impact.
- Modifying core services, shared libraries, APIs, or data pipelines.

Examples:

- "How does this request flow work?"
- "Who calls this service?"
- "What breaks if I change this component?"

---

# Workflow

When CodeGraph is needed:

1. Explore the graph first.
2. Identify relevant components and relationships.
3. Read only necessary source files.
4. Use LSP/search for precise code changes.

---

# Commands

## codegraph_explore

Use for:

- architecture discovery
- subsystem understanding
- feature flow analysis

## codegraph_callers

Use for:

- finding upstream callers
- tracing entry paths

## codegraph_callees

Use for:

- finding downstream dependencies
- understanding execution paths

## codegraph_impact

Use for:

- blast radius analysis
- affected component discovery

---

# Expected Output

After using CodeGraph, summarize:

- Relevant components.
- Important relationships.
- Execution/dependency flow.
- Files to inspect next.
- Potential impact.
