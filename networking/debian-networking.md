Linux Network Troubleshooting for Debian/Ubuntu:

Check ip address:

	`ifconfig` or `ip a`

	- "lo" is loopback.

	- "eth" or "ens" is the interface for your network.

	- Log IP address of eth/ens.

	**You will need this IP address when you move behind the firewall.**



If no IP address:

	`service networking restart` or `systemctl restart networking`

	- Manually bring down an interface and bring it back up

	`ifconfig <interface> down`

	`ifconfig <interface> up`

Configure DHCP:


