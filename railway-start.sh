#!/bin/sh
# Browser terminal on $PORT, protected by USERNAME / PASSWORD.
set -eu
if [ -z "${USERNAME:-}" ] || [ -z "${PASSWORD:-}" ]; then
    echo "[terminal] Set USERNAME and PASSWORD; the terminal will not start without a login." >&2
    exit 1
fi
mkdir -p /work
cd /work
exec /usr/local/bin/ttyd --writable --port "${PORT:-7681}" --credential "$USERNAME:$PASSWORD" bash -l
