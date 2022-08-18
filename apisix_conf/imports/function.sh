create_route () {
    uuid=$(uuidgen)
    route_id=$(curl "http://127.0.0.1:9080/apisix/admin/routes/$uuid" --header "X-API-KEY: $X_API_KEY" -X PUT --data ''"$*"'' | jq -r '.node.value.id')
    echo $route_id
}

create_service () {
    service_id=$(curl "http://127.0.0.1:9080/apisix/admin/services" --header "X-API-KEY: $X_API_KEY" --data ''"$*"'' | jq -r '.node.value.id')
    echo $service_id
}

create_consumer () {
    consumer_id=$(curl "http://127.0.0.1:9080/apisix/admin/consumers" --header "X-API-KEY: $X_API_KEY" -X PUT --data ''"$*"'' | jq -r '.node.value.id')
    echo $consumer_id
}
