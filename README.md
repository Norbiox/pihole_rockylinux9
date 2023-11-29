# pihole_rockylinux9
Procedure of installing PiHole on Rocky Linux 9 with SELinux that has worked for me

## Prerequisites

- a machine with Rocky Linux 9 installed and SELinux enabled
- access to root user
- a working internet connection

## Detailed steps

1. Set static IP address using `nmtui`
2. Set context for PiHole installator: `export PIHOLE_SELINUX=true && export PIHOLE_SKIP_OS_CHECK=true`
3. Download and inspect PiHole installation script `curl -sSL https://install.pi-hole.net > pihole_install.sh`
4. Make script runnable `chmod +x pihole_install.sh`
5. Run script `bash pihole_install.sh` and proceed along the instructions until PiHole is installed
6. Restore default SELinux security contexts for `/var/www` and `/opt/pihole` with command `restorecon -Rv /var/www && restorecon -Rv /opt/pihole`
7. Run `./selinux.sh` script to create SELinux rule for PiHole (special thanks to creator Nikola Krgovic)
8. Restart FTL service with `systemctl restart pihole-FTL`
9. Run `./firewall.sh` script to create firewall rules for PiHole
10. (optionally) run `./firewall_dhcp.sh` script to create firewall rules for PiHole DHCP

You should now be able to enter your PiHole admin interface at `http://<your_rocky_machine_ip>/admin`
