#!/bin/sh
# This file was forked from kevineye/docker-shairport-sync

mkdir -p /var/run/dbus
dbus-daemon --system && avahi-daemon --no-chroot -D && shairport-sync -m avahi -a "$AIRPLAY_NAME" "$@"
