#!/bin/bash
echo "1. Get students total mark"
echo "2. Get list of student who failed Final"
echo "3. Get list of student who passed Mid1"
echo -n "What do you want the program to do: "
read choice
if [[ $choice -eq 1 ]]
then
	cat ./studentList.txt | awk '
	BEGIN {
		{getline} #skip the first line
		printf "Name\tTotal\n"
	}
	{
		printf "%s\t%s\n",$1,$3+$4+$5
	}'
elif [[ $choice -eq 2 ]]
then
	cat ./studentList.txt | awk '
	BEGIN {
		{getline}
		printf "Name\tGender\n"
	}
	{
		if ($5/50*100<70)
			printf "%s\t%s\n",$1,$2
	}'
elif [[ $choice -eq 3 ]]
then
	cat ./studentList.txt | awk '
	BEGIN {
		{getline}
		printf "Name\tGender\n"
	}
	{
		if ($3/25*100>70)
			printf "%s\t%s\n",$1,$2
	}'
else
	echo "Invalid Option"
fi
