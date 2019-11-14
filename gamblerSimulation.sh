#!/bin/bash -x

   StakeValueperDay=100
   betAmountperGame=1
   win=0
   loose=0

  function bet()
  {
    checkWinOrloose=$((RANDOM%2))
    if [ $checkWinOrloose -eq 1 ]
    then
    win=$(( $win+1 ))
    else
    loose=$(( $loose+1))
    fi
 }

 bet
