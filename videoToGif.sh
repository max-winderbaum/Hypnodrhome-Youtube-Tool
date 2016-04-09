#!/usr/bin/env bash

source $(dirname $0)/bashArgumentParser.sh

if [ ! -f "downloads/$VIDEOURL.mp4" ]; then
  youtube-dl "$VIDEOURL" -o "downloads/$VIDEOURL.%(ext)s" --recode-video mp4 --no-check-certificate --prefer-insecure
fi

if [ -n "$ENDTIME" ]; then
  echo "Applying start/end times..."
  python editVideo.py --gif --input="$VIDEOURL" --output="$FILE_NAME" --startTime="$STARTTIME" --endTime="$ENDTIME"
else
  python editVideo.py --gif --input="$VIDEOURL" --output="$FILE_NAME"
fi
