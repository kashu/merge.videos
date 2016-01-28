#!/bin/bash
#Author: kashu
#My Website: https://kashu.org
#Date: 2016-01-29
#Filename: merge.videos.sh
#Description: Merge video files that downloaded via youtube-dl

if ! ls * | grep -sqm1 '_part2.'; then
	exit
elif [ ! -x "/usr/bin/ffmpeg" ]; then
	echo "Could not execute /usr/bin/ffmpeg"
	exit
else
	:
fi

name_list=/tmp/name_list.tmp
input_file=./input_file_name.tmp
finished=/tmp/finished_file_name.tmp
:>$name_list
:>$input_file

mkdir finished._.file &> /dev/null

for F in *_part*; do
	prename1="${F%_part*}"
	count=`ls *_part* | grep -c "$prename1"`
	if [ ${count} -le 1 ]; then
		continue
	fi
	if ! cat $name_list | grep -sqm1 "$F"; then
		ls --sort version *_part* | grep "$prename1" >> $name_list
	fi
done

cat $name_list | while read line; do
	suffix=".${line##*.}"
	prename2="${line%_part*}"
	prename3="${line%-*}"
	name="${line%-*}${suffix}"
	if [ -s "$finished" ]; then
		cat $finished | grep -sq "$prename3" && continue
	fi
	cat $name_list | grep "$prename2" > $input_file
	sed -i "s/^/file '/g" $input_file
	sed -i "s/$/\'/g" $input_file
	if [ -s "${name}" ]; then
		continue
	fi
	/usr/bin/ffmpeg -f concat -i ${input_file} -c copy "${name}"
	if [ -d "./finished._.file" ]; then
		mv "$prename2"* ./finished._.file
	fi
	sed -i "/${prename2}/d" $name_list
	if [ -s "$name" ]; then
		echo "$name" >> $finished
	fi
done
