# Regulated Change Documentation — Reviewer Checklist

Use this checklist for outputs from any of the three skills.

## Evidence
- [ ] Both Bitbucket PR and Jenkins console URLs are exact and point to intended records.
- [ ] Current PR head commit matches CI build commit; downstream deployment uses the approved SHA.
- [ ] Jenkins SUCCESS is reported from verified or explicitly attributed evidence; no inferred test result.
- [ ] Required PR reviewers and latest approvals satisfy client policy; no new commits invalidated them.
- [ ] Change and task IDs are accurate, when present.

## ServiceNow
- [ ] Actual change type/risk classification follows client ServiceNow policy.
- [ ] Implementation steps are executable, approved, and ordered.
- [ ] Test/validation plan names measurable checks.
- [ ] Backout plan has realistic triggers and restoration verification.
- [ ] Required change window, owners, CI/configuration items, and communications are present.
- [ ] No deployment is allowed merely because Copilot generated a CR draft.

## Closure
- [ ] Deployment outcome evidenced independently of earlier PR CI result.
- [ ] Test results reflect tests performed after implementation.
- [ ] Incident, deviation, failed checks and rollback (if any) accurately documented.
- [ ] Only the authorized human/system performs workflow closure.

## Security and budget
- [ ] No customer data, credentials, tokens, raw confidential logs, or unapproved data enter Copilot chat.
- [ ] No tool action was run to fetch private links or modify client systems.
- [ ] A single task-specific skill was invoked and the input was concise.
