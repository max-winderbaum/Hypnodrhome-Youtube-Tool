import sys
import argparse
from moviepy.editor import VideoFileClip

# Parse args
parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('--output',
                    help='the name of the video file in /videos (without extension)')
parser.add_argument('--startTime', default=0,
                    help='the time, in seconds, to start the gif')
parser.add_argument('--endTime', default=None,
                    help='the time, in seconds, to end the gif')
parser.add_argument('--gif', dest='gif', action='store_true',
                    help='convert the video to a gif')
args = parser.parse_args()

def getSeconds(timeString):
 list = timeString.split(':')
 if (len(list) == 2):
	mins = float(list[0])
	return mins*60 + float(list[1])
 else:
	return float(timeString)

startTime = getSeconds(args.startTime)
endTime = getSeconds(args.endTime)

if (args.gif):
	clip = (VideoFileClip("downloads/" + args.output + ".mp4")
	        .subclip(startTime, endTime)
	        .resize(0.3))

	clip.write_gif("gifs/" + args.output + ".gif")
else:
	clip = (VideoFileClip("downloads/" + args.output + ".mp4")
	        .subclip(startTime, endTime))

	clip.write_videofile("videos/" + args.output + ".mp4")
