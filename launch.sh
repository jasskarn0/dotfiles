#!/bin/bash

killall -q polybar

polybar -c ~/.config/polybar/left.ini mybar & disown
polybar -c ~/.config/polybar/center.ini center & disown
polybar -c ~/.config/polybar/right.ini right & disown

echo "done done done"
