#!/usr/bin/env bash

# output, videoUrl, startTime, endTime
source $(dirname $0)/bashArgumentParser.sh

if [ ! -f "downloads/$VIDEOURL.mp4" ]; then
  youtube-dl $VIDEOURL -o downloads/$VIDEOURL --recode-video mp4 --no-check-certificate --prefer-insecure
fi

if [ -n "$ENDTIME" ]; then
  echo "Applying start/end times..."
  python editVideo.py --input="$VIDEOURL" --output="$FILE_NAME" --startTime="$STARTTIME" --endTime="$ENDTIME"
else
  echo "Copying downloaded video..."
  cp downloads/$VIDEOURL.mp4 videos/$FILE_NAME.mp4
fi

