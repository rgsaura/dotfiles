#!/usr/bin/env bash
#ram.sh

sketchybar_2 -m --set "$NAME" label="$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')%"