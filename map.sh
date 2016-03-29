#!/bin/bash
#MYTEST="http://maps.google.com/maps/api/staticmap?size=512x512&maptype=roadmap&markers=color%3Ared%7C53.5375%2C-113.64&markers=color%3Ared%7C54.275%2C-120.32&markers=color%3Ablue%7C39.0%2C37.264&sensor=false"
#?q=Hello world@53,-2&
today=`date '+%Y-%m-%d'`
yesterday=`date -d yesterday '+%Y-%m-%d'`
MYBASE="http://www.ianpostuma.it/MyPlayGround/terremotiOpenMap.html?"
cat terremoti$yesterday.txt | sed -e 's/ora/\nora/g' | grep "ora" | awk -v r=$yesterday '{print "q="r","$2","$4","$6"@"$8","$10"&"}'| tr -d "\n" > dump
cat terremoti$today.txt | sed -e 's/ora/\nora\[/g' | grep "ora" | awk -v r=$yesterday '{print "q="r","$2","$4","$6"@"$8","$10"&"}' | tr -d "\n" >> dump
MYWAYS=`cat dump`
rm dump
echo $MYBASE$MYWAYS
firefox $MYBASE$MYWAYS
