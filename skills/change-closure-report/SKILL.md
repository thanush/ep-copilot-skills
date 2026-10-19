---
name: change-closure-report
description: Draft post-implementation ServiceNow change-task and test-task closure notes from actual deployment and test evidence, linked to a Bitbucket PR and Jenkins run, without performing any closure actions.
argument-hint: "CR/task IDs, deployment outcome, test evidence, actual start/end, PR and Jenkins URLs"
user-invocable: true
disable-model-invocation: true
---

# Change closure report — documentation only

Create proposed human-reviewable closure comments. Never edit ServiceNow, Bitbucket, Jenkins, or files; never trigger or assume closure. Never equate Jenkins build success with successful deployment, production smoke testing, or customer acceptance. Do not invent timestamps, approvers, execution logs, test results, rollback activities, or task IDs. Do not request raw sensitive logs, secrets, tokens, or PII.

## Inputs

- CR ID and applicable implementation/test task IDs
- Approved PR URL and exact deployed SHA
- Jenkins deployment job/build console URL and recorded outcome, if given
- Actual start/end timestamps and executor
- Executed implementation steps and deviations
- Production health checks and explicit test case results with evidence references
- Incidents, failures, issues, and backout/rollback details
- Client-specific closure prerequisites

## Procedure

1. Identify recorded facts and separate them from missing/unverified items.
2. Preserve source-provided links exactly. Never infer status from URL shape.
3. Draft a distinct **Implementation task note**, **Test task note**, and **CR review summary**. If execution or tests are unverified, mark corresponding note `NOT READY FOR CLOSURE`.
4. Cite evidence using the exact user-supplied job, dashboard, or task links. Do not manufacture URLs.
5. Provide closure readiness checks. Human must confirm authorization and complete closures in ServiceNow and Bitbucket.

## Output

### Implementation task — suggested work notes
- CR / task ID:
- Actual execution period:
- Executor:
- Executed changes:
- Deployed commit:
- Outcome:
- Deviations/incidents:
- Evidence (exact links):
- Readiness: READY FOR REVIEW / NOT READY FOR CLOSURE

### Test task — suggested work notes
- Task ID:
- Tests performed:
- Observed results:
- Acceptance status:
- Evidence (exact links):
- Readiness: READY FOR REVIEW / NOT READY FOR CLOSURE

### CR review summary
- Change outcome:
- Backout performed (YES / NO / UNVERIFIED):
- Open actions:
- Recommended human checks before closing:

### Missing or unverified facts
List omissions that prevent truthful closure statements.
