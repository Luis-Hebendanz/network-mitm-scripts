#!/usr/bin/env bash

BACKUP_LOC="/tmp/prevous-iptables.rules"
OUTPUT="output_interface.conf"

function ctrl_c() {
        echo "** Trapped CTRL-C"
	echo "[*] Restoring old rules..."
	sudo iptables-restore < $BACKUP_LOC
	exit
}


while IFS= read -r INTERFACE
do
	sudo iptables-save > $BACKUP_LOC
	sudo iptables -t nat -F # Flush all rules in nat
	sudo iptables -t nat -A POSTROUTING -o $INTERFACE -j MASQUERADE

	echo "[+] Changed iptable rules. Press CTRL+C to go reset changes"
	echo "[*] Saved old rules to ${BACKUP_LOC}"
	trap ctrl_c INT
done < "$OUTPUT"

wireshark &>/dev/null

echo "[*] Restoring old rules..."
sudo iptables-restore < $BACKUP_LOC

