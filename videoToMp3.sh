#!/usr/bin/env bash

# output, videoUrl, startTime, endTime
source $(dirname $0)/bashArgumentParser.sh

youtube-dl $VIDEOURL -o "downloads/$FILE_NAME.%(ext)s" -x --audio-format "mp3" --no-check-certificate --prefer-insecure

python editAudio.py --output="$FILE_NAME" --startTime="$STARTTIME" --endTime="$ENDTIME"
