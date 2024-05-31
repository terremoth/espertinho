netsh interface ipv4 set dns "Ethernet" static 208.67.222.222 primary validate=no
netsh interface ipv4 add dns "Ethernet" 208.67.220.220 validate=no

netsh interface ipv6 set dns "Ethernet" static 2620:119:35::35 primary validate=no
netsh interface ipv6 add dns "Ethernet" 2620:119:53::53 validate=no

ipconfig /flushdns