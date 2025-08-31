# open_port.sh

Open Port Tunneling Script

This project provides a Bash script that helps you easily expose your local services to the internet using reverse SSH tunneling.
It supports two main tunneling services:

serveo.net

localhost.run



---

🚀 Features

Choose between HTTP or TCP tunneling.

Automatic installation of missing dependencies (openssh, openssl).

Simple interactive prompts with color-coded messages.

Supports both serveo.net and localhost.run.

Clean and customizable setup.



---

⚙️ Requirements

Linux (tested on Kali Linux, Ubuntu, Debian).

Installed:

openssh

openssl



The script installs missing packages automatically if they are not present.


---

📌 Usage

1. Clone the repository

git clone https://github.com/pashamasr01287654800/open_port.git
cd open_port

2. Make script executable

chmod +x open_port.sh

3. Run the script

./open_port.sh


---

🌐 Connection Modes

🔹 HTTP Mode

When you choose HTTP, the script will ask:

1. Port used in the payload (default: 80)


2. Host used in the payload (default: serveo.net or nokey@localhost.run)


3. Host to listen (default: localhost)


4. Port for listening (default: 8080)



Example (using serveo.net):

ssh -R 80:localhost:8080 serveo.net

This will expose your local service running on port 8080 to the internet via:

https://your-username.serveo.net


---

🔹 TCP Mode

When you choose TCP, the script will ask:

1. Port used in the payload (default: 44444)


2. Host used in the payload (default: serveo.net)


3. Host to listen (default: localhost)


4. Port for listening (default: 4444)



Example:

ssh -R 44444:localhost:4444 serveo.net

This creates a direct TCP tunnel accessible through the serveo server.


---

🌍 Tunneling Services

✅ Serveo.net

Easy to use, no signup required.

Generates a subdomain like yourname.serveo.net.

Supports both HTTP and TCP tunneling.


Example:

ssh -R 80:localhost:8080 serveo.net

You can then access your local service via:

https://yourname.serveo.net


---

✅ Localhost.run

Also works without signup.

Command usually looks like this:

ssh -R 80:localhost:8080 nokey@localhost.run

When you run it, you get a public HTTPS URL, like:

https://random-subdomain-1234.host.run

Useful as an alternative if serveo.net is down or blocked.

Random subdomains by default (less predictable than serveo.net).



---

🔄 Example Workflow

1. Run the script.


2. Choose http or tcp.


3. Pick tunneling service (serveo.net or localhost.run).


4. Enter required ports and hostnames.


5. Copy the generated public URL or connection info.


|

---
---------------------------------------------
|📊 Serveo.net vs Localhost.run             |
--------------------------------------------
Feature	serveo.net	localhost.run           |
---------------------------------------------
| Subdomain	Customizable | Random generated |
---------------------------------------------
| HTTP Support	✅ Yes	 | ✅ Yes           |
---------------------------------------------
| TCP Support	  ✅ Yes	 | ❌ Limited       |
---------------------------------------------
Ease of use	Very simple	Very simple
Stability	Good but sometimes busy	Reliable alternative



---

⚠️ Disclaimer

This script is intended for educational and development purposes only.
Do not use it for malicious activity. The author is not responsible for any misuse.

