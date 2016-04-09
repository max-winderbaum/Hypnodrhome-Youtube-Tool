#!/usr/bin/env bash

# output, videoUrl, startTime, endTime
source $(dirname $0)/bashArgumentParser.sh

youtube-dl $VIDEOURL -o downloads/$OUTPUT --recode-video mp4 --no-check-certificate --prefer-insecure

if [ -n "$ENDTIME" ]; then
  echo "Applying start/end times..."
  python editVideo.py --output="$OUTPUT" --startTime="$STARTTIME" --endTime="$ENDTIME"
else
  echo "Copying downloaded video..."
  cp downloads/$OUTPUT.mp4 videos/$OUTPUT.mp4
fi

