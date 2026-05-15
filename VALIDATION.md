# Validation

Run:

```bash
test -f README.md
test -f PUBLIC_BOUNDARY.md
test -f scripts/validate-public-boundary.sh
bash scripts/validate-public-boundary.sh
rg -n "planned|scaffolded|published|released|private/not-public|production automation|endpoints|hostnames|ports|credentials|private vaults|private logs|private topology|customer operations|live automation exports|production workflows|private repo paths|private telemetry|validation|review" .
git diff --check
git status --short
git remote -v
```

