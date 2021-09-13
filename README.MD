# mp3*2*iphone

mp3*2*iphone is a tool to turn any audio file that ffmpeg can work with (not just mp3) into an iphone ringtone  

`cd` into the directory of this tool and run it as so  

`./conv.sh <file.mp3>`  

This will crop the audio to 40 seconds and then mount the filesystem of an iphone and upload the ringtone, then register it in the Ringtones plist

If you specify -n it will not attempt to transfer the audio to an iPhone
