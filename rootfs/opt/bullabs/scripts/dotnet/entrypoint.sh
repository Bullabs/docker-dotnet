#!/bin/bash -e
# shellcheck disable=SC1091

BASE_ENTRYPOINT_PATH="/opt/bullabs/scripts/entrypoint.sh"
bash "$BASE_ENTRYPOINT_PATH"

exec "$@"