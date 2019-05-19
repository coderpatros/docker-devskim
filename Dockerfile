# until suppression (mainly) is supported by official DevSkim CLI build our own
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS builder

RUN cd /tmp && \
    git clone --depth 1 https://github.com/patros/DevSkim.git --branch custom --single-branch && \
    cd DevSkim && \
    mkdir /tmp/binary && \
    dotnet publish --configuration Release --runtime linux-x64 --output /tmp/binary /tmp/DevSkim/src/Microsoft.DevSkim/Microsoft.DevSkim.CLI/Microsoft.DevSkim.CLI.csproj && \
    chmod +x /tmp/binary/devskim

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

COPY --from=builder /tmp/binary /usr/share/devskim/lib

ENTRYPOINT [ "devskim" ]
CMD [ "--help" ]
