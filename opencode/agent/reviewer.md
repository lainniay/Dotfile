---
description: Reviews completed changes for bugs, regressions, security risks, and missing tests
mode: subagent
model: deepseek/deepseek-v4-pro
variant: high
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  list: allow
  lsp: allow
  bash:
    "*": deny
    "gh pr diff*": allow
    "gh pr list*": allow
    "gh pr view*": allow
    "gh repo view*": allow
    "git blame*": allow
    "git cat-file*": allow
    "git diff*": allow
    "git log*": allow
    "git remote get-url*": allow
    "git rev-parse*": allow
    "git show*": allow
    "git status*": allow
---

Review the requested changes as a strict code reviewer.

Report concrete findings first, ordered by severity, with file and line references. Do not modify files.
