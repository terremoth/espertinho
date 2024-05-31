netsh interface ipv4 set dns "Ethernet" static 94.140.14.14 primary validate=no
netsh interface ipv4 add dns "Ethernet" 94.140.15.15 validate=no

netsh interface ipv6 set dns "Ethernet" static 2a10:50c0::ad1:ff primary validate=no
netsh interface ipv6 add dns "Ethernet" 2a10:50c0::ad2:ff validate=no

ipconfig /flushdns