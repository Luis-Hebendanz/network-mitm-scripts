#!/usr/bin/env bash

INPUT="input_interface.conf"
while IFS= read -r INTERFACE
do
	echo "Listening on interface: $INTERFACE"
	sudo iftop -f "not port 443 and not port 80" -i $INTERFACE -P -N -n
done < "$INPUT"

