#!/bin/bash -x

echo "******** Gambler Simulator *******"

#UC1 gambler starts with 100 and bets 1 everyday
bet=1
stake=100


#uc2 check win or loss

#uc3 calulate : if won or loat 50% stake resign for the day


function Result()
{
LOW_LIMIT=$(( $stake / 2 ))
HIGH_LIMIT=$(($stake / 2 + $stake))
	
	while [[ $LOW_LIMIT -lt $stake && $HIGH_LIMIT -gt $stake ]]
	do
		winLossResult=$((RANDOM%2))
		if [ $winLossResult -eq 1 ]
		then
			stake=$(($stake+1))
		else

			stake=$(($stake-1))
		fi
	done
	echo "Stake:- "$stake
}
Result
