#!/bin/bash
data='{
  "uri": "/*",
  "name": "qr_benefit_FE",
  "service_id": "'"$qr_benefit_FE_service_id"'",
  "labels": {
    "qrb": "fe"
  },
  "status": 1
}'

qr_benefit_FE_route_id=$(create_route $data)
