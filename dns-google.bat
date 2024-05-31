netsh interface ipv4 set dns "Ethernet" static 8.8.8.8 primary validate=no
netsh interface ipv4 add dns "Ethernet" 8.8.4.4 validate=no

netsh interface ipv6 set dns "Ethernet" static 2001:4860:4860::8888 primary validate=no
netsh interface ipv6 add dns "Ethernet" 2001:4860:4860::8844 validate=no

ipconfig /flushdns