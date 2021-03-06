#!/usr/bin/env bash

BACKUP_LOC="/tmp/prevous-iptables.rules"

function ctrl_c() {
        echo "** Trapped CTRL-C"
	echo "[*] Restoring old rules..."
	sudo iptables-restore < $BACKUP_LOC
	exit
}

INPUT="input_interface.conf"
while IFS= read -r INTERFACE
do
	echo "Listening on interface: $INTERFACE"
	# Back up current rules
	sudo iptables-save > $BACKUP_LOC
	sudo iptables -t nat -F # Flush all rules in nat

	sudo iptables -t nat -A PREROUTING -i $INTERFACE -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
	sudo iptables -t nat -A PREROUTING -i $INTERFACE -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 8080

	echo "[+] Changed iptable rules. Press CTRL+C to go reset changes"
	echo "[*] Saved old rules to ${BACKUP_LOC}"
	trap ctrl_c INT
done < "$INPUT"

mitmproxy -T --host

echo "[*] Restoring old rules..."
sudo iptables-restore < $BACKUP_LOC
