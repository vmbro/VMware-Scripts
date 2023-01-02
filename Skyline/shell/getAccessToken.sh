curl -s -X POST https://console.cloud.vmware.com/csp/gateway/am/api/auth/api-tokens/authorize?grant_type=refresh_token \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode "refresh_token=Your_API_Token"| jq -r .access_token
