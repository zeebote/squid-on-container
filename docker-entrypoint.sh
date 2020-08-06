#!/bin/bash
set -e
if [ "$1" = "squid" ]; then
    if [ -z "$(ls -A /var/spool/squid)" ]; then
    squid -Nz
    fi
exec squid -N
fi
exec "$@"

