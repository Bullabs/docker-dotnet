FROM docker.pkg.github.com/bullabs/docker-alpine-base/docker-alpine-base:3.14
LABEL maintainer "Bullabs <containers@bullabs.dev>"

ARG DOTNET_VERSION=5.0

RUN apk add --no-cache \
    icu-libs \
    krb5-libs \
    libgcc \
    libintl \
    libssl1.1 \
    libstdc++ \
    zlib \
    libcap

RUN wget -nc -P /tmp/ https://dot.net/v1/dotnet-install.sh \
    && chmod +x /tmp/dotnet-install.sh \
    && bash -c "/tmp/dotnet-install.sh -c ${DOTNET_VERSION} --runtime aspnetcore -i /opt/bullabs/dotnet/bin/" 

COPY rootfs /
RUN chmod +x /opt/bullabs/scripts/dotnet/postunpack.sh \
    && bash /opt/bullabs/scripts/dotnet/postunpack.sh
ENV BULLABS_APP_NAME="dotnet" \
    DOTNET_CLI_HOME="/app" \
    DOTNET_ROOT="/opt/bullabs/dotnet/bin" \
    PATH="/opt/bullabs/dotnet/bin:$PATH"

WORKDIR /app
ENTRYPOINT [ "/opt/bullabs/scripts/dotnet/entrypoint.sh" ]
CMD [ "/bin/bash" ]

