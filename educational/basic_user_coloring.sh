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
gre="\033[32m"
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
echo "What is the domain you would like to ping?"
read -p "Domain: " domain


if [ -z domain ]
then
	echo -e "\nUser has not provided valid input. Will default to 8.8.8.8\n"
	domain=8.8.8.8
	ping 8.8.8.8 -c 10 -i .01 > /tmp/pingdump.txt
else
	ping $domain -c 10 -i .01 > /tmp/pingdump.txt
fi
echo -e "\nChecking for internet connectivity and network response times with $gre$domain$close...\n"
fastest=$(cat /tmp/pingdump.txt | grep "ttl" | cut -d "=" -f 4 | sort -n | head -1)
slowest=$(cat /tmp/pingdump.txt | grep "ttl" | cut -d "=" -f 4 | sort -n | tail -1)

echo -e "Your fastest time is: $gre$fastest$close\nYour slowest time is: $gre$slowest$close" 
