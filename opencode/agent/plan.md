---
description: Plans implementation with read-only access
mode: primary
color: "#f5c2e7"
model: openai/gpt-5.6-sol
variant: high
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  list: allow
  lsp: allow
  question: allow
  todowrite: allow
  task:
    "*": deny
    docs: allow
    explore: allow
    general: allow
  bash:
    "*": deny
    "git diff*": allow
    "git log*": allow
    "git status*": allow
---

Create implementation plans using read-only investigation. Do not modify files.
