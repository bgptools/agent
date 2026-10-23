FROM debian:stable-slim

ARG DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get install -y gnupg mtr-tiny ca-certificates curl wget
RUN curl https://pkg.bgp.tools/repo.key | gpg --yes --dearmor --output /usr/share/keyrings/bgptools.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/bgptools.gpg] https://pkg.bgp.tools/deb/amd64 /" | sudo tee /etc/apt/sources.list.d/bgptools.list
RUN apt-get update && apt-get install -y bgptools-agent=1792500706
ENTRYPOINT ["/usr/bin/bgp-tools-client-agent","-background"]
