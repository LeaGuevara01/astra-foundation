---
name: astra-release
description: Prepare and verify an ASTRA staging deployment, version promotion or recovery within the user's authorized environment.
---

# astra-release

Input: Target environment, commit, operation and prior authorization.

Read the product operations runbook. Check target, clean commit and existing authorization. Run the deployment lock and build/test pipeline. Deploy synthetic staging and verify health, version and acceptance. Record image digest and backup/restore evidence. Prepare a concrete approval packet for main merge or production. Production promotion reuses the tested image. Restore data only to the explicitly selected target and preserve backups.

Output: Staging URL, commit/image identity, verification and recovery steps; clear approval boundary if required.

Acceptance example: A failed healthcheck restores the previous application image, while a database restore is a separate explicit operation.

Scope follows the user's current task. This skill does not authorize new external destinations, main merges, production, or unrelated changes.

