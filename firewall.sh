#!/bin/bash
# Enable http and dns services in firewall and add zone for ftl

firewall-cmd --permanent --add-service=http --add-service=dns
firewall-cmd --permanent --new-zone=ftl
firewall-cmd --permanent --zone=ftl --add-interface=lo
firewall-cmd --permanent --zone=ftl --add-port=4711/tcp
firewall-cmd --reload
