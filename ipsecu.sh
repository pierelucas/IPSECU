#!/bin/bash
# IPSECU - JUST SET THE WHITELIST FOR BACKEND, SSH & CLOUDFLARE
# Script-Name: ipsecu.sh
# Autor: https://github.com/pierelucas      //      https://github.com/blacktermsecurity

# Setting the Server IPs
SERVER_IP1=""
SERVER_IP2=""

# Setting the Control Server IPs (the server you use for gaining ssh access)
CC_SERVER=""

# Setting the Backend IPs
BACKEND_IP=""

# Flushing all Rules
# iptables -f
# iptables -x

# Setting default filter policy
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Allow unlimited traffic on loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow incoming SSH on SERVER_IP1
iptables -A INPUT -p tcp -s $CC_SERVER -d $SERVER_IP1 --sport 0:65535 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $CC_SERVER --sport 22 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# Allow incoming SSH on SERVER_IP2
iptables -A INPUT -p tcp -s $CC_SERVER -d $SERVER_IP2 --sport 0:65535 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP2 -d $CC_SERVER --sport 22 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# Allow incoming BACKEND_IP on SERVER_IP1
iptables -A INPUT -p tcp -s $BACKEND_IP -d $SERVER_IP1 --sport 0:65535 --dport 0:65535 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $BACKEND_IP --sport 0:65535 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT


# Allow Cloudflare IPS on Port 443
cf1="173.245.48.0/20"
cf2="103.21.244.0/22"
cf3="103.22.200.0/22"
cf4="103.31.4.0/22"
cf5="141.101.64.0/18"
cf6="108.162.192.0/18"
cf7="190.93.240.0/20"
cf8="188.114.96.0/20"
cf9="197.234.240.0/22"
cf10="198.41.128.0/17"
cf11="162.158.0.0/15"
cf12="104.16.0.0/12"
cf13="172.64.0.0/13"
cf14="131.0.72.0/22"

# Allow Cloudflare IPS

# CF1
iptables -A INPUT -p tcp -s $cf1 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT 
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf1 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF2
iptables -A INPUT -p tcp -s $cf2 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf2 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF3 
iptables -A INPUT -p tcp -s $cf3 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf3 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF4 
iptables -A INPUT -p tcp -s $cf4 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf4 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF5 
iptables -A INPUT -p tcp -s $cf5 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf5 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF6 
iptables -A INPUT -p tcp -s $cf6 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf6 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF7 
iptables -A INPUT -p tcp -s $cf7 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf7 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF8 
iptables -A INPUT -p tcp -s $cf8 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf8 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF9 
iptables -A INPUT -p tcp -s $cf9 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf9 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF10 
iptables -A INPUT -p tcp -s $cf10 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf10 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF11 
iptables -A INPUT -p tcp -s $cf11 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf11 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF12
iptables -A INPUT -p tcp -s $cf12 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf12 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF13 
iptables -A INPUT -p tcp -s $cf13 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf13 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# CF14 
iptables -A INPUT -p tcp -s $cf14 -d $SERVER_IP1 --sport 0:65535 --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s $SERVER_IP1 -d $cf14 --sport 443 --dport 0:65535 -m state --state ESTABLISHED -j ACCEPT

# make sure nothing comes or goes out of this box
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP

