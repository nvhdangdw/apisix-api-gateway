#!/bin/bash
data='{
  "uri": "/sso-2/store/*",
  "name": "opencart_sso_2_store",
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
      "key": "opencart_sso_2_store"
    },
    "proxy-rewrite": {
      "regex_uri": [
        "/sso-2/store/(.*)",
        "/$1"
      ]
    }
  },
  "service_id": "'"$opencart_sso_service_id"'",
  "status": 1
}'

opencart_sso_2_store_route_id=$(create_route $data)
