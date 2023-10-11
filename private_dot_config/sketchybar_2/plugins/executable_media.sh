#!/bin/bash
STATE="$(echo "$INFO" | jq -r '.state')"

if [ "$STATE" = "playing" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.app + ": " + .title + " - " + .artist')"
  sketchybar_2 --set $NAME label="$MEDIA" drawing=on
else
  sketchybar_2 --set $NAME drawing=off
fi
