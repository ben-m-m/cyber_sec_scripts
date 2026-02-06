#!/bin/bash

#creating a directory "secure_vault" in the user's home


VAULT="$HOME/secure_vault"
mkdir -p "$VAULT"	#Ensuring no errors upon directory exists


#cd /home/benzz/secure_vault	#change to new directory
#touch keys.txt secrets.txt logs.txt	#create 3 files in new directory

#print welcome message and create the new files
echo "Welcome to secure vault script for your security keys" > "$VAULT/keys.txt"
echo "Welcome to secure vault script for your security secrets" > "$VAULT/secrets.txt"
echo "Welcome to secure vault script for your security logs" > "$VAULT/logs.txt"

#confirm files are created and list them in long format
ls -lht "$VAULT"
echo "-------------------------------------------------------"
echo "secure_vault directory and files created successfully"

