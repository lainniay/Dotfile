---
description: Run a high-signal parallel review of local changes or a GitHub pull request
agent: review
---

Review the requested changes.

Scope: `$ARGUMENTS`

- With no arguments, review staged and unstaged changes.
- `--base <ref>` reviews `<ref>...HEAD`.
- `--pr [number-or-url]` reviews that pull request, or the current branch pull request when omitted.
- Add `--comment` to post the final PR report and `--force` to repeat or review a draft.

1. Capture one immutable diff, its changed paths, applicable `AGENTS.md` or `CLAUDE.md` instructions, and PR title and body when present. For a PR, use its full head SHA and inspect source with `git show <sha>:<path>` rather than the current worktree.
2. Run the configured heterogeneous review team and validation pass against that same target.
3. Reject style preferences, speculative concerns, pre-existing defects, linter-only findings, and generic test requests. Findings must identify a changed file and line, evidence, impact, severity, confidence, and the smallest correct fix.
4. Present confirmed findings first, ordered by severity, followed by a short scope summary. If none remain, say: `No issues found. Checked for correctness, regressions, security, repository instructions, and compatibility.`
5. Post only when both PR mode and `--comment` are active. Show the report first, then use `gh pr comment <number> --body-file - <<'OPENCODE_REVIEW'` with a single-quoted heredoc. Start the body with `<!-- opencode-code-review -->` and `## OpenCode review`, and link findings with the full head SHA. Never approve or request changes.
