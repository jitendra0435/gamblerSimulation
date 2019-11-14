  #!/bin/bash -x

   STAKE=100 
   totalAmount=0
   betAmountpergame=1
   numberOfdaysforplay=20
   win=0
   loose=0
   stakeValueperDay=100
   percent=50
   numberofdayloose=0
   numberofdaywin=0
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
     for ((day=1;day<=20;day++ ))
      do
       dictionary
       stakeValueperDay=100 
       while [ $stakeValueperDay -lt  $MAXAMOUNTFORPLAY  ] && [ $stakeValueperDay -gt  $MINAMOUNTFORPLAY ]
        do
        bet
      done
     done
   }

  function dictionary
  {
       if [ $stakeValueperDay -eq $MINAMOUNTFORPLAY ]
        then
        numberofdaywin=$(($numberofdaywin+1))
        dayHistory[$day]=$(($stakeValueperDay-$STAKE))
        totalAmount=$(($totalAmount-$MINAMOUNTFORPLAY))

        else
        numberofdayloose=$(($numberofdayloose+1))
        dayHistory[$day]=$(($stakeValueperDay-$STAKE))
        totalAmount=$(($totalAmount+$stakeValueperDay-$STAKE))
      fi

  }

  gambler
  echo ${dayHistory[@]}
  echo "number of day looose" $numberofdayloose
  echo "number of day win " $numberofdaywin
