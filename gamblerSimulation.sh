 #!/bin/bash -x
   
	 echo "welcome gamble program"
	#constants
	STAKE=100 
	WIN=1
	NUMBER_OF_DAYS=20
	PERCENT=50
	MIN_AMT=0
	MIN_AMOUNT_FORPLAY=$(( $STAKE*$PERCENT/100))
	MAX_AMOUNT_FORPLAY=$(( $STAKE+$MIN_AMOUNT_FORPLAY))

    #vaiables
	total_Amount=0
	initial_Amount=0
	bet_Amount_Pergame=1
	stake_Valueper_Day=100
	luck_Day=0
	unLuck_Day=0 
	declare -A totalMonthCollection

		function startBetting(){
			check_WinOr_loose=$((RANDOM%2))
			if [ $check_WinOr_loose -eq  $WIN ]
			then
				stake_Valueper_Day=$(( $stake_Valueper_Day+$bet_Amount_Pergame ))
			else
				stake_Valueper_Day=$(( $stake_Valueper_Day-$bet_Amount_Pergame ))
			fi
		}
 
		function startGambling(){
			local count=0
			local amount=0
			for ((day=1;day<=NUMBER_OF_DAYS;day++ ))
			do
				stake_Valueper_Day=$STAKE
				while [ $stake_Valueper_Day -lt  $MAX_AMOUNT_FORPLAY  ] && [ $stake_Valueper_Day -gt  $MIN_AMOUNT_FORPLAY ]
				do
					startBetting
				done

			initial_Amount=$(($stake_Valueper_Day-$STAKE))
			total_Amount=$(($total_Amount+$amount))
			count=$count+1
			totalMonthCollection[$count]=$total_Amount
 
			if [ $initial_Amount -eq $MIN_AMOUNT_FORPLAY ]
			then
				((win++))
			else
				((loose++))
			fi
			done

		}

		function luckyDay(){

			lucky_Day=`for i in ${!totalMonthCollection[@]}
				do echo $i ${totalMonthCollection[$i]}
				done|sort -rn-k3 | head -1`
		}

		function unLuckyDay(){

			unLucky_Day=`for i in ${!totalMonthCollection[@]}
					do echo $i ${totalMonthCollection[$i]}
					done|sort -rn-k3 | tail -1`
	
		}

		function continuePlay(){
			while [ true ]
			do
				startGambling
			
				if [ $total_Amount  -lt $MIN_AMT ]
				then
					break;
				fi
				luckyDay
				unLuckyDay

			done
		}
		
		continuePlay	


