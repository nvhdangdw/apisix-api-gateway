clear_all () {
    # clear routes
    count_routes=$(curl http://$HOST/apisix/admin/routes -H X-API-KEY:$X_API_KEY | jq -r '.count')
    for ((i=1;i<=$count_routes;i++)) do
        route_id=$(curl http://$HOST/apisix/admin/routes -H X-API-KEY:$X_API_KEY | jq -r '.node.nodes[0].value.id')
        printf "$route_id"
        curl "http://$HOST/apisix/admin/routes/$route_id" -H X-API-KEY:$X_API_KEY -X DELETE
    done

    # clear services
    count_services=$(curl $HOST/apisix/admin/services -H X-API-KEY:$X_API_KEY | jq -r '.count')
    for ((i=1;i<=$count_services;i++)) do
        service_id=$(curl http://$HOST/apisix/admin/services -H X-API-KEY:$X_API_KEY | jq -r '.node.nodes[0].value.id')
        printf "$service_id"
        curl "http://$HOST/apisix/admin/services/$service_id" -H X-API-KEY:$X_API_KEY -X DELETE
    done

    # clear consumers
    count_consumers=$(curl $HOST/apisix/admin/consumers -H X-API-KEY:$X_API_KEY | jq -r '.count')
    for ((i=1;i<=$count_consumers;i++)) do
        username_consumer=$(curl http://$HOST/apisix/admin/consumers -H X-API-KEY:$X_API_KEY | jq -r '.node.nodes[0].value.username')
        printf "$username_consumer"
        curl "http://$HOST/apisix/admin/consumers/$username_consumer" -H X-API-KEY:$X_API_KEY -X DELETE
    done
}

create_route () {
    uuid=$(uuidgen)
    route_id=$(curl "http://$HOST/apisix/admin/routes/$uuid" --header "X-API-KEY: $X_API_KEY" -X PUT --data ''"$*"'' | jq -r '.node.value.id')
    echo $route_id
}

create_service () {
    service_id=$(curl "http://$HOST/apisix/admin/services" --header "X-API-KEY: $X_API_KEY" --data ''"$*"'' | jq -r '.node.value.id')
    echo $service_id
}

create_consumer () {
    consumer_id=$(curl "http://$HOST/apisix/admin/consumers" --header "X-API-KEY: $X_API_KEY" -X PUT --data ''"$*"'' | jq -r '.node.value.id')
    echo $consumer_id
}
