#!/bin/bash

SS=$(curl -s http://127.0.0.1/server-info | tr -d '\n')
SB=$(echo ${SS} | grep -Eo ';MaxRequestWorkers <i>[0-9]+</i></tt></dd>')

##########
echo "${SB}"
##########

echo "$(echo ${SS} | grep -Eo ';MaxRequestWorkers <i>[0-9]+</i></tt></dd>' | awk -F '[<>]' '{print $3}')"

 
exit
