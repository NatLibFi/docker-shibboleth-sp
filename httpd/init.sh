#!/bin/sh
set -e

SHIB_ADDR=$(getent hosts $SHIB_HOST|cut -f1 -d' ')
SELF_ADDR=$(getent hosts localhost|cut -f1 -d' ')
LISTENER="<TCPListener address=\"$SHIB_ADDR\" port=\"$SHIB_PORT\" acl=\"$SELF_ADDR\" />"

head -n -1 /etc/shibboleth/shibboleth2.xml.template > /etc/shibboleth/shibboleth2.xml
echo '</SPConfig>' >> /etc/shibboleth/shibboleth2.xml

sed -i "s|<ApplicationDefaults|$LISTENER\n&|g" /etc/shibboleth/shibboleth2.xml
sed -i 's|<SPConfig|<SPConfig logger="console.logger"|g' /etc/shibboleth/shibboleth2.xml
sed -i "s|\$SHIB_LOG_LEVEL|$SHIB_LOG_LEVEL|g" /etc/shibboleth/console.logger

exec "$@"
