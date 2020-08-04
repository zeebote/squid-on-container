FROM ubuntu:20.04
LABEL maintainer="caotvo@gmail.com"
COPY docker-entrypoint.sh /usr/sbin/docker-entrypoint.sh
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid \
 && update-rc.d -f squid remove \
 && apt-get clean -y \
 && sed -i '/100 16 256/s/^#//g' /etc/squid/squid.conf \
 && sed -i '/http_access allow localnet/s/^#//g' /etc/squid/squid.conf \
 && chmod 755 /usr/sbin/docker-entrypoint.sh \
 && ln -s /usr/sbin/docker-entrypoint.sh /
EXPOSE 3128/tcp
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["squid"]
