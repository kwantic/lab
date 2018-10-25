# From the Kali linux base image
FROM kalilinux/kali-linux-docker

# Update and apt install programs
RUN apt-get install -y \
 git

# Set entrypoint and working directory
WORKDIR /root/

# Create known_hosts for git cloning
#RUN touch /root/.ssh/known_hosts
# Add host keys
#RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
#RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone git repos
RUN git clone https://github.com/danielmiessler/SecLists.git /opt/seclists
RUN git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/powersploit

# Other installs
#RUN pip install pwntools

# Update ENV
ENV PATH=$PATH:/opt/powersploit

# Indicate we want to expose ports 80 and 443
EXPOSE 80/tcp 443/tcp