#!/bin/bash
Year=`date +%Y`
Month=`date +%m`
Day=`date +%d`
Hour=`date +%H`
Minute=`date +%M`
Second=`date +%S`
logFileName="bitcoin-stop-$Year-$Month-$Day-$Hour-$Minute-$Second.log"
echo "start of log" &> $logFileName
date &>> $logFileName

/usr/local/bin/bitcoin-cli stop &>> $logFileName
sleep 60 &>> $logFileName
tail -n 20 ~/.bitcoin/debug.log &>> $logFileName


sudo apt-get update &>> $logFileName
sudo apt-get -y upgrade &>> $logFileName
sudo apt-get -y dist-upgrade &>> $logFileName
sudo apt-get clean &>> $logFileName
sudo apt-get -y autoremove &>> $logfileName

sudo reboot  &>> $logFileName
