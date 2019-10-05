#!/bin/sh

#Flush iptables rules
iptables -F

#Allow local loopback
iptables -A INPUT -i lo -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -o lo -s 127.0.0.1 -j ACCEPT

#Incomeing TCP 80,443,22 [Host server, Add ports as needed]
iptables -A INPUT -p tcp -m multiport --dports 80,443,22 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 80,443,22 -j ACCEPT

#Outgoing UDP [DNS client]
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

#Allow outgoing TCP 80,443 [To download from web]
iptables -A OUTPUT -p tcp -m multiport --doprts 80,443,22 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --sports 80,443,22 -j ACCEPT

#ICMP type 0 echo reply
iptables -A INPUT -p ICMP --icmp-type 0 -j ACCEPT
iptables -A OUTPUT -p ICMP --icmp-type 0 -j ACCEPT

#ICMP type 8 echo request
iptables -A INPUT -p ICMP --icmp-type 8 -j ACCEPT
iptables -A OUTPUT -p ICMP --icmp-type 8 -j ACCEPT

#Set policies to DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
