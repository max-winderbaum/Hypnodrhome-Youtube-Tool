import argparse

def parseArgs():
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

		args.startTimeInSeconds = getSeconds(args.startTime)

		if (args.endTime != ''):
				args.endTimeInSeconds = getSeconds(args.endTime)
		else:
				args.endTimeInSeconds = None

		return args


def getSeconds(timeString):
		list = timeString.split(':')
		if (len(list) == 3):
				hours = float(list[0])
				mins = float(list[1])
				return hours * 60 * 60 + mins * 60 + float(list[2])
		if (len(list) == 2):
				mins = float(list[0])
				return mins * 60 + float(list[1])
		else:
				return float(timeString)
