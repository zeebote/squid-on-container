#!/bin/bash
set -e
if [ "$1" = "squid" ] && [ -z "$(ls -A /var/spool/squid)" ]; then
    squid -Nz
else
    exec squid -N "$@"
fi
exec "$@"

