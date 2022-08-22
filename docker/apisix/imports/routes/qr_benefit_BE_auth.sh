#!/bin/bash
data='{
  "uri": "/api/*",
  "name": "qr_benefit_BE_auth",
  "priority": 1,
  "plugins": {
    "authz-keycloak": {
      "audience": "apisix",
      "disable": false,
      "discovery": "http://'"$IP"':1010/auth/realms/apisix_test_realm/.well-known/openid-configuration",
      "permissions": ["qr-benefit#scope_all"]
    },
    "csrf": { "disable": false, "key": "edd1c9f034335f136f87ad84b625c8f1" },
    "forward-auth": {
      "client_headers": [],
      "disable": false,
      "request_headers": ["Cookie"],
      "upstream_headers": ["Authorization"],
      "uri": "http://'"$IP"':9080/auth"
    }
  },
  "service_id": "'"$qr_benefit_BE_service_id"'",
  "labels": { "qrb": "be" },
  "status": 1
}'

qr_benefit_BE_auth_route_id=$(create_route $data)
