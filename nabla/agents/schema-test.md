---
description: Minimal test agent for outputSchema validation
model: deepseek/deepseek-v4-flash
tools: [read, grep, find, ls, bash]
outputSchema:
  type: object
  properties:
    status:
      type: string
      enum: [completed, failed]
    summary:
      type: string
    evidence:
      type: array
      items:
        type: string
  required: [status, summary]
---

Read the target file(s), then finish by calling `submit_result` with a
non-empty `text` and a `structured` value matching the schema above
(status, summary, optional evidence).
