#!/bin/sh
set -e

SHIB_ADDR=$(getent hosts $SHIB_HOST|cut -f1 -d' ')

sed -e "s|\$SHIB_PORT|$SHIB_PORT|g" \
    -e "s|\$SHIB_ADDR|$SHIB_ADDR|g" \
    -e "s|\$SHIB_APP_URL|$SHIB_APP_URL|g" \
    -e "s|\$SHIB_SSO_URL|$SHIB_SSO_URL|g" \
    -e "s|\$SHIB_CONTACT_EMAIL|$SHIB_CONTACT_EMAIL|g" \
    -e "s|\$SHIB_LOGOUT_URL|$SHIB_LOGOUT_URL|g" \
    -e "s|\$SHIB_METADATA_URL|$SHIB_METADATA_URL|g" \
    /app/shibboleth2.xml.template > /etc/shibboleth/shibboleth2.xml

exec "$@"
