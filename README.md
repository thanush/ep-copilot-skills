# Copilot DevOps change-documentation standards

A **developer-level**, no-repository-change, documentation-only pilot for regulated environments using Bitbucket, Jenkins, and ServiceNow. It does not create PRs or CRs, query internal services, approve changes, run Jenkins builds, or close tasks.

## Contents

- `skills/pr-approval-pack/SKILL.md` — PR approval request using the exact Bitbucket and Jenkins console URLs.
- `skills/servicenow-cr-draft/SKILL.md` — draft CR fields after separately confirmed PR approval.
- `skills/change-closure-report/SKILL.md` — draft closure notes from observed execution and test evidence.
- `templates/change-input.example.yaml` — minimal sanitized input contract.
- `standards/REVIEW-CHECKLIST.md` — reviewer checklist.
- `install.sh` and `install.ps1` — install **personal** skills on a developer's workstation only.

## Install

Requires GitHub Copilot with Agent Skills support in VS Code (or a compatible Copilot host), plus client approval to use the Copilot assistant for the supplied data. No Bitbucket/Jenkins/ServiceNow integration or administrator access is required.

### macOS / Linux

From this extracted folder:

```bash
bash install.sh
```

### Windows PowerShell

From this extracted folder:

```powershell
.\install.ps1
```

Both scripts copy skill directories to `~/.copilot/skills/`. They **refuse to overwrite** existing skill directories; remove or rename prior versions after review, then reinstall. Nothing is written into a working code repository.

### Manual installation

Copy the three folders in `skills/` into `~/.copilot/skills/` (Windows: `$HOME\.copilot\skills\`).

In VS Code, open Copilot Chat (with a supported harness), type `/` and look for:

- `/pr-approval-pack`
- `/servicenow-cr-draft`
- `/change-closure-report`

If they do not appear, use **Chat: Open Customizations** > **Skills** to check discovery and enabled features, then reopen chat. Skills are manually invoked, not auto-loaded.

## Example

In chat, after selecting the slash command:

```text
/pr-approval-pack
Repository: example-infra
PR: https://bitbucket.example.org/projects/DEMO/repos/example-infra/pull-requests/42
Jenkins console: https://jenkins.example.org/job/example-infra-pr/101/console
CI status: SUCCESS (copied from Jenkins by engineer, not independently verified)
Commit SHA: a1b2c3d4
Change: Update nonproduction-compatible Terraform version pin for a production rollout
Reviewer: Change review group
```

The skill drafts a short approval message and explicitly flags missing evidence. It never pretends to have opened the links.

After PR approval, invoke `/servicenow-cr-draft` with verified details, the approved PR reference, implementation/test/backout plans, and the approved change window. After the deployment and actual tests, invoke `/change-closure-report` to draft audit-ready closing comments.

## Operating principles

1. **Human approval remains mandatory.** Copilot only drafts content.
2. **No evidence invention.** A URL alone proves neither approval nor build/test success.
3. **No sensitive logs.** Do not paste secrets, PII, client customer data, environment credentials, tokens, or full raw Jenkins logs into chat. Provide sanitized summaries only under your client's Copilot data-handling policy.
4. **Never modify core systems.** No writes, deployments, approvals, ticket submissions, or automated closures.
5. **One-task, one-prompt.** Skills are intentionally small and opt-in to minimize context usage.
6. **Recheck current state.** New commits, reruns, or invalidated approvals require a fresh evidence check.
7. **Approval requirements are client-defined.** Do not guess required approvers or change risk levels.
8. **Client platform terms matter.** Verify policy and licensing before sharing actual internal URLs or evidence with Copilot.

## Team distribution

Store this folder in an **approved internal, read-only, version-controlled standards location** (a repository distinct from production code, or a corporate file share). Review updates centrally. Each engineer installs a vetted version on their own machine. Personal home-folder skills are **not automatically synchronized across workstations** merely because the company has Copilot.

## Evaluation / 10-change pilot

Capture: minutes spent drafting PR message, minutes drafting CR, rework count, missing-field count, incorrect evidence claims, and estimated AI-credit usage. Compare with a manual baseline. Do not infer savings from invented time estimates.

## Scope

The pilot is not an enforcement control. Natural-language instructions cannot by themselves prevent tool calls; use enterprise policies, available read-only Chat/Ask modes, restrictive tool permissions, and ordinary human review to enforce boundaries.

## Product docs

- https://code.visualstudio.com/docs/agent-customization/agent-skills
- https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills
- https://docs.github.com/en/copilot/concepts/billing-and-usage/organizations-and-enterprises/budgets
