#!/bin/bash

# shellcheck disable=SC1091

mkdir /app
chmod g+rwx /app
setcap CAP_NET_BIND_SERVICE=+eip /opt/bullabs/dotnet/bin/dotnet