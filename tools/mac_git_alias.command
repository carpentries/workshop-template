#!/bin/bash

echo ""
echo "This script tests for the existence of the SCM git binary on Mac OS X"
echo "and adds an alias for it to the user's bashrc or bash_profile"
echo ""
# Test for SCM git
if [ -f /usr/local/git/bin/git ]
	then
	echo ""
	echo "SCM git is installed."
	echo ""
else
	echo ""
	echo "SCM git is not installed, please install before running this script"
	echo "Press any key to close this window"
	echo ""
	read -n 1 -s 
	exit 1
fi


if [ `which git` == '/usr/bin/git' ] 
	# Unfortunately this is still true even after adding an alias
	echo "Evaluating profile files..." 
then
	if [ -f ~/.bashrc ]
	then
		if [ `grep -c "alias git" ~/.bashrc` > 0 ]
			then
			echo ""
			echo "The string 'alias git' already exists in your profile, aborting."
			echo "This can happen if you run this script twice."
			echo "Press any key to close this window."
			echo ""
			read -n 1 -s
			exit 1
		else
			echo ""
			echo ".bashrc file exists, adding git alias to the end of it"
			echo 'alias git=/usr/local/git/bin/git' >> ~/.bashrc
			echo ""
		fi
	elif [ -f ~/.bash_profile ]
	then
		if [ `grep -c "alias git" ~/.bash_profile` > 0 ]
			then
			echo ""
			echo "The string 'alias git' already exists in your profile, aborting."
			echo "This can happen if you run this script twice."
			echo "Press any key to close this window."
			echo ""
			read -n 1 -s
			exit 1
		else
			echo ""
			echo ".bash_profile exists, adding git alias to the end of it"
			echo 'alias git=/usr/local/git/bin/git' >> ~/.bash_profile
			echo ""
		fi
	else
		echo ""
		echo "Neither .bashrc nor .bash_profile exist, creating one with git alias." 
		echo 'alias git=/usr/local/git/bin/git' >> ~/.bash_profile
		echo ""
	fi
elif [ `which git` == '/usr/local/git/bin/git' ]
then
	echo ""
	echo "SCM git appears to be installed and functioning correctly."
	echo "Press any key to close this window."
	echo ""
	read -n 1 -s
	exit 1
else
	echo ""
	echo "git is not installed in either standard location, sorry!"
	echo "Press any key to close this window."
	echo ""
	read -n 1 -s
	exit 1	
fi

echo ""
echo "Press any key to close this window."
echo ""
read -n 1 -s
