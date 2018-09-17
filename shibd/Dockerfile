FROM debian:stretch
ENTRYPOINT ["/app/init.sh"]
#CMD ["/usr/sbin/shibd", "-F", "-u", "_shibd", "-g", "_shibd"]
CMD ["/usr/sbin/shibd", "-F"]

ENV SHIB_LOG_LEVEL INFO
ENV SHIB_PORT 1600

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y netcat net-tools libapache2-mod-shib2 \
  && apt-get clean \
  && rm -rf /build /tmp/* /var/cache/

ADD init.sh /app/
ADD console.logger /etc/shibboleth/console.logger
