# open_port.sh

open_port.sh is a powerful and easy-to-use script designed for creating remote connections using HTTP or TCP protocols through port forwarding. This tool is ideal for penetration testers, network administrators, and developers who need to test or manage remote connections.

Features

Supports HTTP and TCP Protocols: Choose between HTTP or TCP connection modes depending on your needs.

Customizable Ports and Hosts: Define the payload port, host, listening host, and listening port with default values provided for convenience.

Automatic Dependency Check: Ensures OpenSSH and OpenSSL are installed, installing them automatically if missing.

Secure Port Forwarding: Uses SSH to create a remote port forwarding connection for easy remote access.


Usage

1. Clone the repository:

git clone https://github.com/yourusername/open_port.git
cd open_port


2. Make the script executable:

chmod +x open_port.sh


3. Run the script:

./open_port.sh


4. Follow the prompts to:

Choose between HTTP or TCP mode.

Define the port and host details for the payload and listener.




Example

For an HTTP connection:

Payload port: 80

Host: serveo.net

Listening host: localhost

Listening port: 8080


For a TCP connection:

Payload port: 44444

Host: serveo.net

Listening host: localhost

Listening port: 4444



The script will establish the connection and provide feedback on the selected options.

Purpose

This tool is designed for authorized use only. It can assist with:

Remote testing and debugging.

Setting up temporary remote access during penetration testing.

Simulating network scenarios requiring port forwarding.


Contribution

Contributions are welcome! Feel free to open a pull request or report issues.

Disclaimer

open_port.sh is for ethical and authorized purposes only. Misuse of this script for illegal activities is strictly prohibited. The author is not responsible for any damage caused by its misuse.
