#!/bin/bash
data='{
  "uri": "/*",
  "name": "opencart_sso",
  "plugins": {
    "proxy-rewrite": {
      "scheme": "https"
    }
  },
  "service_id": "'"$opencart_sso_service_id"'",
  "status": 1
}'

opencart_sso_route_id=$(create_route $data)
