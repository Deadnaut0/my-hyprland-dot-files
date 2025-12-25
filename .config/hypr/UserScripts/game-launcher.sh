#!/usr/bin/env bash

if pidof rofi >/dev/null; then
  pkill rofi
  exit 0
fi

rofi -modi games -show games -theme game-launcher2
