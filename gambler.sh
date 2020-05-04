#!/bin/bash -x


	STAKE=100
	BET=1
	win=0
	loose=0
	i=0
	echo "Gambler Start with $STAKE & $BET every day" 
	stake=$STAKE
	PERCENT=50
	stackPercent=$(($STAKE * $PERCENT / 100))
	winCount=$(($STAKE + $stackPercent))
	looseCount=`expr $STAKE - $stackPercent`
	while [[ $stake -le $winCount && $stake -ge $looseCount && $i -lt 20 ]]
	do
			random=$((RANDOM%2))
			if [ $random -eq 1 ]
			then
				echo "Win"
				stake=$(($stake+1))
				win=$(($win+1))
			else
				echo "Loose"
				stake=$(($stake-1))
				loose=$(($loose+1))
			fi
	done
echo "Total Win Is: $win & Total Loose Is: $loose"
