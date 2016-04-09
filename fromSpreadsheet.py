import urllib3
import StringIO
import csv
from subprocess import call

# Note: add /export?format=csv&id={{id}}&gid=0 to the end of your normal url
url = "https://docs.google.com/spreadsheets/d/1siGn-s6jjnk1kt5jG8o2jdzB9ONV28RDfqEkDrWhloo/export?format=csv&id=1siGn-s6jjnk1kt5jG8o2jdzB9ONV28RDfqEkDrWhloo&gid=0"
http = urllib3.PoolManager()
request = http.request('GET', url)
csvFile = request.data

# Kill the first line
csvFile = '\n'.join(csvFile.split('\n')[1:])

reader = csv.reader(csvFile.split('\n'), delimiter=',')
for row in reader:
 if (len(row) == 5):
	print 'Processing row: ' + ','.join(row)
	url = row[0]
	name = row[1]
	startTime = row[2]
	endTime = row[3]
	type = row[4]

	if (type == 'gif'):
	 print 'Converting to gif...' + url
	 call(['bash', './videoToGif.sh', '--video', url, '--output', name, '--startTime', startTime, '--endTime', endTime])
	elif (type == 'audio'):
	 print 'Converting to audio file...'
	 call(['bash', './videoToMp3.sh', '--video', url, '--output', name])
	else:
	 print 'Processing video...'
	 call(['bash', './getVideo.sh', '--video', url, '--output', name, '--startTime', startTime, '--endTime', endTime])
