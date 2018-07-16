# Network analyzing scripts

## Description
Just some helpful scripts to analyze in realtime networkpackets in a shell.

## Dependencies
sudo apt install iftop tcpdump mitmproxy curl tshark wireshark

## Setting up mitmproxy

You can do it manually like here:
[https://blog.heckel.xyz/2013/07/01/how-to-use-mitmproxy-to-read-and-modify-https-traffic-of-your-phone/](https://blog.heckel.xyz/2013/07/01/how-to-use-mitmproxy-to-read-and-modify-https-traffic-of-your-phone/)

Or you can use my ansible script:
[https://github.com/Luis-Hebendanz/ansible-reversing-vms](https://github.com/Luis-Hebendanz/ansible-reversing-vms)

## Security
These scripts are not secured against command injection. If a normal user can write to the config files he can potentially execute root commands.
