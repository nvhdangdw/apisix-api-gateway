key='xxixdwwycd2wldgn2o8zvg4p12v663u5'
data='{
    "username": "opencart_sso_2_store",
    "plugins": {
        "key-auth": {
            "disable": false,
            "key": "'"$key"'"
        }
    }
}'

opencart_sso_2_store_consumer_id=$(create_consumer $data)
