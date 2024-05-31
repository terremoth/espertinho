netsh interface ipv4 set dns "Ethernet" static 1.1.1.1 primary validate=no
netsh interface ipv4 add dns "Ethernet" 1.0.0.1 validate=no

netsh interface ipv6 set dns "Ethernet" static 2606:4700:4700::1111 primary validate=no
netsh interface ipv6 add dns "Ethernet" 2606:4700:4700::1001 validate=no

ipconfig /flushdns