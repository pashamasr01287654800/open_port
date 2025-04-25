#!/bin/bash

# ANSI Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
MAGENTA="\033[0;35m"
RESET="\033[0m"

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if openssh and openssl are installed
if ! command_exists openssh || ! command_exists openssl; then
  echo -e "${YELLOW}Installing required packages: openssh, openssl...${RESET}"
  apt install openssh openssl
fi

# Prompt the user to choose between HTTP or TCP connection
while true; do
    echo -e "${CYAN}Do you want to use HTTP or TCP connection?${RESET}"
    read -p "(http/tcp): " choice

    if [ "$choice" = "http" ]; then
        echo -e "${BLUE}HTTP connection selected.${RESET}"

        # Prompt the user to enter the port and host details for HTTP
        read -p "$(echo -e ${MAGENTA}Enter the port used in the payload • default: 80 :${RESET} ) " port
        port=${port:-80}

        read -p "$(echo -e ${MAGENTA}Enter the host used in the payload • default: serveo.net :${RESET} ) " host
        host=${host:-serveo.net}

        read -p "$(echo -e ${MAGENTA}Enter the host to listen • default: localhost :${RESET} ) " listen_host
        listen_host=${listen_host:-localhost}

        read -p "$(echo -e ${MAGENTA}Enter the port used for listening • default: 8080 :${RESET} ) " listen_port
        listen_port=${listen_port:-8080}

        break  # Exit the loop if a valid choice is made

    elif [ "$choice" = "tcp" ]; then
        echo -e "${BLUE}TCP connection selected.${RESET}"

        # Prompt the user to enter the port and host details for TCP
        read -p "$(echo -e ${MAGENTA}Enter the port used in the payload • default: 44444 :${RESET} ) " port
        port=${port:-44444}

        read -p "$(echo -e ${MAGENTA}Enter the host used in the payload • default: serveo.net :${RESET} ) " host
        host=${host:-serveo.net}

        read -p "$(echo -e ${MAGENTA}Enter the host to listen • default: localhost :${RESET} ) " listen_host
        listen_host=${listen_host:-localhost}

        read -p "$(echo -e ${MAGENTA}Enter the port used for listening • default: 4444 :${RESET} ) " listen_port
        listen_port=${listen_port:-4444}

        break  # Exit the loop if a valid choice is made

    else
        echo -e "${RED}Invalid choice. Please choose 'http' or 'tcp'.${RESET}"
    fi
done

# Display the details
echo -e "${GREEN}The port used in the payload: ${RESET}$port"
echo -e "${GREEN}Host used in the payload: ${RESET}$host"
echo -e "${GREEN}This host to listen: ${RESET}$listen_host"
echo -e "${GREEN}Port used for listening: ${RESET}$listen_port"

# Check SSH connection success before actual attempt
if ! ssh -R $port:$listen_host:$listen_port $host true; then
    echo -e "${YELLOW}Thank you for using this script.${RESET}"
    exit 1
fi
