#!/bin/bash
# Enable DHCP in firewall

firewall-cmd --permanent --add-service=dhcp --add-service=dhcpv6
firewall-cmd --reload
