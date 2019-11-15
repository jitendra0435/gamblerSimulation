  #!/bin/bash -x

   STAKE=100 
   totalAmount=0
   amount=0
   betAmountpergame=1
   numberOfdaysforplay=20
   win=0
   loose=0
   stakeValueperDay=100
   percent=50
   numberofdayloose=0
   numberofdaywin=0
   luckday=0
   unLuckDay=0 
   count=0
   MINAMOUNTFORPLAY=$(( $STAKE*$percent/100))
   MAXAMOUNTFORPLAY=$(( $STAKE+$MINAMOUNTFORPLAY))

   declare -A totalAmount1
   function bet()
   {
     checkWinOrloose=$((RANDOM%2))
     if [ $checkWinOrloose -eq 1 ]
      then
       stakeValueperDay=$(( $stakeValueperDay+$betAmountpergame ))
      else
       stakeValueperDay=$(( $stakeValueperDay-$betAmountpergame ))
     fi
   }

    function gambler
    {
     for ((day=1;day<=20;day++ ))
      do
       stakeValueperDay=100
       while [ $stakeValueperDay -lt  $MAXAMOUNTFORPLAY  ] && [ $stakeValueperDay -gt  $MINAMOUNTFORPLAY ]
        do
         bet
        done
         amount=$(($stakeValueperDay-$STAKE))
         totalAmount=$(($totalAmount+$amount))
         count=$(($count+1))
         totalAmount1[$count]=$totalAmount
        echo $totalAmount 
 
        if [ $amount -eq $MINAMOUNTFORPLAY ]
         then
            ((win++))
         else
            ((loose++))
        fi
        done
       luckyDay=$(printf "%s\n" ${totalAmount1[@]} | sort -nr | head -1 )
       unLuckyDay=$(printf "%s\n" ${totalAmount1[@]} |sort -nr | tail -1 )    
       echo "lucliest day" ${totalAmount1[$luckyDay]}
       echo "unluckiestsd day" ${totalAmount1[$unLuckyDay]}
    
 }
 gambler

