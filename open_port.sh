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
if ! command_exists ssh || ! command_exists openssl; then
  echo -e "${YELLOW}Installing required packages: openssh, openssl...${RESET}"
  apt install -y openssh openssl
fi

# Prompt the user to choose between HTTP or TCP connection
while true; do
    echo -e "${CYAN}Do you want to use HTTP or TCP connection?${RESET}"
    read -p "(http/tcp): " choice

    if [ "$choice" = "http" ]; then
        echo -e "${BLUE}HTTP connection selected.${RESET}"

        # Ask user to choose tunneling service
        while true; do
            echo -e "${CYAN}Choose tunneling service:${RESET}"
            echo -e "${YELLOW}[1] serveo.net (default)${RESET}"
            echo -e "${YELLOW}[2] localhost.run${RESET}"
            read -p "Enter number [default 1]: " num
            num=${num:-1}

            if [ "$num" == "1" ]; then
                host_default="serveo.net"
                break
            elif [ "$num" == "2" ]; then
                host_default="nokey@localhost.run"
                break
            else
                echo -e "${RED}Invalid number. Please enter 1 or 2.${RESET}"
            fi
        done

        # Same order of questions with colors
        read -p "$(echo -e ${MAGENTA}Enter the port used in the payload • default: 80 :${RESET} ) " port
        port=${port:-80}

        read -p "$(echo -e ${MAGENTA}Enter the host used in the payload • default: $host_default :${RESET} ) " host
        host=${host:-$host_default}

        read -p "$(echo -e ${MAGENTA}Enter the host to listen • default: localhost :${RESET} ) " listen_host
        listen_host=${listen_host:-localhost}

        read -p "$(echo -e ${MAGENTA}Enter the port used for listening • default: 8080 :${RESET} ) " listen_port
        listen_port=${listen_port:-8080}

        break

    elif [ "$choice" = "tcp" ]; then
        echo -e "${BLUE}TCP connection selected.${RESET}"

        # Same order of questions with colors
        read -p "$(echo -e ${MAGENTA}Enter the port used in the payload • default: 44444 :${RESET} ) " port
        port=${port:-44444}

        read -p "$(echo -e ${MAGENTA}Enter the host used in the payload • default: serveo.net :${RESET} ) " host
        host=${host:-serveo.net}

        read -p "$(echo -e ${MAGENTA}Enter the host to listen • default: localhost :${RESET} ) " listen_host
        listen_host=${listen_host:-localhost}

        read -p "$(echo -e ${MAGENTA}Enter the port used for listening • default: 4444 :${RESET} ) " listen_port
        listen_port=${listen_port:-4444}

        break

    else
        echo -e "${RED}Invalid choice. Please choose 'http' or 'tcp'.${RESET}"
    fi
done

# Display the details
echo -e "${GREEN}The port used in the payload: ${RESET}$port"
echo -e "${GREEN}Host used in the payload: ${RESET}$host"
echo -e "${GREEN}This host to listen: ${RESET}$listen_host"
echo -e "${GREEN}Port used for listening: ${RESET}$listen_port"

# Establishing SSH reverse tunnel connection
ssh -R $port:$listen_host:$listen_port $host

echo -e "${YELLOW}Thank you for using this script.${RESET}"