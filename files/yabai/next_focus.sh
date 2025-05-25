#!/bin/bash

CURRENT_SPACE_ID=$(yabai -m query --windows | jq '.[0].space')
CURRENT_ID=$(yabai -m query --windows | jq '.[0].id')
WINDOW_IDS=$(yabai -m query --windows | jq '.[] | select(.app != "iTerm2" and .space == '$CURRENT_SPACE_ID') | .id' | sort -n)


NEXT_ID=0
for ID in `echo $WINDOW_IDS`; do
    if [ $ID -gt $CURRENT_ID ]; then
        NEXT_ID=$ID
        break
    fi
done

if [ $NEXT_ID -eq 0 ]; then
    NEXT_ID=`echo $WINDOW_IDS | cut -d' ' -f1`
fi

echo $NEXT_ID
yabai -m window $NEXT_ID --focus
