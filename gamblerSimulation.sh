  #!/bin/bash -x
   
	 echo "welcome gamble program"
	 #constants
    STAKE=100 
    NUMBER_OF_DAYS=20
    PERCENT=50
    MIN_AMOUNT_FORPLAY=$(( $STAKE*$PERCENT/100))
    MAX_AMOUNT_FORPLAY=$(( $STAKE+$MIN_AMOUNT_FORPLAY))
    #vaiables
    total_Amount=0
    amount=0
    bet_Amount_Pergame=1
    stake_Valueper_Day=100
    number_Of_DayLoose=0
    number_Of_Day_Win=0
    luck_Day=0
    unLuck_Day=0
    count=0 

    declare -A totalAmount1

     
  
	 function startBetting()
    {
   	  checkWinOrloose=$((RANDOM%2))
    	  if [ $checkWinOrloose -eq 1 ]
     	  then
     		  stake_Valueper_Day=$(( $stake_Valueper_Day+$bet_Amount_Pergame ))
     	  else
     	 	  stake_Valueper_Day=$(( $stake_Valueper_Day-$bet_Amount_Pergame ))
    	  fi
    }
 

    function gambling()
    { 
	    while[ $totalAmount -gt 0 ]
       do
   	 for ((day=1;day<=NUMBER_OF_DAYS;day++ ))
     	 do
      	 stake_Valueper_Day=100
      	 while [ $stake_Valueper_Day -lt  $MAX_AMOUNT_FORPLAY  ] && [ $stake_Valueper_Day -gt  $MIN_AMOUNT_FORPLAY ]
       	 do
        	 startBetting
       	 done
        	 amount=$(($stake_Valueper_Day-$STAKE))
        	 total_Amount=$(($total_Amount+$amount))
          count=$count+1
        	 totalAmount1[$count]=$total_Amount
        	 echo $total_Amount 
 
       	 if [ $amount -eq $MIN_AMOUNT_FORPLAY ]
           then
            ((win++))
          else
            ((loose++))
     	    fi
          done
  
          lucky_Day=`for i in ${!totalAmount1[@]} 
                      do
                         echo $i ${totalAmount1[$i]}
                      done|sort -rn-k3 | head -1`
          unLucky_Day=`for i in ${!totalAmount1[@]} 
                       do
                         echo $i ${totalAmount1[$i]}
                       done|sort -rn-k3 | tail -1`
        done
   

 }
 gambling
  


