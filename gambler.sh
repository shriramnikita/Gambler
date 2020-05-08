#!/bin/bash -x

echo "******** Gambler Simulator *******"

#UC1 gambler starts with 100 and bets 1 everyday
bet=1
stake=100


#uc2 check win or loss
winLossResult=$((RANDOM%2))

if [ $winLossResult -eq 1 ]
then
	echo "Win"
else
	echo "Loss"
fi
