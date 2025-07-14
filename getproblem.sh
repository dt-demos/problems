#!/bin/bash

# Reference
# https://docs.dynatrace.com/docs/discover-dynatrace/references/dynatrace-api/environment-api/problems-v2/problems/get-problem-details

# this will set DT_BASEURL & DT_API_TOKEN environment variables
source .env

# inputs to script
# DT_PROBLEM_ID example: -7079974447799175602_1752266005311V2
DT_PROBLEM_ID=$1

curl -X GET \
          "$DT_BASEURL/api/v2/problems/$DT_PROBLEM_ID?evidenceDetails,impactAnalysis,recentComments" \
          -H 'accept: application/json; charset=utf-8' \
          -H "Authorization: Api-Token $DT_API_TOKEN" \
          -H 'Content-Type: application/json; charset=utf-8' \
          -d "$PAYLOAD"
