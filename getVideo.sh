#!/usr/bin/env bash

# output, videoUrl, startTime, endTime
source $(dirname $0)/bashArgumentParser.sh

if [ ! -f "downloads/$VIDEOURL.mp4" ]; then
  youtube-dl $VIDEOURL -o "downloads/$VIDEOURL.%(ext)s" --recode-video mp4 --no-check-certificate --prefer-insecure
else
  echo "Skipping downloading $VIDEOURL because it already exists!"
fi

if [ ! -f "videos/$FILE_NAME.mp4" ]; then
	if [ -n "$ENDTIME" ]; then
	  echo "Applying start/end times..."
	  python editVideo.py --input="$VIDEOURL" --output="$FILE_NAME" --startTime="$STARTTIME" --endTime="$ENDTIME"
	else
	  echo "Copying downloaded video..."
	  cp downloads/$VIDEOURL.mp4 videos/$FILE_NAME.mp4
	fi
else
  echo "Skipping creating $FILE_NAME because it already exists!"
fi
