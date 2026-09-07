---
name: astra-implement
description: Implement a bounded ASTRA task in its assigned worktree and verify the result.
---

# astra-implement

Input: Task contract, repository, assigned worktree and ownership.

Check the assigned branch, base SHA and file ownership. Use project setup commands with isolated data and ports. Keep business rules in their authoritative module. Implement the task, run meaningful tests and inspect the final diff. Coordinate shared contracts with the integrator. Commit only intended tracked changes; do not merge main.

Output: Commit, implementation explanation, executed checks, remaining concerns and handoff.

Acceptance example: Two tasks can run in parallel using separate data stores; retrying stock consumption does not consume twice.

Scope follows the user's current task. This skill does not authorize new external destinations, main merges, production, or unrelated changes.

