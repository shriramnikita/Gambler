#!/bin/bash -x

echo "******** Gambler Simulator *******"

#UC1 gambler starts with 100 and bets 1 everyday
bet=1
stake=100
days=20

declare -A gambler

#uc2 check win or loss

#uc3 calulate : if won or loat 50% stake resign for the day

#uc4 after playing for 20 days total amount won or lost
function Result()
{
for(( day=1; day<=$days; day++))
do
	stake=100
	win=0
	loss=0
	LOW_LIMIT=$(( $stake / 2 ))
	HIGH_LIMIT=$(($stake / 2 + $stake))

	while [[ $LOW_LIMIT -lt $stake && $HIGH_LIMIT -gt $stake ]]
	do
		winLossResult=$((RANDOM%2))
		if [ $winLossResult -eq 1 ]
		then
			stake=$(($stake+1))
			win=$(($win+1))
		else
			stake=$(($stake-1))
			loss=$(($loss-1))
		fi
	done
	outCome=$(( $stake - 100 ))
	gambler["Day_$day"]=$outCome
	done
}


#us5 calculate monthly loss or win

function dailyProfit()
{
for((j=1;j<=20;j++))
do
   echo "Day_$j ${gambler[Day_$j]}"
done
}


#Uc6 calculate lucky unlucky day

function luckiestUnlukiest()
{
   gambler[Day_0]=0

   	for((j=1;j<=20;j++))
   do
		lastDay=$(( $j - 1 ))
      gambler[Day_$j]=$(( ${gambler[Day_$j]} + ${gambler[Day_$lastDay]} ))
		echo  "Day$j	"${gambler[Day_$j]}
   done | sort -k2 -nr |awk 'NR==20{print "Unluckiest: " $0}AND NR==1{print "Luckiest: " $0}'
}


function Gambler()
{
Result
dailyProfit
luckiestUnlukiest

profit=$( printf "%s\n" ${gambler[@]} | awk '{sum+=$0}END{print sum}')
echo "Profit " $profit

continuePlaying $profit 

}

#uc7 continue playing if won
function continuePlaying(){
	profit=$1
	if [ $profit -gt 0 ]
	then
		Gambler
	else
		echo "Thanks for playing!!!"
	fi
}

Gambler
