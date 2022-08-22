key='mngrzbm145l3rv1wg9io370z8x0l4y2s'
data='
{
    "username": "opencart_sso_1",
    "plugins": {
        "key-auth": {
            "key": "'"$key"'"
        }
    }
}'

opencart_sso_1_consumer_id=$(create_consumer $data)
