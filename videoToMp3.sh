#!/usr/bin/env bash

# output, videoUrl, startTime, endTime
source $(dirname $0)/bashArgumentParser.sh

if [ ! -f "downloads/$VIDEOURL.mp3" ]; then
  youtube-dl $VIDEOURL -o "downloads/$VIDEOURL.%(ext)s" -x --audio-format "mp3" --no-check-certificate --prefer-insecure
else
  echo "Skipping downloading $VIDEOURL because it already exists!"
fi

if [ ! -f "audio/$FILE_NAME.mp3" ]; then
  python editAudio.py --input="$VIDEOURL" --output="$FILE_NAME" --startTime="$STARTTIME" --endTime="$ENDTIME"
else
  echo "Skipping creating $FILE_NAME because it already exists!"
fi
