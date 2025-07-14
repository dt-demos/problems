#!/bin/bash

# Reference
# https://www.dynatrace.com/support/help/dynatrace-api/environment-api/events-v2/post-event

# this will set DT_BASEURL & DT_API_TOKEN environment variables
source .env

EVENT_TYPE=$1
ENTITY_SELECTOR=$2
TITLE="Test Problem - $(date)"

# example entity selector values
# type(SERVICE),tag(keptn_project:casdemo,keptn_service:casdemoapp,keptn_stage:production)
# type(SERVICE),entityName.equals(BookingService)
# type(HOST),fromRelationship.isInstanceOf(type(HOST_GROUP),entityName(cloud-burst-hosts))
# type(PROCESS_GROUP_INSTANCE),tag([Environment]DT_RELEASE_PRODUCT:open-feature-demo)

# event types that will open a problem
# AVAILABILITY_EVENT
# CUSTOM_ALERT
# ERROR_EVENT
# PERFORMANCE_EVENT
# RESOURCE_CONTENTION_EVENT

# other information event types
# CUSTOM_ANNOTATION
# CUSTOM_CONFIGURATION
# CUSTOM_DEPLOYMENT
# CUSTOM_INFO
# MARKED_FOR_TERMINATION

PAYLOAD='
{
  "title": "'$TITLE'",
  "eventType": "'$EVENT_TYPE'",
  "entitySelector": "'$ENTITY_SELECTOR'",
  "properties":{
    "Triggered by": "Demo Script"
  }
}
'
echo "=============================================================="
echo "SENDING THE FOLLOWING HTTP PAYLOAD TO "
echo "  $DT_BASEURL/api/v2/events/ingest"
echo "=============================================================="
echo $PAYLOAD
echo "=============================================================="
curl -X POST \
          "$DT_BASEURL/api/v2/events/ingest" \
          -H 'accept: application/json; charset=utf-8' \
          -H "Authorization: Api-Token $DT_API_TOKEN" \
          -H 'Content-Type: application/json; charset=utf-8' \
          -d "$PAYLOAD"

echo "API RESPONSE:"
echo "=============================================================="
echo ""
