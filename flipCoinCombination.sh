#!/bin/bash -x
isHead=1
randomCheck1=$((RANDOM%2))
if [[ $randomCheck1 -eq $isHead ]]
then
	echo "Head is the winner"
else
	echo "Tail is the Winner"
fi
