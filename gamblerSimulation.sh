#!/bin/bash -x

   stakeValueperDay=100
   betAmountperGame=1
   MINAMOUNTFORPLAY=$(( $stakeValueperDay/ 2))
   MAXAMOUNTFORPLAY=$(( $stakeValueperDay+$MINAMOUNTFORPLAY))
   win=0
   loose=0
  function bet()
  {
    checkWinOrloose=$((RANDOM%2))
    if [ $checkWinOrloose -eq 1 ]
    then
    win=$(( $win+1 ))
    stakeValueperDay=$(( $stakeValueperDay+1 ))
    else
    loose=$(( $loose+1))
    stakeValueperDay=$(( $stakeValueperDay-1 ))
    fi
 }

 function gambler
 {
  while [ $stakeValueperDay -lt  $MAXAMOUNTFORPLAY  ] && [ $stakeValueperDay -gt  $MINAMOUNTFORPLAY ]
  do
  bet
  done
 }

gambler



 
