#!/usr/bin/env bash
set -u

missing=0

required_files=(
  "AGENTS.md"
  "README.md"
  "STATUS.md"
  "PUBLIC_BOUNDARY.md"
  "CLAIMS.md"
  "VALIDATION.md"
  "ARTIFACT_REGISTER.md"
  "REVIEW_LOG.md"
  "requirements.txt"
  "system-map/README.md"
  "system-map/synthetic-engineering-operating-system-map.md"
  "memory-patterns/README.md"
  "memory-patterns/obsidian-brain-boundary.md"
  "source-control-patterns/README.md"
  "source-control-patterns/forgejo-source-of-truth-boundary.md"
  "workflow-automation/README.md"
  "workflow-automation/n8n-workflow-boundary.md"
  "operator-dashboard-notes/README.md"
  "operator-dashboard-notes/mission-control-style-operator-dashboard-boundary.md"
  "private-mesh-concepts/README.md"
  "private-mesh-concepts/tailscale-private-mesh-public-boundary.md"
  "mirror-boundaries/README.md"
  "mirror-boundaries/github-mirror-publication-policy.md"
  "run-logs/README.md"
  "run-logs/sanitized-run-log-template.md"
  "automation-exports/README.md"
  "automation-exports/synthetic-automation-export-review.md"
  "workflow-review-loops/README.md"
  "workflow-review-loops/synthetic-workflow-review-loop.md"
  "diagrams/README.md"
  "diagrams/automation-review-loop.mmd"
  "scripts/validate-public-boundary.sh"
  "templates/automation-run-record-template.md"
  "templates/mirror-review-template.md"
)

for file in "${required_files[@]}"; do
  if [ -f "$file" ]; then
    printf "PASS %s\n" "$file"
  else
    printf "FAIL %s\n" "$file"
    missing=$((missing + 1))
  fi
done

required_terms=(
  "planned"
  "scaffolded"
  "published"
  "released"
  "private/not-public"
  "production automation"
  "endpoints"
  "hostnames"
  "ports"
  "credentials"
  "private vaults"
  "private logs"
  "private topology"
  "customer operations"
  "live automation exports"
  "production workflows"
  "private repo paths"
  "private telemetry"
  "validation"
  "review"
)

for term in "${required_terms[@]}"; do
  if rg -q "$term" .; then
    printf "PASS term: %s\n" "$term"
  else
    printf "FAIL term: %s\n" "$term"
    missing=$((missing + 1))
  fi
done

blocked_files="$(find . -path ./.git -prune -o \( -iname '*.key' -o -iname '*.pem' -o -iname '*.env' -o -iname '*.log' -o -iname '*.json' \) -print)"
if [ -z "$blocked_files" ]; then
  printf "PASS blocked artifact scan\n"
else
  printf "FAIL blocked artifact scan\n%s\n" "$blocked_files"
  missing=$((missing + 1))
fi

if [ "$missing" -eq 0 ]; then
  printf "Result: PASS - automated engineering systems public boundary scaffold is complete.\n"
else
  printf "Result: FAIL - %s required checks failed.\n" "$missing"
fi

exit "$missing"

