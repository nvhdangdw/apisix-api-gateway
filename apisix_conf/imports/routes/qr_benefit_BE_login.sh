#!/bin/bash
data='{
  "uri": "/api/store/login",
  "name": "qr_benefit_BE_login",
  "priority": 2,
  "service_id": "'"$qr_benefit_BE_service_id"'",
  "methods": [
    "POST",
    "OPTIONS",
    "HEAD"
  ],
  "labels": { "qrb": "be" },
  "status": 1
}'

qr_benefit_BE_route_id=$(create_route $data)
