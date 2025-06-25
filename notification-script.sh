#!/bin/bash

DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus notify-send --urgency=critical -t 0 "Eye Reminder" "Look away from your screen for 20 seconds"
