FROM debian:stretch
ENTRYPOINT ["/app/init.sh"]
CMD ["/usr/sbin/shibd", "-F", "-u", "_shibd", "-g", "_shibd"]

ENV SHIB_ACL 127.0.0.1
ENV SHIB_LOG_LEVEL INFO

ADD shibboleth2.xml.template /app/
ADD init.sh /app/

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y libapache2-mod-shib2 && apt-get clean \
  && rm -rf /build /tmp/* /var/cache/
