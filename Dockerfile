FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine3.10

ARG DEVSKIM_VERSION=0.4.109

RUN dotnet tool install --global Microsoft.CST.DevSkim.CLI --version ${DEVSKIM_VERSION} && \
    ln -s /root/.dotnet/tools/devskim /usr/bin/devskim

ENTRYPOINT [ "devskim" ]
CMD [ "--help" ]
