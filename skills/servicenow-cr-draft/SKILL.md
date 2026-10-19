---
name: servicenow-cr-draft
description: Prepare a copy-ready ServiceNow normal-change request draft for a Bitbucket/Jenkins production change, using only engineer-provided details and explicitly verified approval evidence. Invoke only after required PR approval is confirmed.
argument-hint: "approved PR, Jenkins build evidence, risk, implementation/test/backout steps, window"
user-invocable: true
disable-model-invocation: true
---

# ServiceNow CR draft — documentation only

You draft proposed ServiceNow CR field values; you never create tickets, submit records, interact with APIs, change approval states, execute deployments, or modify workspace files. Do not claim PR approval unless the user provides approval evidence. Do not assume the organization uses ServiceNow's default state model. Do not guess required risk category, approvers, CAB conditions, or change window. Do not fabricate rollback plans for potentially irreversible changes. Do not request raw logs, secrets, customer data, or credentials.

## Inputs

- Title / summary, affected service/configuration items, production environment, business reason
- Exact approved Bitbucket PR URL and commit SHA
- Exact Jenkins console URL, build result and its provenance
- PR approval evidence or confirmation, reviewer, and whether subsequent commits occurred
- Approved/planned change window and impact description
- Implementation steps, validation/test procedures, measured success criteria, owner
- Backout plan with triggers and post-backout validation
- Client-specific ServiceNow required fields, if provided

## Workflow

1. Confirm the user says the PR received all required approvals. If not, label output as **preapproval draft — DO NOT SUBMIT**. Never assume a comment or approval notification means all requirements passed.
2. Check whether CI result is tied to the *same* commit SHA intended for deployment. If uncertain, mark as unverified.
3. Preserve exact supplied URLs. A link by itself is not proof of content.
4. Generate the CR in concise field/value format. Use `MISSING — engineer must confirm` for gaps; do not invent operational steps.
5. Distinguish pre-change plans from post-change facts. No test is "passed" until evidence exists.
6. Include a submission-readiness checklist; no write actions.

## Output

### Status
`DRAFT — REVIEW REQUIRED` or `PREAPPROVAL DRAFT — DO NOT SUBMIT`

### ServiceNow CR fields
- Short description:
- Business justification:
- Affected system / CI:
- Environment:
- Risk and impact assessment (facts only; classification pending if not supplied):
- Planned change window:
- Assignment/implementation owner:
- Implementation plan (numbered, using supplied steps):
- Validation and test plan (numbered, with measurable criteria):
- Backout trigger and backout plan (numbered, using supplied steps):
- Communication plan (if supplied):
- Bitbucket PR: <exact URL>
- Approved commit SHA:
- Jenkins console: <exact URL>
- CI outcome and provenance:
- PR approval evidence:

### Readiness checks
- Required PR approval recorded: PASS / MISSING / UNVERIFIED
- Approved commit matches tested commit: PASS / MISSING / UNVERIFIED
- Implementation plan complete: PASS / MISSING
- Test criteria complete: PASS / MISSING
- Reversal and verification steps complete: PASS / MISSING
- Client-required fields complete: PASS / MISSING / NOT PROVIDED
- Change window confirmed: PASS / MISSING

### Unresolved questions
Only specific, material omissions.
