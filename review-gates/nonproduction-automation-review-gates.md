# Nonproduction Automation Review Gates

Status: scaffolded
Publication state: public scaffold
Release state: not released

## Purpose

These gates prevent public automation examples from being mistaken for live or production workflows.

## Gate Table

| Gate | Pass condition |
| --- | --- |
| Synthetic input gate | Inputs are placeholders or reviewed public-safe examples. |
| Human authority gate | A human remains responsible for review and approval decisions. |
| Tool boundary gate | No private tools, credentials, endpoints, tokens, or private source paths are exposed. |
| Execution-status gate | The artifact says `scaffolded` or `not released`; it does not claim deployment. |
| Output-status gate | Outputs are templates or review notes, not proof of completed production work. |

## Escalation

If an automation note includes live execution details, production workflow language, private logs, or customer operations, hold it out of public migration and route it to privacy review.
