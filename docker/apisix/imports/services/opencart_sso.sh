#!/bin/bash
host_opencart_sso='101.0.121.46'
domain_opencart_sso='test.rewards-plus.com.au'

data='{
  "name": "opencart_sso",
  "upstream": {
    "nodes": [
      {
        "host": "'"$host_opencart_sso"'",
        "port": 443,
        "weight": 1
      }
    ],
    "timeout": {
      "connect": 6,
      "send": 6,
      "read": 6
    },
    "type": "roundrobin",
    "scheme": "https",
    "pass_host": "pass",
    "keepalive_pool": {
      "idle_timeout": 60,
      "requests": 1000,
      "size": 320
    }
  },
  "plugins": {
    "prometheus": {
      "disable": false
    },
    "zipkin": {
      "disable": false,
      "endpoint": "http://'"$IP"':9411/api/v2/spans",
      "sample_ratio": 1,
      "service_name": "APISIX-IN-opencart_sso"
    }
  },
  "hosts": [
    "'"$domain_opencart_sso"'"
  ]
}'

opencart_sso_service_id=$(create_service $data)
