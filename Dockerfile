FROM debian:stable-slim

ARG DEBIAN_FRONTEND="noninteractive"
RUN echo "deb https://pkg.bgp.tools/deb/amd64 /" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y gnupg mtr-tiny ca-certificates curl 
RUN curl https://pkg.bgp.tools/repo.key | apt-key add - 
RUN apt-get update 
RUN apt-get install -y bgptools-agent=1679691935
ENTRYPOINT ["/usr/bin/bgp-tools-client-agent","-background"]
