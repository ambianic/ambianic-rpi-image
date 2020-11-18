#!/usr/bin/env bash

#
# Ambianic Edge Raspberry OS Image - WiFi Connect
# This script stops the WiFi Connect Hotspot service when eth0 comes up
#
# (This script is a fork of Homebridge Raspbian Image - WiFi Connect)
#


interface=$1
event=$2

if [[ $interface = "eth0" ]] && [[ $event = "up" ]]; then
   systemctl stop wifi-connect.service
   exit 0
fi
