#!/usr/bin/env bash

source $(dirname $0)/argparse.bash
argparse "$@" <<EOF || exit 1
parser.add_argument('-o', '--output',
                    help='the name of the video file in /audio (without extension)')
parser.add_argument('-v', '--videoUrl',
                    help='the url of the video file to download')
EOF

youtube-dl $VIDEOURL -o audio/$OUTPUT.mp3 -x --no-check-certificate --prefer-insecure
