#!/bin/bash

# This script is used to config the linux and does things like installing necessary softwares and making soft links

# Softwares
# git
if (check_distribution Fedora)
then
	yum install git-core
elif (check_distribution Ubuntu)
then
	sudo apt-get install git-core  git-doc
fi
ssh-keygen -t rsa -c "jeromeyjj@gmail.com"
# Add SSH key to GitHub

# nautilus-open-terminal
if (check_distribution Fedora)
then
	yum install nautilus-open-terminal
elif (check_distribution Ubuntu)
then
	sudo apt-get install nautilus-open-terminal
fi

# chrome
if (check_distribution Fedora)
then
	wget https://dl-ssl.google.com/linux/google-repo-setup.sh -P /tmp
	sudo sh /tmp/google-repo-setup.sh
	yum install google-chrome-stable
elif (check_distribution Ubuntn)
then
	wget https://dl-ssl.google.com/linux/linux_signing_key.pub -P /tmp
	sudo apt-key add /tmp/linux_signing_key.pub
	echo 'deb http://dl.google.com/linux/deb/stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
	sudo apt-get update
	sudo apt-get install google-chrome-stable
fi

# Soft Links
if (check_distribution Fedora)
then
	ln -s gnome-terminal cmd
fi

function check_distribution
{
	return `cat /etc/issue | grep "$1" > /dev/null 2>&1`
}
