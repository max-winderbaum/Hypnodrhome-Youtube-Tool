#!/usr/bin/env bash

source $(dirname $0)/argparse.bash
argparse "$@" <<EOF || exit 1
parser.add_argument('-o', '--output',
                    help='the name of the video file in /videos (without extension)')
parser.add_argument('-v', '--videoUrl',
                    help='the url of the video file to download')
parser.add_argument('-s', '--startTime', '--not-required', default='0',
                    help='the time, in seconds, to start the gif')
parser.add_argument('-e', '--endTime',
                    help='the time, in seconds, to end the gif')
EOF

youtube-dl $VIDEOURL -o downloads/$OUTPUT --recode-video mp4 --no-check-certificate --prefer-insecure

if [ -n "$ENDTIME" ]; then
  echo "Applying start/end times..."
  python editVideo.py --gif --output="$OUTPUT" --startTime="$STARTTIME" --endTime="$ENDTIME"
else
  python editVideo.py --gif --output="$OUTPUT"
fi
