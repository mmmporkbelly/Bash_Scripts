#!/bin/bash
# 
# Cross check compromised passwords against haveibeenpwned API
# Supply first 5 dig of sha1 hash against here: https://api.pwnedpasswords.com/range/


# Make sure people don't provide pw in cleartext
if [ $1 == "-h" ]
then
	echo -e "\nUsage: ./have_i_been_pwned.sh + enter"
	echo "Keep in mind that passing in argument poses a security risk"
	echo "This program will hide all input. Please do not provide any arguments"
	exit 0
elif [ $# -ne 0 ]
then
	echo "STOP BEING A NOOB" | figlet -f big
	echo "./have_i_been_pwned.sh -h for help"
	exit 0
fi

# If people provide pw in cleartext...




# Intro
clear
figlet -t -k -f /usr/share/figlet/small.flf "Have you been pwned?"

echo "Let's see if you've been pwned... provide a password"

#read -p "Check password: " password
echo "Check password: "
read -s password

# Make sure something is passed
while [ -z $password ] 
do
	echo "Please provide a password: "
	read -s password
done

# Make sure return line is not included in echo
sha1hash=$(echo -n $password | sha1sum | cut -d " " -f 1)
firstfive=${sha1hash::5}
lasthalf=${sha1hash:5}

# Searches based on first five letters of hash
wget -q https://api.pwnedpasswords.com/range/$firstfive
match=$(cat $firstfive | grep -i $lasthalf | tr -d '\r\n')
if [ -z $match ]
then
	echo "You have not been pwned...yet"
else
	timespwned=$(cat $firstfive | grep -i $lasthalf | cut -d ":" -f 2)
	printf "\e[32m"
	echo -e "PWNED $timespwned TIMES" | figlet -f big
fi
rm $firstfive
