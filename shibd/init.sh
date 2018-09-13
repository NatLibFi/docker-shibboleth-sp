#!/bin/sh
set -e

sed -e "s|\$SHIB_ACL|$SHIB_ACL|g" \
    -e "s|\$SHIB_APP_URL|$SHIB_APP_URL|g" \
    -e "s|\$SHIB_SSO_URL|$SHIB_SSO_URL|g" \
    -e "s|\$SHIB_CONTACT_EMAIL|$SHIB_CONTACT_EMAIL|g" \
    -e "s|\$SHIB_LOGOUT_URL|$SHIB_LOGOUT_URL|g" \
    -e "s|\$SHIB_METADATA_URL|$SHIB_METADATA_URL|g" \
    /app/shibboleth2.xml.template > /etc/shibboleth/shibboleth2.xml

sed -i "s/rootCategory=WARN/rootCategory=$SHIB_LOG_LEVEL/g" /etc/shibboleth/console.logger

exec "$@"
