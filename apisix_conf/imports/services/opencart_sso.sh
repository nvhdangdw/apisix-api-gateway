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
    "tls": {
      "client_cert": "-----BEGIN CERTIFICATE-----\nMIIFFjCCAv6gAwIBAgIRAJErCErPDBinU/bWLiWnX1owDQYJKoZIhvcNAQELBQAwTzELMAkGA1UE\nBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2VhcmNoIEdyb3VwMRUwEwYDVQQD\nEwxJU1JHIFJvb3QgWDEwHhcNMjAwOTA0MDAwMDAwWhcNMjUwOTE1MTYwMDAwWjAyMQswCQYDVQQG\nEwJVUzEWMBQGA1UEChMNTGV0J3MgRW5jcnlwdDELMAkGA1UEAxMCUjMwggEiMA0GCSqGSIb3DQEB\nAQUAA4IBDwAwggEKAoIBAQC7AhUozPaglNMPEuyNVZLD+ILxmaZ6QoinXSaqtSu5xUyxr45r+XXI\no9cPR5QUVTVXjJ6oojkZ9YI8QqlObvU7wy7bjcCwXPNZOOftz2nwWgsbvsCUJCWH+jdxsxPnHKzh\nm+/b5DtFUkWWqcFTzjTIUu61ru2P3mBw4qVUq7ZtDpelQDRrK9O8ZutmNHz6a4uPVymZ+DAXXbpy\nb/uBxa3Shlg9F8fnCbvxK/eG3MHacV3URuPMrSXBiLxgZ3Vms/EY96Jc5lP/Ooi2R6X/ExjqmAl3\nP51T+c8B5fWmcBcUr2Ok/5mzk53cU6cG/kiFHaFpriV1uxPMUgP17VGhi9sVAgMBAAGjggEIMIIB\nBDAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMBMBIGA1UdEwEB\n/wQIMAYBAf8CAQAwHQYDVR0OBBYEFBQusxe3WFbLrlAJQOYfr52LFMLGMB8GA1UdIwQYMBaAFHm0\nWeZ7tuXkAXOACIjIGlj26ZtuMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcwAoYWaHR0cDovL3gx\nLmkubGVuY3Iub3JnLzAnBgNVHR8EIDAeMBygGqAYhhZodHRwOi8veDEuYy5sZW5jci5vcmcvMCIG\nA1UdIAQbMBkwCAYGZ4EMAQIBMA0GCysGAQQBgt8TAQEBMA0GCSqGSIb3DQEBCwUAA4ICAQCFyk5H\nPqP3hUSFvNVneLKYY611TR6WPTNlclQtgaDqw+34IL9fzLdwALduO/ZelN7kIJ+m74uyA+eitRY8\nkc607TkC53wlikfmZW4/RvTZ8M6UK+5UzhK8jCdLuMGYL6KvzXGRSgi3yLgjewQtCPkIVz6D2QQz\nCkcheAmCJ8MqyJu5zlzyZMjAvnnAT45tRAxekrsu94sQ4egdRCnbWSDtY7kh+BImlJNXoB1lBMEK\nIq4QDUOXoRgffuDghje1WrG9ML+Hbisq/yFOGwXD9RiX8F6sw6W4avAuvDszue5L3sz85K+EC4Y/\nwFVDNvZo4TYXao6Z0f+lQKc0t8DQYzk1OXVu8rp2yJMC6alLbBfODALZvYH7n7do1AZls4I9d1P4\njnkDrQoxB3UqQ9hVl3LEKQ73xF1OyK5GhDDX8oVfGKF5u+decIsH4YaTw7mP3GFxJSqv3+0lUFJo\ni5Lc5da149p90IdshCExroL1+7mryIkXPeFM5TgO9r0rvZaBFOvV2z0gp35Z0+L4WPlbuEjN/lxP\nFin+HlUjr8gRsI3qfJOQFy/9rKIJR0Y/8Omwt/8oTWgy1mdeHmmjk7j1nYsvC9JSQ6ZvMldlTTKB\n3zhThV1+XWYp6rjd5JW1zbVWEkLNxE7GJThEUG3szgBVGP7pSWTUTsqXnLRbwHOoq7hHwg==\n-----END CERTIFICATE-----",
      "client_key": "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA3IAMSbKLaWGK4nPc33NIchJh8ScDuncfXJjUTd2km2hWi7Qy\nCtMTP0VD6m8/fMSkM/SENPGud06qSZc1DYzn4qutL/GWCRWCvK3XP6tzk9/hNLdb\nmlsvFcBbiGPJckXF+Q8SKibHqC636VbMjqysFv7noqHEy+uZpdwyw89RaBYlCwzj\nkK0923LuihTaigBDx3NShJtYMkl4gwPzgQU0lVNiXDaYfbj37j6GZE1ZWtCUKU3E\noKJ4/GRr/rE0n7rm37rD1yHkTGjjXyICn0EsBeFfvZgvRXSWkhei2esqJDenpoG9\nczYAE+T2sCwok/Ttup9DNc9Q82VeKmbEukRRzwIDAQABAoIBAADVmzZMLqrfa58f\nwR43WXbVCvnWo/T4rm2zRlplFFJiOrGcpPPViKUcpf0lHqBiPhzUOAvbPkXFTm+o\n2tKKTfZVn/omd+Lg6fW80quzAmT02+1PJFGZNrxmVfJWLlT4Xp9qpy7xpp/ETX3c\njjmb/aq4nDfJVO1Qnuw5wRdsmWpDaWPKDDG0NLSWpIc9wTodZTau13ktQIngeYGr\nwIrjOCrAyg/mc6/e3I1zvpG1BeaH1rtCx1rsMvgB1quitqvqL6VY7y7fFUvy8NrP\nwRzCK/sXoKxFCGpPcV1WcwKqpnhyEggsVd7s0+H4BIQS2nwZs9VPYiyYBCdjA/x4\nEL5FiMECgYEA9yTPEHGhxwCZhPGIU3nL9WyJuxsOSkopI+f1qJtG/XRWWlXPQvsN\n+ZQP53EOEW2HmfM98e4zH3erFqNvF/O7dhflna120eK80h1DuHqsQ8R7nfcUG/Gd\n1aW7LgsNBrbj7X6mIFvm9T4XFo3+P8ON/qDS+3SnKK/VHRC71HOkUZMCgYEA5GbS\nfKsE2SG3OjtafvCYGJjKdlxqQFqxe65m2LBPtRe+QR6lshSur5OumVKiyGM7SZeZ\ngn03uEX0gUEOLpqYqxGOaG2FvLO/4gdu4mNBkD2sMV2Hf1w+UKI7EI83zaaTO/f+\nqj3QReJLT4XtVT+xUzeCfXSSvYZ8QaHfXVjrVFUCgYEAnJP8gA2OEldl7B1eYoyq\n1K3UQO+uSRDdKbt/HzhpbJC1WPw+mNAYFYRh4x70a8Q6AiZim5FvYENf6LLY4pLv\ntK0FM7W/rs/5EyGpUwqdcz3bl8P/QIj+l2otwckMkrFyjHgN5jhzhfK1i/ugFmPd\n5XGc2eUZNqTX31dHuR0fAPMCgYEAmoZiM8w0jH5+C1yqniVCkamVmLxvejihyU61\n8DZgxuFYa5BDhBbwFIOy5bJ9xVs1elWhmyICd56EjIoqASfA0EQhd89ZYtCtqktj\nHrEOY3sGK6PejzEmS8Fmeo6ar3zaMgFXf3Awn4c5coTmi/16iBWPKDedK7J4EKNm\nji4hkL0CgYADE95QwAxlqBRWMY5EKKHdDVcsmcue1osvgRsLFiT1e+gCj5tLOjST\nzOatf4EDNCEKhk26cZFqK8JFAV+1QguwehNFnKyeAMa0P9/jutDcc4AHLZOinqTg\nZVEJiGsqczvxk5EOGlur0FvOPQhf2z5F1w1x/+KE5/LDQqg7gZnZBw==\n-----END RSA PRIVATE KEY-----"
    },
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
