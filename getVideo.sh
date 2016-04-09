#!/usr/bin/env bash

# output, videoUrl, startTime, endTime
source $(dirname $0)/bashArgumentParser.sh

youtube-dl $VIDEOURL -o downloads/$FILE_NAME --recode-video mp4 --no-check-certificate --prefer-insecure

if [ -n "$ENDTIME" ]; then
  echo "Applying start/end times..."
  python editVideo.py --output="$FILE_NAME" --startTime="$STARTTIME" --endTime="$ENDTIME"
else
  echo "Copying downloaded video..."
  cp downloads/$FILE_NAME.mp4 videos/$FILE_NAME.mp4
fi

