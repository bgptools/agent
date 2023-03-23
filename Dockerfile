FROM debian:stable-slim

ARG DEBIAN_FRONTEND="noninteractive"
RUN echo "deb https://pkg.bgp.tools/deb/amd64 /" >> /etc/apt/sources.list
RUN apt update && apt install -y gnupg mtr-tiny ca-certificates curl && curl https://pkg.bgp.tools/repo.key | apt-key add - && apt update && apt install -y bgptools-agent=1679592717
ENTRYPOINT ["/usr/bin/bgp-tools-client-agent","-background"]