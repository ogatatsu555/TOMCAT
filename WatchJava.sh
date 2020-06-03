#!/bin/bash

echo "*** OldUse(%) ***"
java -jar jmx-cmdclient-0.1.1.jar localhost:8777 "java.lang:type=MemoryPool,name=G1 Old Gen" "Usage" | tail -n 1 | awk -F',' '{printf( "scale=5;%s / %s * 100\n", $5, $2 );}' | bc

echo "*** FullGC Count ***"
java -jar jmx-cmdclient-0.1.1.jar localhost:8777 "java.lang:name=G1 Old Generation,type=GarbageCollector" "CollectionCount" | tail -n 1 | cut -d',' -f 2

echo "*** FullGC Time(ms) ***"
java -jar jmx-cmdclient-0.1.1.jar localhost:8777 "java.lang:name=G1 Old Generation,type=GarbageCollector" "CollectionTime" | tail -n 1 | cut -d',' -f 2

exit

