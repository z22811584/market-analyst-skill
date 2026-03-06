#!/usr/bin/env bash
# fetch_similarweb.sh — Fetch website traffic data from SimilarWeb API
# Usage: bash fetch_similarweb.sh "{domain}" "{api_key}"
# Output: JSON to stdout with monthly visits, traffic sources, geo distribution

set -euo pipefail

DOMAIN="${1:?Usage: fetch_similarweb.sh <domain> <api_key>}"
API_KEY="${2:-${SIMILARWEB_API_KEY:-}}"

if [ -z "$API_KEY" ]; then
  echo '{"error": "SIMILARWEB_API_KEY not set. Skipping SimilarWeb data."}' >&2
  exit 0
fi

BASE_URL="https://api.similarweb.com/v1/website/${DOMAIN}"

# Fetch total visits (last 3 months)
VISITS=$(curl -sf "${BASE_URL}/total-traffic-and-engagement/visits?api_key=${API_KEY}&start_date=$(date -v-3m +%Y-%m 2>/dev/null || date -d '3 months ago' +%Y-%m)&end_date=$(date +%Y-%m)&country=world&granularity=monthly&main_domain_only=false" 2>/dev/null || echo '{"visits":[]}')

# Fetch traffic sources
SOURCES=$(curl -sf "${BASE_URL}/traffic-sources/overview?api_key=${API_KEY}&start_date=$(date -v-1m +%Y-%m 2>/dev/null || date -d '1 month ago' +%Y-%m)&end_date=$(date +%Y-%m)&country=world&main_domain_only=false" 2>/dev/null || echo '{"overview":[]}')

# Fetch geography
GEO=$(curl -sf "${BASE_URL}/geo/traffic-by-country?api_key=${API_KEY}&start_date=$(date -v-1m +%Y-%m 2>/dev/null || date -d '1 month ago' +%Y-%m)&end_date=$(date +%Y-%m)&main_domain_only=false" 2>/dev/null || echo '{"records":[]}')

# Combine into single JSON output
jq -n \
  --arg domain "$DOMAIN" \
  --argjson visits "$VISITS" \
  --argjson sources "$SOURCES" \
  --argjson geo "$GEO" \
  '{
    domain: $domain,
    visits: $visits,
    traffic_sources: $sources,
    geography: $geo,
    fetched_at: (now | strftime("%Y-%m-%dT%H:%M:%SZ"))
  }'
