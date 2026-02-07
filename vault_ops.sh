#!/bin/bash

LOG_FILE="$HOME/secure_vault/logs.txt"
SECRETS_FILE="$HOME/secure_vault/secrets.txt"

#function for loging timestamp plus success message as positional parameter
log_action() {
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> "$LOG_FILE"
}

while true
do
    echo "===================="
    echo " Vault Operations"
    echo "===================="
    echo "1. Add Secret"
    echo "2. Update Secret"
    echo "3. Delete Secret"
    echo "4. Add Log Entry"
    echo "5. Access Keys"
    echo "6. Exit"
    echo
    read -p "Choose an option: " choice

    case "$choice" in
        1)
            read -p "Enter secret: " secret
            echo "$secret" >> "$SECRETS_FILE"
            log_action "Secret added"
            echo "Secret added."
            ;;

        2)
            read -p "Enter secret to update: " old_secret
            read -p "Enter new secret: " new_secret

            if grep -q "$old_secret" "$SECRETS_FILE" 2>/dev/null; then
                sed -i "s/$old_secret/$new_secret/g" "$SECRETS_FILE"
                log_action "Secret updated"
                echo "Secret updated."
            else
                echo "No match found."
            fi
            ;;

        3)
            read -p "Enter secret to delete: " del_secret

            if grep -q "$del_secret" "$SECRETS_FILE" 2>/dev/null; then
                sed -i "/$del_secret/d" "$SECRETS_FILE"
                log_action "Secret deleted"
                echo "Secret deleted."
            else
                echo "No match found."
            fi
            ;;

        4)
            log_action "Manual log entry added"
            echo "Log entry added."
            ;;

        5)
            echo "ACCESS DENIED 🚫"
            ;;

        6)
            log_action "Vault operations exited"
            echo "Exiting vault operations."
            break
            ;;

        *)
            echo "Invalid option. Try again."
            ;;
    esac

    echo
done

