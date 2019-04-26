#!/bin/bash
Year=`date +%Y`
Month=`date +%m`
Day=`date +%d`
Hour=`date +%H`
Minute=`date +%M`
Second=`date +%S`
logFileName="bitcoin-start-$Year-$Month-$Day-$Hour-$Minute-$Second.log"
echo "start of log" &> $logFileName
date &>> $logFileName

sleep 10
/home/pi/bitcoin/src/bitcoind -daemon &>> $logFileName
