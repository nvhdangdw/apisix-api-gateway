#!/bin/bash
data='{
  "uri": "/auth",
  "name": "SELF_cookie_access_token_to_header_authorization",
  "plugins": {
    "serverless-pre-function": {
      "functions": [
        "return function (conf, ctx)\n    local core = require(\"apisix.core\");\n    local ck = require \"resty.cookie\";\n    local cookie, err = ck:new();\n\n    local token, err = cookie:get(\"access_token\");\n    core.response.set_header(\"Authorization\", \"Bearer \" .. token);\n    core.response.exit(200);\nend"
      ],
      "phase": "rewrite"
    }
  },
  "status": 1
}'

SELF_cookie_access_token_to_header_authorization_route_id=$(create_route $data)
