# Hypnodrhome Youtube Tool

This tool aims to make it easy to download and convert youtube videos, 
with subsecond start and end times, to:

- Audio Files
- Animated Gifs
- Plain ol' Video Files

## Getting Started

If you're super lazy and just want a "set us up the bomb" script, run setup.sh (which will take a LONG time).
Otherwise, just go through the requirements and installation steps :)

## Requirements

- Python 2.6, 2.7, or 3.2+
- [XCode Command Line Tools](http://lmgtfy.com/?q=install+xcode+command+line+tools)
- (for GIFs) [OpenCv](http://www.jeffreythompson.org/blog/2013/08/22/update-installing-opencv-on-mac-mountain-lion/)
- (for MP3s) [FFMpeg](http://www.renevolution.com/how-to-install-ffmpeg-on-mac-os-x/)

## Installation

    pip install -r requirements.txt
    
For some reason I had to run a

    brew reinstall libav

to get audio conversion working ¯\\_(ツ)_/¯

## Examples

    bash videoToGif.sh --video 37eEUsd1ASA --output myGif --startTime 10.56 --endTime 15.6

    bash getVideo.sh --video 37eEUsd1ASA --output myVideo --startTime 20.4 --endtime 40

    bash videoToMp3.sh --video 37eEUsd1ASA --output myAudio

## TODO

## Reference

[Download Youtube Videos](https://github.com/rg3/youtube-dl/blob/master/README.md#readme)

[Make Gifs from mp4s](http://zulko.github.io/blog/2014/01/23/making-animated-gifs-from-video-files-with-python/)
