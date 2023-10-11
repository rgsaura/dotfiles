#!/bin/bash

FRONT_APP_SCRIPT='[ "$SENDER" = "front_app_switched" ] && sketchybar_2 --set $NAME label="$INFO"'

front_app=(
  icon.drawing=off
  label.font="$FONT:Bold:12.0"
  associated_display=active
  script="$FRONT_APP_SCRIPT"
)

sketchybar_2 --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
