#!/bin/bash
#
# Enumerate information about yourself and the system


clear

# Nice intro
figlet -t -k -f /usr/share/figlet/small.flf "Host Enumeration"
echo -e "************************************************\n"

# Set usernames
name=Seido
user=$(whoami)

# Color Codes
red="\033[31m"
yel="\033[33m"
close="\033[0m"

# Grep for IP Addr
ip=$(ip a | grep -v "1:" | grep "brd" | grep -E "(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}" | awk {'print $2'} | cut -d "/" -f 1)

# Set line breaks
lineBreak=$(echo '\n========================================================\n')

# Interface variable
interface=$(nmcli device status | grep eth0)


echo -e "Hello $name. You are running as \033[31m$user.\033[0m"
echo -e $lineBreak
echo -e "Your IP is: $yel$ip$close"
echo -e $lineBreak
echo -e "Your interface information is below"
echo -e $yel$interface$close
echo -e $lineBreak
# Check for internet connectivity
echo -e "Checking for internet connectivity...\n"
fastest=$(ping -i .01 -c 10  8.8.8.8 | grep "ttl" | cut -d "=" -f 4 | sort -n | head -1)
slowest=$(ping -i .01 -c 10  8.8.8.8 | grep "ttl" | cut -d "=" -f 4 | sort -n | tail -1)

echo -e "Your fastest time is: $yel$fastest$close\nYour slowest time is: $yel$slowest$close" 
