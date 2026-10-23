FROM debian:stable-slim

ARG DEBIAN_FRONTEND="noninteractive"
RUN echo "deb https://pkg.bgp.tools/deb/amd64 /" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y gnupg mtr-tiny ca-certificates curl 
RUN curl https://pkg.bgp.tools/repo.key | gpg --yes --dearmor --output /usr/share/keyrings/bgptools.gpg
RUN apt-get update && apt-get install -y bgptools-agent=1792500706
ENTRYPOINT ["/usr/bin/bgp-tools-client-agent","-background"]
