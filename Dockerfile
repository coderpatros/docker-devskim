FROM ubuntu:18.04

ARG VERSION=0.1.11

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y icu-devtools && \
    wget -O devskim.deb https://github.com/Microsoft/DevSkim/releases/download/${VERSION}/devskim-${VERSION}_amd64.deb && \
    ( dpkg -i devskim.deb || exit 0 ) && \
    apt-get install -f -y && \
    rm devskim.deb && \
    apt-get purge -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "devskim" ]
CMD [ "--help" ]
