#!/bin/bash
now=$(date)
to=$1
body=$2
LOGFILE="/home/ian/tg.log"
telegram-cli -W server.pub -RD -e "msg $to $body"
echo "$now Recipient=$to Message=$body" >> ${LOGFILE}
echo "Finished" >> ${LOGFILE}
