#!/bin/bash -x
isHead=1
declare -A dict
x=0
flip=0
read -p "How many times you want to flip a coin : " num
while [[ $flip -lt $num ]]
do
randomCheck1=$((RANDOM%2))
randomCheck2=$((RANDOM%2))
if [[ $randomCheck1 -eq $isHead ]]
then
	if [[ $randomCheck2 -eq $isHead ]]
	then
		if [[ $randomCheck2 -eq $isHead ]]
	        then
        	        echo "Head is the winner"
                	dict[$x]=HHH
                	x=$(($x+1))
                	i=$(($i+1))
        	else
                	echo "Tail is the Winner"
                	dict[$x]=HHT
                	x=$(($x+1))
                	j=$(($j+1))
                	i=$(($i+1))
		fi
	else
		if [[ $randomCheck2 -eq $isHead ]]
	        then
        	        echo "Head is the winner"
                	dict[$x]=HTH
                	x=$(($x+1))
                	i=$(($i+1))
			j=$(($j+1))
        	else
                	echo "Tail is the Winner"
                	dict[$x]=HTT
                	x=$(($x+1))
                	j=$(($j+1))
                	i=$(($i+1))
		fi
	fi
else
	if [[ $randomCheck2 -eq $isHead  ]]
	then
        	if [[ $randomCheck2 -eq $isHead ]]
                then
                        echo "Head is the winner"
                        dict[$x]=THH
                        x=$(($x+1))
                        i=$(($i+1))
			j=$(($j+1))
                else
                        echo "Tail is the Winner"
                        dict[$x]=THT
                        x=$(($x+1))
                        j=$(($j+1))
                        i=$(($i+1))
                fi
	else
                if [[ $randomCheck2 -eq $isHead ]]
                then
                        echo "Head is the winner"
                        dict[$x]=TTH
                        x=$(($x+1))
                        i=$(($i+1))
                        j=$(($j+1))
                else
                        echo "Tail is the Winner"
                        dict[$x]=TTT
                        x=$(($x+1))
                        i=$(($i+1))
                fi
	fi

fi
flip=$(($flip+1))
done
echo ${dict[@]}
per=`awk 'BEGIN{print ('$j' / '$num') * 100}'`
echo "Singlet percentage : $per"
echo "Doublet percentage is : $per"
echo "Triplet percentage is : $per"
