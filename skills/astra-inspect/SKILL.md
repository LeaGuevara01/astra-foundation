---
name: astra-inspect
description: Inspect an ASTRA project and its Windows development environment before planning a change.
---

# astra-inspect

Input: Current repository, task and environment.

Read the project contract and run its diagnostic without changing business data. Identify the real stack, Git HEAD, dirty work, migrations, test commands, required services and actual missing access. Read only relevant config keys; never print secrets.

Output: An evidence-backed current-state report with commands checked, blockers and next feasible action.

Acceptance example: An unavailable Docker daemon is reported as unavailable, without claiming the database was tested.

Scope follows the user's current task. This skill does not authorize new external destinations, main merges, production, or unrelated changes.

