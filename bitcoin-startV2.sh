#!/bin/bash
Year=`date +%Y`
Month=`date +%m`
Day=`date +%d`
Hour=`date +%H`
Minute=`date +%M`
Second=`date +%S`
bitcoinLogFileName="/home/blackbox/logs/bitcoin-start-$Year-$Month-$Day-$Hour-$Minute-$Second.log"
electrsLogFileName="/home/blackbox/logs/electrs-start-$Year-$Month-$Day-$Hour-$Minute-$Second.log"
echo "bitcoinLogFileName" &> $bitcoinLogFileName
echo "electrsLogFileName" &> $electrsLogFileName
date &>> $bitcoinLogFileName
date &>> $electrsLogFileName

sleep 10
echo "starting bitcoind"
/home/blackbox/bitcoin/src/bitcoind -daemon &>> $bitcoinLogFileName

sleep 60
echo "Starting electrs"
/home/blackbox/electrs/target/release/electrs -vvv --timestamp --db-dir /home/blackbox/electrs/db --electrum-rpc-addr="127.0.0.1:50001" &>> $electrsLogFileName
