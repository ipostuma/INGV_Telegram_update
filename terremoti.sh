#!/bin/bash
SITO="http://cnt.rm.ingv.it/"
today=`date '+%Y-%m-%d'`
yesterday=`date -d yesterday '+%Y-%m-%d'`
links2 -width 500 -dump -html-tables 0 $SITO > terremoti.txt
cat terremoti.txt | grep -A 1 $today | grep -v $today | awk '{if(NR>1){row="["(NR-1)"] ora "$(1);row=row" magnitudo "$(2);for(i=3; i<(NF-2);i++) {place=place" "$(i);};row=row" "place;row=row" profondita " $(NF-2)"km";row=row" latitudine " $(NF-1);row=row" longitudine " $(NF);print row;}}'>terremoti$today.txt
cat terremoti.txt | grep -A 1 $yesterday | grep -v $yesterday | awk '{row="["NR"] ora "$(1);row=row" magnitudo "$(2);for(i=3; i<(NF-2);i++) {place=place" "$(i);};row=row" "place;row=row" profondita " $(NF-2)"km";row=row" latitudine " $(NF-1);row=row" longitudine " $(NF);print row;}'>terremoti$yesterday.txt
data1=" Update sui terremoti: oggi "$today" - "`cat terremoti$today.txt`
data2=" ieri "$yesterday" - "`cat terremoti$yesterday.txt`
./tg.sh "$1" "$data1"
./tg.sh "$1" "$data2"
