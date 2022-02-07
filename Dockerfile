FROM kalilinux/kali-rolling:amd64

ENV TERM xterm-256color

RUN rm -Rf /var/lib/apt-get && \
	apt-get clean && \
	apt-get update && \
	apt-get upgrade -y 

# base stuff
RUN apt-get install -y --no-install-recommends git unzip neovim \
	zsh curl telnet strace \
	wget python3 python3-pip proxychains \
	proxychains4 ncat socat

# cute shell
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
	sed -i -e 's/robbyrussell/minimal/' ~/.zshrc 

# tools
RUN apt-get install -y --no-install-recommends nmap dirb gobuster masscan wfuzz \
	snmpenum snmp python3-pip netcat-traditional proxychains vim sqlmap wpscan \
	metasploit-framework php ruby samba-common smbclient hydra patator \
	smbmap ffuf

# secList
RUN git clone https://github.com/danielmiessler/SecLists /seclists

WORKDIR /pentest/

CMD ["/usr/bin/zsh"]

