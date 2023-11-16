#!/bin/bash
set -e
DELAY="${DELAY:-7d}"
while true; do
    /usr/bin/apt-mirror /etc/apt/mirror.list
    sleep $DELAY
done
