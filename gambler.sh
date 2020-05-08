#!/bin/bash -x

echo "******** Gambler Simulator *******"

#UC1 gambler starts with 100 and bets 1 everyday
bet=1
stake=100
days=20

declare -A gameRecord

#uc2 check win or loss

#uc3 calulate : if won or loat 50% stake resign for the day

#uc4 after playing for 20 days total amount won or lost
function Result()
{
for(( day=1; day<=$days; day++))
do
	STAKE=100
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
	gameRecord["Day_$day"]=$win" "$loss
	done
}

Result

for i in ${!gameRecord[@]}
do
	echo "$i ${gameRecord[$i]}"
done | sort -k2 -n

