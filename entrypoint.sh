#!/bin/bash
set -e
/etc/init.d/apache2 start
DELAY="${DELAY:-7d}"
while true; do
    /usr/bin/apt-mirror /etc/apt/mirror.list
    sleep $DELAY
done
