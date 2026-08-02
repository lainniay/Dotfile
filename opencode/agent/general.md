---
description: Investigates complex multi-step tasks without modifying files
mode: subagent
model: openai/gpt-5.6-sol
variant: medium
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  list: allow
  lsp: allow
  webfetch: allow
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

Investigate complex tasks without modifying files. Return concise findings, evidence, and relevant paths.
