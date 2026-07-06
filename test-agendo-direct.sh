#!/usr/bin/env bash
# Debug tool: check direct QSample <-> Agendo connectivity (no QCloud2 mirror involved).
#
# RestService.java uses Agendo in two distinct shapes:
#   1. Login: root URL + personal end-user credentials (AgendoAuthService.agendoAuth()).
#   2. Listing: /requests/facility/{id}/{from}/{to} + the service account credentials
#      (getAllRequests(), isAgendoOnline(), getRequestById()).
# A 403 on test 1 with the SERVICE account is expected: that endpoint only accepts
# personal accounts. Use test 1 with your own Agendo login, and test 2 with the
# service account, to check each path independently.
set -euo pipefail

AGENDO_BASE_URL="https://apieurope.agendoscience.com"
AGENDO_FACILITY="10"

echo "=== Test 1: login path (root URL, personal Agendo credentials) ==="
read -rp "Agendo username (personal): " LOGIN_USER
read -rsp "Agendo password (personal): " LOGIN_PASS
echo

curl -sS -o /tmp/agendo-login-response.json -w "HTTP status: %{http_code}\n" \
  -u "${LOGIN_USER}:${LOGIN_PASS}" \
  -H "From: Y3Jn" \
  "${AGENDO_BASE_URL}"

echo "Response:"
cat /tmp/agendo-login-response.json
echo
rm -f /tmp/agendo-login-response.json

echo
echo "=== Test 2: request-listing path (/requests/facility, service account credentials) ==="
read -rp "Agendo service account username [proteomics2@crg.eu]: " SVC_USER
SVC_USER=${SVC_USER:-proteomics2@crg.eu}
read -rsp "Agendo service account password: " SVC_PASS
echo

DATE_FROM=$(date -d "-3 months" +%F 2>/dev/null || date -v-3m +%F)
DATE_TO=$(date +%F)

curl -sS -o /tmp/agendo-list-response.json -w "HTTP status: %{http_code}\n" \
  -u "${SVC_USER}:${SVC_PASS}" \
  -H "From: Y3Jn" \
  "${AGENDO_BASE_URL}/requests/facility/${AGENDO_FACILITY}/${DATE_FROM}/${DATE_TO}"

echo "Response (first 500 chars):"
head -c 500 /tmp/agendo-list-response.json
echo
rm -f /tmp/agendo-list-response.json
