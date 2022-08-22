#!/bin/bash
data='{
  "uri": "/sso-1/*",
  "name": "opencart_sso_1",
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
    "key-auth": {
      "disable": false,
      "key": "opencart_sso_1"
    },
    "proxy-rewrite": {
      "regex_uri": [
        "/sso-1/(.*)",
        "/$1"
      ]
    }
  },
  "service_id": "'"$opencart_sso_service_id"'",
  "status": 1
}'

opencart_sso_1_route_id=$(create_route $data)
