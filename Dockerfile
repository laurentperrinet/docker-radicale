FROM fedora:21
MAINTAINER Stas Rudakou "stas@garage22.net"

RUN yum -y update; yum clean all;
RUN yum -y install radicale

ADD radicale.conf /etc/radicale/config
RUN mkdir /var/lib/radicale/collections && \
    chown -R radicale: /var/lib/radicale

VOLUME ["/var/lib/radicale/collections", "/var/log/radicale"]

EXPOSE 5232

USER radicale
CMD  /usr/bin/radicale -f
