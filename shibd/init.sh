#!/bin/sh
set -e

SELF_NET=$(ip route|cut -f1 -d' '|tail -n1)
LISTENER="<TCPListener address=\"0.0.0.0\" port=\"$SHIB_PORT\" acl=\"$SELF_NET\" />"

head -n -1 /etc/shibboleth/shibboleth2.xml.template > /etc/shibboleth/shibboleth2.xml
echo '</SPConfig>' >> /etc/shibboleth/shibboleth2.xml

sed -i "s|<ApplicationDefaults|$LISTENER\n&|g" /etc/shibboleth/shibboleth2.xml
sed -i 's|<SPConfig|<SPConfig logger="console.logger"|g' /etc/shibboleth/shibboleth2.xml
sed -i "s|\$SHIB_LOG_LEVEL|$SHIB_LOG_LEVEL|g" /etc/shibboleth/console.logger

exec "$@"
