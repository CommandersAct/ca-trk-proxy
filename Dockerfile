FROM haproxy:2.7-alpine

ADD haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

EXPOSE 80/tcp 443/tcp 8080/tcp 8404/tcp 8443/tcp 8666/tcp 

LABEL maintainer="DevOps Team Fjord Technologies <prod@commandersact.com>" \
      description="ca-trk-proxy" \
      version="1.0"
