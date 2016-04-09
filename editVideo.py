import sys
from moviepy.editor import VideoFileClip
import pythonArgumentParser

# output, startTime, endTime, gif
args = pythonArgumentParser.parseArgs()

if (args.gif):
		clip = (VideoFileClip("downloads/" + args.input + ".mp4")
						.subclip(args.startTimeInSeconds, args.endTimeInSeconds)
						.resize(0.3))

		clip.write_gif("gifs/" + args.output + ".gif")
else:
		clip = (VideoFileClip("downloads/" + args.output + ".mp4")
						.subclip(args.startTimeInSeconds, args.endTimeInSeconds))

		clip.write_videofile("videos/" + args.output + ".mp4")
