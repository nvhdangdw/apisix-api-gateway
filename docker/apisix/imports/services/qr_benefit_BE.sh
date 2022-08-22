#!/bin/bash
data='{
    "name": "qr_benefit_BE",
    "upstream": {
      "nodes": [
        {
          "host": "'"$IP"'",
          "port": 8000,
          "weight": 1
        }
      ],
      "timeout": {
        "connect": 6,
        "send": 6,
        "read": 6
      },
      "type": "roundrobin",
      "scheme": "http",
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
        "service_name": "APISIX-IN-qr_benefit_BE"
      }
    },
    "hosts": [
      "qr-benefit.apisix.test"
    ]
}'

qr_benefit_BE_service_id=$(create_service $data)
