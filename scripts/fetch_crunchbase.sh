#!/usr/bin/env bash
# fetch_crunchbase.sh — Fetch company profile from Crunchbase API
# Usage: bash fetch_crunchbase.sh "{company_name}" "{api_key}"
# Output: JSON to stdout with funding, valuation, employee count

set -euo pipefail

COMPANY="${1:?Usage: fetch_crunchbase.sh <company_name> <api_key>}"
API_KEY="${2:-${CRUNCHBASE_API_KEY:-}}"

if [ -z "$API_KEY" ]; then
  echo '{"error": "CRUNCHBASE_API_KEY not set. Skipping Crunchbase data."}' >&2
  exit 0
fi

# Normalize company name to slug (lowercase, hyphens)
SLUG=$(echo "$COMPANY" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')

BASE_URL="https://api.crunchbase.com/api/v4"

# Fetch organization profile
PROFILE=$(curl -sf "${BASE_URL}/entities/organizations/${SLUG}?card_ids=founders,funding_rounds,headquarters_address&user_key=${API_KEY}" 2>/dev/null || echo '{}')

# Extract key fields
if echo "$PROFILE" | jq -e '.properties' > /dev/null 2>&1; then
  jq '{
    name: .properties.identifier.value,
    short_description: .properties.short_description,
    founded_on: .properties.founded_on,
    num_employees_enum: .properties.num_employees_enum,
    total_funding_usd: .properties.funding_total.value_usd,
    last_funding_type: .properties.last_funding_type,
    ipo_status: .properties.ipo_status,
    website: .properties.website_url,
    headquarters: (.cards.headquarters_address // [] | first // {}),
    funding_rounds: [(.cards.funding_rounds // [] | .[] | {
      announced_on: .announced_on,
      funding_type: .funding_type,
      money_raised_usd: .money_raised.value_usd,
      lead_investors: [.lead_investor_identifiers[]?.value]
    })],
    fetched_at: (now | strftime("%Y-%m-%dT%H:%M:%SZ"))
  }' <<< "$PROFILE"
else
  echo "{\"error\": \"Company '${COMPANY}' not found on Crunchbase.\", \"slug_tried\": \"${SLUG}\"}" >&2
  echo '{}'
fi
