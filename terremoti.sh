#!/bin/bash
SITO="http://cnt.rm.ingv.it/"
today=`date '+%Y-%m-%d'`
yesterday=`date -d yesterday '+%Y-%m-%d'`
links2 -width 500 -dump -html-tables 0 $SITO > terremoti.txt
cat terremoti.txt | grep -A 1 " "$today | grep -v $today | awk '{row="["NR"] ora "$(1);row=row" magnitudo "$(2);for(i=3; i<(NF-2);i++) {place=place" "$(i);};row=row" "place;place="";row=row" profondita " $(NF-2)"km";row=row" latitudine " $(NF-1);row=row" longitudine " $(NF) " ";print row;row="";}' | tr -d "\n" >terremoti$today.txt
cat terremoti.txt | grep -A 1 " "$yesterday | grep -v $yesterday | awk '{row="["NR"] ora "$(1);row=row" magnitudo "$(2);for(i=3; i<(NF-2);i++) {place=place" "$(i);};row=row" "place; place="" ;row=row" profondita " $(NF-2)"km";row=row" latitudine " $(NF-1);row=row" longitudine " $(NF) " ";print row;row="";}' | tr -d "\n" > terremoti$yesterday.txt
#cat terremoti$today.txt
#cat terremoti$yesterday.txt
#cat terremoti$today.txt | tr -d "\n" > terremoti$today.txt
#cat terremoti$yesterday.txt | tr -d "\n"  > terremoti$yesterday.txt2
data1=" Update sui terremoti: oggi "$today" - "`cat terremoti$today.txt`
data2=" ieri "$yesterday" - "`cat terremoti$yesterday.txt`
echo -e $data1
echo -e $data2
./tg.sh "$1" "$data1"
./tg.sh "$1" "$data2"
