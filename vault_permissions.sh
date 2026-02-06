#!/bin/bash
# Check if secure_vault directory exists
DIR="$HOME/secure_vault"

if [ ! -d "$DIR" ]; then
	echo "Error: Directory does not exist and needs to be created first"
	exit 1
fi

#function for permission handling and updates 

update_permissions() {
	#variables to exist only in function hence local
	local files="$1"
	local default_permissions="$2"

	#echo space and list long dir content and prompt user input
	echo
	ls -l "$DIR"
	echo "------------------------------------------------------------------"
	read -p "Would you like to update permissions for $files ?:[ y/n, Enter for Default ] " choice


	#If user inputs y for yes
	if [ "$choice" = "y" ]; then
		read -p "Enter new permission in the format [e.g 600 ]:" permission
		chmod "$permission" "$DIR/$files"
		echo "permissions successfully changed to $permission for $files"

		#check for empty string after user presses enter key
	elif [ -z "$choice" ]; then
		chmod "$default_permissions" "$DIR/$files"
		echo "Default permission $default_permissions applied to $files"

		#Any other input considered as n for no
	else
		echo "Permission for $files not changed"

	fi
}
#call the function to handle each file
update_permissions "keys.txt" 600
update_permissions "secrets.txt" 640
update_permissions "logs.txt" 644

#Displaying the final permission 
echo
echo "File permissions:"
ls -lht "$DIR"
