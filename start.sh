#!/bin/sh
# This file was taken from https://github.com/kevineye/docker-shairport-sync 

rm -rf /var/run
mkdir -p /var/run/dbus

dbus-uuidgen --ensure
dbus-daemon --system

avahi-daemon --daemonize --no-chroot

shairport-sync -m avahi -a "$AIRPLAY_NAME" "$@"