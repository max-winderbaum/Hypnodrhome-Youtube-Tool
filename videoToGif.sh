#!/usr/bin/env bash

source $(dirname $0)/bashArgumentParser.sh

youtube-dl "$VIDEOURL" -o "downloads/$FILE_NAME.%(ext)s" --recode-video mp4 --no-check-certificate --prefer-insecure

if [ -n "$ENDTIME" ]; then
  echo "Applying start/end times..."
  python editVideo.py --gif --output="$FILE_NAME" --startTime="$STARTTIME" --endTime="$ENDTIME"
else
  python editVideo.py --gif --output="$FILE_NAME"
fi
