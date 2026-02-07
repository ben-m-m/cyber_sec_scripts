#!/bin/bash

DIR="$HOME/secure_vault/"
REPORT="$DIR/vault_report.txt"
SECURITY_RISK=false

#clears or creates the report file if it doesnt exist
> "$REPORT"

#loop through the files in secure_vault
for file in "$DIR"/*
do
	#process only regular files
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        size=$(stat -c %s "$file")
        modified=$(stat -c %y "$file")
        perms=$(stat -c %a "$file")

        #append details to the report
        {
            echo "File Name: $filename"
            echo "Size (bytes): $size"
            echo "Last Modified: $modified"
            echo "Permissions: $perms"
            echo "--------------------------"
            echo
        } >> "$REPORT"

        #check for permissions more open than 644
        if [ "$perms" -gt 644 ]; then
            SECURITY_RISK=true
        fi
    fi
done

#append security warning if needed
if [ "$SECURITY_RISK" = true ]; then
    echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
fi

echo "Vault monitoring report created at: $REPORT"
