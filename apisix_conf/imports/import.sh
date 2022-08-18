#!/bin/bash
# COMMON
IP='192.168.2.90'
X_API_KEY='edd1c9f034335f136f87ad84b625c8f1'
source ./function.sh

read -p "Import consumer? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Consumers
    source ./consumers/opencart_sso_1.sh
    source ./consumers/opencart_sso_2_customer.sh
    source ./consumers/opencart_sso_2_store.sh
fi

read -p "Import SELF_cookie_access_token_to_header_authorization? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # echo "\nCommon Routes\n"
    source ./routes/SELF_cookie_access_token_to_header_authorization.sh
fi

read -p "Import qr_benefit? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
## Backend
# Services
source ./services/qr_benefit_BE.sh
# Routes
source ./routes/qr_benefit_BE_auth.sh
source ./routes/qr_benefit_BE_login.sh

## Frontend
# Services
source ./services/qr_benefit_FE.sh
# Routes
source ./routes/qr_benefit_FE.sh
fi

read -p "Import opencart? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
# Services
source ./services/opencart.sh
# Routes
source ./routes/opencart.sh
fi


read -p "Import opencart_sso? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
# Services
source ./services/opencart_sso.sh
# Routes
source ./routes/opencart_sso_1.sh
source ./routes/opencart_sso_2_customer.sh
source ./routes/opencart_sso_2_store.sh
fi
