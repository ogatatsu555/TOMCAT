#!/bin/bash

SS=$(curl -s http://127.0.0.1/server-status | tr -d '\n')
SB=$(echo ${SS} | grep -Eo '</dt></dl><pre>.*</pre><p>')

##########
#echo $(echo ${SS} | grep -Eo '[0-9]+ requests currently being processed, [0-9]+ idle workers')
#echo "${SB}"
#
#for i in _ S R W K D C L G I;do
#  COUNT=$(echo "${SB}" | grep -Eo "${i}" | wc -l)
#  echo "${i} => ${COUNT}"
#done
#
#COUNT=$(echo "${SB}" | grep -Eo '\.' | wc -l)
#echo ". => ${COUNT}"
##########

echo "$(echo ${SS} | grep -Eo '[0-9]+ requests currently being processed' | awk '{print $1}')"

 
exit
