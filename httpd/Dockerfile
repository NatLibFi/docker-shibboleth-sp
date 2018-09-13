FROM debian:stretch
ENTRYPOINT ["/app/init.sh"]
CMD ["/usr/sbin/apache2", "-DFOREGROUND"]

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2

ENV SHIB_PORT 1600
ENV SHIB_ACL 127.0.0.1
ENV SHIB_LOG_LEVEL INFO

ADD init.sh /app/
ADD shibboleth2.xml.template /app/

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y curl netcat dnsutils libapache2-mod-shib2 apache2 && apt-get clean \
  && sed -ri \
		-e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
		-e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
    -e '/APACHE_PID_FILE/d' \
    /etc/apache2/apache2.conf \
  && ln -s /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/ \
  && ln -s /etc/apache2/mods-available/proxy_connect.load /etc/apache2/mods-enabled/ \
  && ln -s /etc/apache2/mods-available/proxy_http.load /etc/apache2/mods-enabled/ \
  && rm /etc/apache2/sites-enabled/000-default.conf \
    /etc/apache2/conf-enabled/other-vhosts-access-log.conf \
  && rm -rf /build /tmp/* /var/cache/
