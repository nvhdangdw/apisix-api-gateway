#!/bin/bash
# COMMON
IP='192.168.2.90'
X_API_KEY='edd1c9f034335f136f87ad84b625c8f1'
BASEDIR=$(dirname $0)
# Colors
RED='\033[0;31m'
GREEN='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

source "${BASEDIR}/function.sh"

# Clear All (routes, services, consumer)
read -p "$(echo -e ${RED}"CLEAR ALL"${NC} y/n?)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
clear_all
fi

printf "Import ${BLUE}CONSUMERS${NC}:\n"
    source "${BASEDIR}/consumers/opencart_sso_1.sh"
    source "${BASEDIR}/consumers/opencart_sso_2_customer.sh"
    source "${BASEDIR}/consumers/opencart_sso_2_store.sh"


printf "Import ${BLUE}COMMON ROUTES${NC}:\n"
    source "${BASEDIR}/routes/SELF_cookie_access_token_to_header_authorization.sh"


printf "Import ${BLUE}QR_BENEFIT${NC}:\n"
    # BACKEND
    source "${BASEDIR}/services/qr_benefit_BE.sh"
    source "${BASEDIR}/routes/qr_benefit_BE_auth.sh"
    source "${BASEDIR}/routes/qr_benefit_BE_login.sh"
    # FRONTEND
    source "${BASEDIR}/services/qr_benefit_FE.sh"
    source "${BASEDIR}/routes/qr_benefit_FE.sh"


printf "Import ${BLUE}OPENCART${NC}:\n"
    source "${BASEDIR}/services/opencart.sh"
    source "${BASEDIR}/routes/opencart.sh"


printf "Import ${BLUE}OPENCART_SSO${NC}:\n"
    source "${BASEDIR}/services/opencart_sso.sh"
    source "${BASEDIR}/routes/opencart_sso_1.sh"
    source "${BASEDIR}/routes/opencart_sso_2_customer.sh"
    source "${BASEDIR}/routes/opencart_sso_2_store.sh"
