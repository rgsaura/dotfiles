#!/bin/bash

update() {
  source "$CONFIG_DIR/icons.sh"
  LABEL="$INFO ($(ipconfig getifaddr en0))"
  ICON="$([ -n "$INFO" ] && echo "$WIFI_CONNECTED" || echo "$WIFI_DISCONNECTED")"

  sketchybar_2 --set $NAME icon="$ICON" label="$LABEL"
}

click() {
  CURRENT_WIDTH="$(sketchybar_2 --query $NAME | jq -r .label.width)"

  WIDTH=0
  if [ "$CURRENT_WIDTH" -eq "0" ]; then
    WIDTH=dynamic
  fi

  sketchybar_2 --animate sin 20 --set $NAME label.width="$WIDTH"
}

case "$SENDER" in
  "wifi_change") update
  ;;
  "mouse.clicked") click
  ;;
esac
