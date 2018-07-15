#!/usr/bin/env bash

INPUT="input_interface.conf"
COUNTER=0
DIR="out/"
FILENAME=$DIR$(date +%d.%m.%y)"_dump_"$COUNTER".pcap"

while [ -f $FILENAME ]; do
	let COUNTER=$COUNTER+1
	FILENAME=$DIR$COUNTER"_"$(date +%d.%m.%y)"_dump.pcap"
done

function ctrl_c() {
	echo "** Trapped CTRL-C"
	echo "Writing to: " $FILENAME
}

echo "Writing to: " $FILENAME
trap ctrl_c INT

while IFS= read -r INTERFACE
do

tshark -i $INTERFACE -f "not stp" -w - | tee $FILENAME | tshark -Y "(tcp.port != 443) and (tcp.port != 80)" -r -
done < "$INPUT"
