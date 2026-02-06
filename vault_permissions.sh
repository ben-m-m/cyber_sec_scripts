#!/bin/bash
# Check if secure_vault directory exists
DIR="/home/benzz/secure_vault"

if [ ! -d "$DIR" ]; then
	echo "Error: Directory does not exist and needs to be created first"
	exit 1
else
	ls -l "$DIR"
	echo "Would you like to update permissions?:"
	echo "Select 1)Yes"
	echo "Select 2)No"
	read -p "Enter your choice [ 1 or 2 ]:" choice

	if [ "$choice" == "1" ]; then
		read -p "Enter new permission in the format [e.g 600 ]:" permission
		chmod $permission $DIR/keys.txt
		chmod $permission $DIR/secrets.txt
		chmod $permission $DIR/logs.txt
		ls -l "$DIR"
		echo "permissions successfully changed to $permission"
	elif [ "$choice" == "2" ]; then
		exit 1
	else
		chmod 600 $DIR/keys.txt
		chmod 640 $DIR/secrets.txt
		chmod 644 $DIR/logs.txt
		ls -l "$DIR"
	fi
fi
