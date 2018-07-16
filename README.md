# Network analyzing scripts

## Description
Just some helpful scripts to analyze in realtime networkpackets in a shell.

* mitm.bash
Execute to spawn the mitmproxy with an ncurses ui and set up propper iptable rules. It decrypts and analyses only http and https traffic on port 80 and port 443.
The root certificate can be installed on the client under: http://mitm.it

* iftop.sh
Check how much traffic goes through other ports then 80 and 443. 

* tcpdump.sh
Log all traffic to a file and to the console. Don't log packets from port 80 or 443 to console but to a file. Also display packet body as hex and ascii.

* externalip.sh
Displays your external ip and checks if you are behind a tor relay. 

* tshark.sh
The same as tcpdump but with more metadata. Dangerous to use with live malware traffic.

* wireshark.sh
Spawns a graphical wireshark instance as normal user and sets apropriate iptable rules. Dangerous to use with live malware traffic.

## Dependencies
sudo apt install iftop tcpdump mitmproxy curl tshark wireshark

## Setting up mitmproxy
You can do it manually like here:
[https://blog.heckel.xyz/2013/07/01/how-to-use-mitmproxy-to-read-and-modify-https-traffic-of-your-phone/](https://blog.heckel.xyz/2013/07/01/how-to-use-mitmproxy-to-read-and-modify-https-traffic-of-your-phone/)

Or you can use my ansible script:
[https://github.com/Luis-Hebendanz/ansible-reversing-vms](https://github.com/Luis-Hebendanz/ansible-reversing-vms)

## Security
These scripts are not secured against command injection. If a normal user can write to the config files he can potentially execute root commands.
