#!/bin/sudo bash

if [[ $1 == "-h" || $1 == "--help" ]]; then
	echo "$0 [[input]] [[-n]]"
	echo "-n: Don't attempt to transfer the converted m4a file to the iphone (helpful if you do not have an iphone plugged in right now"
	exit
fi


if [[ $# -ne 1 && $# -ne 2 ]]; 
	then echo "Wrong number of arguments. Use -h for help"
	exit
fi

TRANSFER=0

if [[ $1 == "-n" ]]; then
	IN=$2
	TRANSFER=1
else
	IN=$1
	if [[ $2 == "-n" ]]; then
		TRANSFER=1
	fi
fi

echo From: $IN
ffmpeg -hide_banner -loglevel error -t 50 -i $IN -vn -c:a aac -b:a 128k $IN.m4a

if [[ $TRANSFER -eq 1 ]]; then exit; fi

umount ios_fuse

rm -r ios_fuse

mkdir ios_fuse

ifuse ios_fuse/

SIZE=$(ffprobe -i $IN -v quiet -print_format compact=print_section=0:nokey=1:escape=csv -show_entries format=duration)

mv $IN.m4a ios_fuse/iTunes_Control/Ringtones



python3 plist.py $IN.m4a $SIZE

