#!/bin/sh
#
APITOKEN="API_Token"
SKYLINEACCESS="https://console.cloud.vmware.com/csp/gateway/am/api/auth/api-tokens/authorize?grant_type=refresh_token"
SKYLINEAPI="https://skyline.vmware.com/public/api/data"

TOKEN=$(curl -s -X POST $SKYLINEACCESS \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode "refresh_token=$APITOKEN"| jq -r .access_token)

curl -s -X POST $SKYLINEAPI -H "Authorization: Bearer $TOKEN" -H 'Content-Type: application/json' -d '{"query": "
{
activeFindings(limit: 200) {
    findings {
      findingId
      accountId
      products
      findingDisplayName
      severity
      findingDescription
      findingImpact
      recommendations
      kbLinkURLs
      recommendationsVCF
      kbLinkURLsVCF
      categoryName
      findingTypes
      firstObserved
      totalAffectedObjectsCount
      }
    totalRecords
    timeTaken
    }
}
"}' | jq .
