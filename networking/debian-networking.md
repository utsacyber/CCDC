Linux Network Troubleshooting for Debian/Ubuntu:

Check ip address: ``ifconfig`` or ``ip a``

**You will need this IP address when you move behind the firewall.**

- "lo" is loopback.

- "eth" or "ens" is the interface for your network.

- Write down IP address of eth/ens.



If no IP address: ``service networking restart`` or ``systemctl restart network``

Manually bring down an interface and bring it back up:

``ifconfig <interface> down``

``ifconfig <interface> up``


Find Interfaces in file system: ``cat /etc/network/interfaces``


Configure DHCP:


