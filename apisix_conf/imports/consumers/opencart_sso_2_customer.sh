key='58gd820zxgwpbgkeyut795fj0t5h96fn'
data='{
    "username": "opencart_sso_2_customer",
    "plugins": {
        "key-auth": {
            "disable": false,
            "key": "'"$key"'"
        }
    }
}'

opencart_sso_2_customer_consumer_id=$(create_consumer $data)
