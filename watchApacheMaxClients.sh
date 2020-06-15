#!/bin/bash

HTTP_LISTEN_PORT=80

### MaxClients
DATA="$(curl -s http://127.0.0.1:${HTTP_LISTEN_PORT}/server-info | tr -d '\n')"
SERVER_ROOT="$(echo ${DATA} | grep -Eo 'Server Root:</strong> <tt>.+</tt></dt>' | awk -F '[<>]' '{print $5}')"
MAX_CLIENTS="$(echo ${DATA} | grep -Eo ';MaxRequestWorkers <i>[0-9]+</i></tt></dd>' | awk -F '[<>]' '{print $3}')"

### CurrentClients
DATA="$(curl -s http://127.0.0.1:${HTTP_LISTEN_PORT}/server-status | tr -d '\n')"
CURRENT_CLIENTS="$(echo ${DATA} | grep -Eo '[0-9]+ requests currently being processed' | awk '{print $1}')"

### OUTPUT
echo
date
echo "*** ServerRoot ***"
echo "${SERVER_ROOT}"
echo "*** MAX_CLIENTS ***"
echo "${MAX_CLIENTS}"
echo "*** CURRENT_CLIENTS ***"
echo "${CURRENT_CLIENTS}"
echo
 
exit
