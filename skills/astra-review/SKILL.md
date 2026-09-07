---
name: astra-review
description: Review an ASTRA implementation against its contract and evidence before staging or release.
---

# astra-review

Input: Task contract, base/head commits and available test evidence.

Read the task and final integrated diff. Independently inspect state-changing paths, role enforcement, migrations and failure modes relevant to this change. Run focused checks when evidence is missing. Cite actionable findings with file and line. Distinguish not tested from failed. Do not add unrelated hardening or gate reversible work without a concrete reason.

Output: Findings ordered by practical impact, or a concise review with validation limits.

Acceptance example: A concurrent inventory race is caught even when two sequential happy-path tests pass.

Scope follows the user's current task. This skill does not authorize new external destinations, main merges, production, or unrelated changes.

