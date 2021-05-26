#!/bin/bash -x
isHead=1
declare -A dict1
declare -A dict2
declare -A dict3
x1=0
x2=0
x3=0
i1=0
i2=0
i3=0
j1=-
j2=0
j3=0
flip=0
read -p "How many times you want to flip a coin : " num
randomCheck1=$((RANDOM%2))
if [[ $randomCheck1 -eq $isHead ]]
then
	echo "Head is the winner"
	dict1[$x1]=H
	x1=$(($x1+1))
	i1=$(($i1+1))
else
	echo "Tail is the winner"
	dict1[$x1]=F
	j1=$(($j1+1))
fi
echo ${dict1[@]}
while [[ $flip -lt $num ]]
do
	randomCheck1=$((RANDOM%2))
	randomCheck2=$((RANDOM%2))
        if [[ $randomCheck1 -eq $isHead ]]
        then
                if [[ $randomCheck2 -eq $isHead ]]
                then
                        echo "Head is the winner"
                        dict2[$x2]=HH
                        x2=$(($x2+1))
                        i2=$(($i2+1))
                else
                        echo "Tail is the Winner"
                        dict2[$x2]=HT
                        x2=$(($x2+1))
                        j2=$(($j2+1))
                        i2=$(($i2+1))
                fi
        else
                if [[ $randomCheck2 -eq $isHead ]]
                then
                        echo "Head is the winner"
                        dict2[$x2]=TH
                        x2=$(($x2+1))
                        i2=$(($i2+1))
                        j2=$(($j2+1))
                else
                        echo "Tail is the Winner"
                        dict2[$x2]=TT
                        x2=$(($x2+1))
                        j2=$(($j2+1))
                fi
        fi
	flip=$(($flip+1))
done
echo ${dict2[@]}
while [[ $flip -lt $num ]]
do
	randomCheck1=$((RANDOM%2))
	randomCheck2=$((RANDOM%2))
	randomCheck3=$((RANDOM%2))
	if [[ $randomCheck1 -eq $isHead ]]
	then
		if [[ $randomCheck2 -eq $isHead ]]
		then
			if [[ $randomCheck3 -eq $isHead ]]
	        	then
        	        	echo "Head is the winner"
                		dict3[$x3]=HHH
                		x3=$(($x3+1))
                		i3=$(($i3+1))
        		else
                		echo "Tail is the Winner"
                		dict3[$x3]=HHT
                		x3=$(($x3+1))
                		j3=$(($j3+1))
                		i3=$(($i3+1))
			fi
		else
			if [[ $randomCheck3 -eq $isHead ]]
	        	then
        	        	echo "Head is the winner"
                		dict3[$x3]=HTH
                		x3=$(($x3+1))
                		i3=$(($i3+1))
				j3=$(($j3+1))
        		else
                		echo "Tail is the Winner"
                		dict3[$x3]=HTT
                		x3=$(($x3+1))
                		j3=$(($j3+1))
                		i3=$(($i3+1))
			fi
		fi
	else
		if [[ $randomCheck2 -eq $isHead  ]]
		then
        		if [[ $randomCheck3 -eq $isHead ]]
                	then
                        	echo "Head is the winner"
                        	dict3[$x3]=THH
                        	x3=$(($x3+1))
                        	i3=$(($i3+1))
				j3=$(($j3+1))
                	else
                        	echo "Tail is the Winner"
                        	dict3[$x3]=THT
                        	x3=$(($x3+1))
                        	j3=$(($j3+1))
                        	i3=$(($i3+1))
                 	fi
		else
                	if [[ $randomCheck3 -eq $isHead ]]
                	then
                        	echo "Head is the winner"
                        	dict3[$x3]=TTH
                        	x3=$(($x3+1))
                        	i3=$(($i3+1))
                        	j3=$(($j3+1))
                	else
                        	echo "Tail is the Winner"
                        	dict3[$x3]=TTT
                        	x3=$(($x3+1))
                        	j3=$(($j3+1))
                	fi
		fi
	fi
	flip=$(($flip+1))
done
echo ${dict3[@]}
per1=`awk 'BEGIN{print '$j1' / 2  * 100}'`
echo "Singlet percentage : $per1"
per2=`awk 'BEGIN{print '$j2' / '$num'  * 100}'`
echo "Doublet percentage is : $per2"
per3=`awk 'BEGIN{print '$j3' / '$num'  * 100}'`
echo "Triplet percentage is : $per3"
if [[ $per1 -gt $per2 && $per1 -gt $per3 ]]
then
	echo "Winning chance is : $per1"
elif [[ $per2 -gt $per1 && $per2 -gt $per3 ]]
then
	echo "Winning chance is : $per2"
else
	echo "Winning chance is : $per3"
fi
