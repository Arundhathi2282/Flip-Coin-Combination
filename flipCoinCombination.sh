#!/bin/bash -x
isHead=1
declare -A dict
x=0
flip=0
read -p "How many times you want to flip a coin : " num
while [[ $flip -lt $num ]]
do
randomCheck1=$((RANDOM%2))
if [[ $randomCheck1 -eq $isHead ]]
then
	echo "Head is the winner"
	dict[$x]=H
	x=$(($x+1))
	i=$(($i+1))
else
	echo "Tail is the Winner"
	dict[$x]=T
	x=$(($x+1))
	j=$(($j+1))
fi
flip=$(($flip+1))
done
echo ${dict[@]}
per=`awk 'BEGIN{print ('$j' / 10) * 100}'`
echo "Singlet percentage : $per"
