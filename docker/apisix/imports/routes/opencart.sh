#!/bin/bash
data='{
  "uri": "/*",
  "name": "opencart",
  "methods": [
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH",
    "HEAD",
    "OPTIONS",
    "CONNECT",
    "TRACE"
  ],
  "plugins": {
    "authz-keycloak": {
      "audience": "apisix",
      "disable": false,
      "discovery": "http://'"$IP"':1010/auth/realms/apisix_test_realm/.well-known/openid-configuration",
      "permissions": [
        "opencart#scope_all"
      ]
    }
  },
  "service_id": "'"$opencart_service_id"'",
  "status": 1
}'
opencart_route_id=$(create_route $data)
