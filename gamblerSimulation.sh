  #!/bin/bash -x

   STAKE=100 
   totalAmount=0
   betAmountpergame=1
   numberOfdaysforplay=20
   win=0
   loose=0
   stakeValueperDay=0
   percent=50
   MINAMOUNTFORPLAY=$(( $STAKE*$percent/100))
   MAXAMOUNTFORPLAY=$(( $STAKE+$MINAMOUNTFORPLAY))

   declare -A dayHistory

   function bet()
   {

     checkWinOrloose=$((RANDOM%2))
     if [ $checkWinOrloose -eq 1 ]
      then
      win=$(( $win+1))
      stakeValueperDay=$(( $stakeValueperDay+$betAmountpergame ))
      else
      loose=$(( $loose+1))
      stakeValueperDay=$(( $stakeValueperDay-$betAmountpergame ))
     fi
   }

    function gambler
    {
     stakeValueperDay=100
     for ((day=1;day<=20;day++ ))
      do 
       while [ $stakeValueperDay -lt  $MAXAMOUNTFORPLAY  ] && [ $stakeValueperDay -gt  $MINAMOUNTFORPLAY ]
        do
        bet
        dictionary
      done
     done
   }




   function dictionary
   {
      if [ $stakeValueperDay -eq $MINAMOUNTFORPLAY ]
       then

        dayHistory[$day]=$(($stakeValuperDay-$STAKE))
        totalAmount=$(($totalAmount-$MINAMOUNTFORPLAY))
        else

        dayHistory[$day]=$(($stakeValueperDay-$STAKE))
        totalAmount=$(($totalAmount+$stakeValueperDay-$STAKE))
      fi

   }
 gambler



