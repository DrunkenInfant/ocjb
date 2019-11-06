FROM ubuntu:bionic-20191029
USER root

RUN apt-get update && apt-get install -y openconnect openssh-server dnsutils
RUN mkdir -p /run/sshd

COPY ./entrypoint.sh /
COPY ./ocjb /

EXPOSE 22
ENV VPN_HOST https://example.com
ENTRYPOINT ["/entrypoint.sh"]
CMD openconnect $VPN_HOST
