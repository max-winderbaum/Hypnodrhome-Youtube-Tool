from pydub import AudioSegment
import pythonArgumentParser

# output, startTime, endTime, gif
args = pythonArgumentParser.parseArgs()

# convert seconds to milliseconds
startTime = args.startTimeInSeconds * 1000

if (args.endTimeInSeconds is not None):
		endTime = args.endTimeInSeconds * 1000

sound = AudioSegment.from_mp3("downloads/" + args.input + ".mp3")

if (args.endTimeInSeconds is not None):
		croppedSound = sound[startTime:endTime]
else:
		croppedSound = sound[startTime:]

croppedSound.export("audio/" + args.output + ".mp3", format="mp3")
