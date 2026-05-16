# Local Lab Automation Boundary

Status: scaffolded
Publication state: public scaffold
Release state: not released

## Purpose

This boundary keeps automation documentation public-safe by treating local lab automation as synthetic workflow design, not live operation.

## Public-Safe Scope

Allowed material:

- synthetic task intake examples;
- review states such as planned, scaffolded, reviewed, and held;
- generic automation boundary categories;
- human review checkpoints;
- non-production workflow diagrams or templates.

## Held Out

Do not include live automation exports, production workflows, endpoints, ports, hostnames, credentials, private URLs, tokens, private repo paths, private logs, private topology, customer operations, private telemetry, deployment claims, production-readiness claims, or proof-completion claims.

## Rule

Public automation docs must describe reviewable workflow structure only. They must not describe or imply a live automation lane operating on real systems.
