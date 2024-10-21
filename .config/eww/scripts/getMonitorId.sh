#!/bin/bash

monitor_ids=$(hyprctl -j monitors | jq -r '.[].id')

echo "$monitor_ids"

