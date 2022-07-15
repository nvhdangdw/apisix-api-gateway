# Keycloak for Authentication with Apache APISIX

## 1. Create a realm
First, you need to create a realm named `apisix_test_realm`. In Keycloak, a realm is a workspace dedicated to managing projects, and the resources of different realms are isolated from each other.

![](https://www.keycloak.org/resources/images/blog/apisix/create-realm.png)
![](https://www.keycloak.org/resources/images/blog/apisix/edit-realm-title.png)

## 2. Create a Client
The next step is to create the `OpenID Connect Client`. In Keycloak, Client means a client that is allowed to initiate authentication to Keycloak.

In this example scenario, Apache APISIX is equivalent to a client that is responsible for initiating authentication requests to Keycloak, so we create a Client with the name `apisix`. More details about the Client can be found in Keycloak OIDC Clients.

![](https://www.keycloak.org/resources/images/blog/apisix/create-openid-client.png)
![](https://www.keycloak.org/resources/images/blog/apisix/create-client-title.png)

After we create client we will have `client_secret`.

`43689142-3090-4efc-b447-5d4a6eb846b0`
![](https://southeastasia1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fptnglobal-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!mBSx3mvlJUmWG1YYDHMWbH3v5Sl0KHxAvt24zdkAzf0sPLBFaHfJRIfLx4KtrHLp%2Fitems%2F01BUMOXC552RTFYB2JPNBZDWIZIXAKYKV7%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvcHRuZ2xvYmFsLW15LnNoYXJlcG9pbnQuY29tQGU4YzY4ZGRjLTIyOTgtNDNkMC04YjQzLTQ4ZjcxOWI0NjlkMSIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NTc3Nzg0MDAiLCJleHAiOiIxNjU3ODAwMDAwIiwiZW5kcG9pbnR1cmwiOiJvZjNtZ3ZKSDZ6V25LYjBHYkd5VW8vNGJwYkNOUm1Db1N1TGV3WTJZQVFrPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWkdWaU1URTBPVGd0WlRVMllpMDBPVEkxTFRrMk1XSXROVFl4T0RCak56TXhOalpqIiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxraGFuaC50b25AcHRuZ2xvYmFsY29ycC5jb20iLCJuaWkiOiJtaWNyb3NvZnQuc2hhcmVwb2ludCIsImlzdXNlciI6InRydWUiLCJjYWNoZWtleSI6IjBoLmZ8bWVtYmVyc2hpcHwxMDAzMjAwMjBjNzIyNTBiQGxpdmUuY29tIiwic2lkIjoiZjEzMzQ0N2YtODJjYi00ZDdmLTliNDMtZWQwZTNkYTViYzJkIiwidHQiOiIwIiwidXNlUGVyc2lzdGVudENvb2tpZSI6IjMiLCJpcGFkZHIiOiIxMTMuMTYxLjIwNC41NCJ9.dFF0UnR5RjhHNmxuS2J3TDU4bXNOZjRvdXpvbHlPRlZIOXJtT2xhS0VFVT0&cTag=%22c%3A%7B5C66D4BD-4907-437B-91D9-1945C0AC2ABF%7D%2C2%22&encodeFailures=1&width=1519&height=965&srcWidth=&srcHeight=)

## 3. Configure the client
In Keycloak, there are three types of Access Type:
> 1. **Confidential**: which is used for applications that need to perform browser login, and the client will get the access token through client secret, mostly used in web systems rendered by the server.
> 2. **Public**: for applications that need to perform browser login, mostly used in front-end projects implemented using vue and react.
> 3. **Bearer-only**: for applications that don’t need to perform browser login, only allow access with bearer token, mostly used in RESTful API scenarios.

Since we are using Apache APISIX as the Client on the server side, we can choose either "Confidential" Access Type or "`Bearer-only`" Access Type. For the demonstration below, we are using "`Confidential`" Access Type as an example.

![](https://www.keycloak.org/resources/images/blog/apisix/set-client-type.png)

## 4. Create Users

Keycloak supports interfacing with other third-party user systems, such as Google and Facebook, or importing or `manually creating users` using LDAP.

Here we will use "`manually creating users`" to demonstrate.

![](https://ptnglobal-my.sharepoint.com/personal/khanh_ton_ptnglobalcorp_com/Documents/MBA/temp/share/Screenshot%202022-07-14%20141246.png)

Then set the user's password and turn off Temporary in the Credentials page.

![](https://southeastasia1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fptnglobal-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!mBSx3mvlJUmWG1YYDHMWbH3v5Sl0KHxAvt24zdkAzf0sPLBFaHfJRIfLx4KtrHLp%2Fitems%2F01BUMOXC3Z4RXD3OYDRVBJ6PIVVBPWG6TQ%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvcHRuZ2xvYmFsLW15LnNoYXJlcG9pbnQuY29tQGU4YzY4ZGRjLTIyOTgtNDNkMC04YjQzLTQ4ZjcxOWI0NjlkMSIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NTc3Nzg0MDAiLCJleHAiOiIxNjU3ODAwMDAwIiwiZW5kcG9pbnR1cmwiOiJvZjNtZ3ZKSDZ6V25LYjBHYkd5VW8vNGJwYkNOUm1Db1N1TGV3WTJZQVFrPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWkdWaU1URTBPVGd0WlRVMllpMDBPVEkxTFRrMk1XSXROVFl4T0RCak56TXhOalpqIiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxraGFuaC50b25AcHRuZ2xvYmFsY29ycC5jb20iLCJuaWkiOiJtaWNyb3NvZnQuc2hhcmVwb2ludCIsImlzdXNlciI6InRydWUiLCJjYWNoZWtleSI6IjBoLmZ8bWVtYmVyc2hpcHwxMDAzMjAwMjBjNzIyNTBiQGxpdmUuY29tIiwic2lkIjoiZjEzMzQ0N2YtODJjYi00ZDdmLTliNDMtZWQwZTNkYTViYzJkIiwidHQiOiIwIiwidXNlUGVyc2lzdGVudENvb2tpZSI6IjMiLCJpcGFkZHIiOiIxMTMuMTYxLjIwNC41NCJ9.dFF0UnR5RjhHNmxuS2J3TDU4bXNOZjRvdXpvbHlPRlZIOXJtT2xhS0VFVT0&cTag=%22c%3A%7B3D6EE479-03BB-428D-9F3D-15A85F637A70%7D%2C1%22&encodeFailures=1&width=1519&height=965&srcWidth=&srcHeight=)

## 5. Get configuration

In the URL below, we are got configuration of `OpenID`.

In this URL, we have a `http://localhost:8080` domain and an `apisix_test_realm` realm.

http://localhost:8080/auth/realms/apisix_test_realm/.well-known/openid-configuration

```json
{
    "issuer": "http://localhost:8080/auth/realms/apisix_test_realm",
    "authorization_endpoint": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/auth",
    "token_endpoint": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/token",
    "token_introspection_endpoint": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/token/introspect",
    "userinfo_endpoint": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/userinfo",
    "end_session_endpoint": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/logout",
    "jwks_uri": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/certs",
    "check_session_iframe": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/login-status-iframe.html",
    "grant_types_supported": [
        "authorization_code",
        "implicit",
        "refresh_token",
        "password",
        "client_credentials"
    ],
    "response_types_supported": [
        "code",
        "none",
        "id_token",
        "token",
        "id_token token",
        "code id_token",
        "code token",
        "code id_token token"
    ],
    "subject_types_supported": [
        "public",
        "pairwise"
    ],
    "id_token_signing_alg_values_supported": [
        "PS384",
        "ES384",
        "RS384",
        "HS256",
        "HS512",
        "ES256",
        "RS256",
        "HS384",
        "ES512",
        "PS256",
        "PS512",
        "RS512"
    ],
    "id_token_encryption_alg_values_supported": [
        "RSA-OAEP",
        "RSA1_5"
    ],
    "id_token_encryption_enc_values_supported": [
        "A128GCM",
        "A128CBC-HS256"
    ],
    "userinfo_signing_alg_values_supported": [
        "PS384",
        "ES384",
        "RS384",
        "HS256",
        "HS512",
        "ES256",
        "RS256",
        "HS384",
        "ES512",
        "PS256",
        "PS512",
        "RS512",
        "none"
    ],
    "request_object_signing_alg_values_supported": [
        "PS384",
        "ES384",
        "RS384",
        "HS256",
        "HS512",
        "ES256",
        "RS256",
        "HS384",
        "ES512",
        "PS256",
        "PS512",
        "RS512",
        "none"
    ],
    "response_modes_supported": [
        "query",
        "fragment",
        "form_post"
    ],
    "registration_endpoint": "http://localhost:8080/auth/realms/apisix_test_realm/clients-registrations/openid-connect",
    "token_endpoint_auth_methods_supported": [
        "private_key_jwt",
        "client_secret_basic",
        "client_secret_post",
        "tls_client_auth",
        "client_secret_jwt"
    ],
    "token_endpoint_auth_signing_alg_values_supported": [
        "PS384",
        "ES384",
        "RS384",
        "HS256",
        "HS512",
        "ES256",
        "RS256",
        "HS384",
        "ES512",
        "PS256",
        "PS512",
        "RS512"
    ],
    "claims_supported": [
        "aud",
        "sub",
        "iss",
        "auth_time",
        "name",
        "given_name",
        "family_name",
        "preferred_username",
        "email",
        "acr"
    ],
    "claim_types_supported": [
        "normal"
    ],
    "claims_parameter_supported": false,
    "scopes_supported": [
        "openid",
        "offline_access",
        "profile",
        "email",
        "address",
        "phone",
        "roles",
        "web-origins",
        "microprofile-jwt"
    ],
    "request_parameter_supported": true,
    "request_uri_parameter_supported": true,
    "code_challenge_methods_supported": [
        "plain",
        "S256"
    ],
    "tls_client_certificate_bound_access_tokens": true,
    "introspection_endpoint": "http://localhost:8080/auth/realms/apisix_test_realm/protocol/openid-connect/token/introspect"
}
```

## 6. Get token.

Use `postman` to get token.

![](https://southeastasia1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fptnglobal-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!mBSx3mvlJUmWG1YYDHMWbH3v5Sl0KHxAvt24zdkAzf0sPLBFaHfJRIfLx4KtrHLp%2Fitems%2F01BUMOXCY6QVBIYGRYY5GJL5YSVC7WFNTS%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvcHRuZ2xvYmFsLW15LnNoYXJlcG9pbnQuY29tQGU4YzY4ZGRjLTIyOTgtNDNkMC04YjQzLTQ4ZjcxOWI0NjlkMSIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NTc3Nzg0MDAiLCJleHAiOiIxNjU3ODAwMDAwIiwiZW5kcG9pbnR1cmwiOiJvZjNtZ3ZKSDZ6V25LYjBHYkd5VW8vNGJwYkNOUm1Db1N1TGV3WTJZQVFrPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWkdWaU1URTBPVGd0WlRVMllpMDBPVEkxTFRrMk1XSXROVFl4T0RCak56TXhOalpqIiwibmFtZWlkIjoiMCMuZnxtZW1iZXJzaGlwfHVybiUzYXNwbyUzYWFub24jOGNhZGNlZmFjOTBjZGQ4ZTg5Mjg0OTc1Yjc0YmIxMzRhYzJjNjZhN2E1ZGM1NGNlNDdmZDYwOWIwYzEwNjIxYyIsIm5paSI6Im1pY3Jvc29mdC5zaGFyZXBvaW50IiwiaXN1c2VyIjoidHJ1ZSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfHVybiUzYXNwbyUzYWFub24jOGNhZGNlZmFjOTBjZGQ4ZTg5Mjg0OTc1Yjc0YmIxMzRhYzJjNjZhN2E1ZGM1NGNlNDdmZDYwOWIwYzEwNjIxYyIsInNoYXJpbmdpZCI6InZQV3RjeFJOZkVpbDFxbEcvUzdxY2ciLCJ0dCI6IjAiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjoiMiIsImlwYWRkciI6IjExMy4xNjEuMjA0LjU0In0.QjlGN0NMMm05Q29LU1B4ZisxWkUvNkZaclM0TUs4QW5yOUhpRmFvNWF2UT0&cTag=%22c%3A%7B8C42851E-381A-4CC7-95F7-12A8BF62B672%7D%2C1%22&encodeFailures=1&width=1519&height=965&srcWidth=&srcHeight=)

## 7. Config OpenID with APISIX.

Enable `openid-connect` plugin in APISIX.

![](https://southeastasia1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fptnglobal-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!mBSx3mvlJUmWG1YYDHMWbH3v5Sl0KHxAvt24zdkAzf0sPLBFaHfJRIfLx4KtrHLp%2Fitems%2F01BUMOXCZU7ZMRETVZ2JFY53PQVJEM5M2Z%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvcHRuZ2xvYmFsLW15LnNoYXJlcG9pbnQuY29tQGU4YzY4ZGRjLTIyOTgtNDNkMC04YjQzLTQ4ZjcxOWI0NjlkMSIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NTc3Nzg0MDAiLCJleHAiOiIxNjU3ODAwMDAwIiwiZW5kcG9pbnR1cmwiOiJvZjNtZ3ZKSDZ6V25LYjBHYkd5VW8vNGJwYkNOUm1Db1N1TGV3WTJZQVFrPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWkdWaU1URTBPVGd0WlRVMllpMDBPVEkxTFRrMk1XSXROVFl4T0RCak56TXhOalpqIiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxraGFuaC50b25AcHRuZ2xvYmFsY29ycC5jb20iLCJuaWkiOiJtaWNyb3NvZnQuc2hhcmVwb2ludCIsImlzdXNlciI6InRydWUiLCJjYWNoZWtleSI6IjBoLmZ8bWVtYmVyc2hpcHwxMDAzMjAwMjBjNzIyNTBiQGxpdmUuY29tIiwic2lkIjoiZjEzMzQ0N2YtODJjYi00ZDdmLTliNDMtZWQwZTNkYTViYzJkIiwidHQiOiIwIiwidXNlUGVyc2lzdGVudENvb2tpZSI6IjMiLCJpcGFkZHIiOiIxMTMuMTYxLjIwNC41NCJ9.dFF0UnR5RjhHNmxuS2J3TDU4bXNOZjRvdXpvbHlPRlZIOXJtT2xhS0VFVT0&cTag=%22c%3A%7B1259FE34-B94E-4BD2-8EED-F0AA48CEB359%7D%2C1%22&encodeFailures=1&width=1519&height=965&srcWidth=&srcHeight=)

Add config Json to `openid-connect` plugin in APISIX.

```json
{
  "access_token_in_authorization_header": true,
  "bearer_only": true,
  "client_id": "apisix",
  "client_secret": "43689142-3090-4efc-b447-5d4a6eb846b0",
  "disable": true,
  "discovery": "http://keycloak:8080/auth/realms/apisix_test_realm/.well-known/openid-configuration",
  "introspection_endpoint_auth_method": "client_secret_post",
  "realm": "apisix_test_realm",
  "redirect_uri": "http://127.0.0.1:9080/",
  "scope": "openid profile"
}
```
> NOTE
>
> `http://keycloak:8080`: Domain public from keycloak.
>
> `http://127.0.0.1:9080`: Domain public from APISIX.

![](https://southeastasia1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fptnglobal-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!mBSx3mvlJUmWG1YYDHMWbH3v5Sl0KHxAvt24zdkAzf0sPLBFaHfJRIfLx4KtrHLp%2Fitems%2F01BUMOXC7DK6A2Z33ABVDI4QJFB45IIG7X%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvcHRuZ2xvYmFsLW15LnNoYXJlcG9pbnQuY29tQGU4YzY4ZGRjLTIyOTgtNDNkMC04YjQzLTQ4ZjcxOWI0NjlkMSIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NTc3Nzg0MDAiLCJleHAiOiIxNjU3ODAwMDAwIiwiZW5kcG9pbnR1cmwiOiJvZjNtZ3ZKSDZ6V25LYjBHYkd5VW8vNGJwYkNOUm1Db1N1TGV3WTJZQVFrPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTE5IiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWkdWaU1URTBPVGd0WlRVMllpMDBPVEkxTFRrMk1XSXROVFl4T0RCak56TXhOalpqIiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxraGFuaC50b25AcHRuZ2xvYmFsY29ycC5jb20iLCJuaWkiOiJtaWNyb3NvZnQuc2hhcmVwb2ludCIsImlzdXNlciI6InRydWUiLCJjYWNoZWtleSI6IjBoLmZ8bWVtYmVyc2hpcHwxMDAzMjAwMjBjNzIyNTBiQGxpdmUuY29tIiwic2lkIjoiZjEzMzQ0N2YtODJjYi00ZDdmLTliNDMtZWQwZTNkYTViYzJkIiwidHQiOiIwIiwidXNlUGVyc2lzdGVudENvb2tpZSI6IjMiLCJpcGFkZHIiOiIxMTMuMTYxLjIwNC41NCJ9.dFF0UnR5RjhHNmxuS2J3TDU4bXNOZjRvdXpvbHlPRlZIOXJtT2xhS0VFVT0&cTag=%22c%3A%7BAC8157E3-60EF-460D-8E41-250F3A841BF7%7D%2C1%22&encodeFailures=1&width=1519&height=965&srcWidth=&srcHeight=)
