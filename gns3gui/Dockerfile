# Run tests inside a container
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install software-properties-common && add-apt-repository ppa:gns3/ppa && apt-get update
RUN apt-get install -y gns3-gui openssh-server xpra 

RUN apt-get install -y language-pack-en-base && dpkg-reconfigure locales
RUN apt-get install -y gnome-terminal

RUN  useradd -r -u 999 -b /home gns3user 

COPY ./sshd_config /etc/ssh/sshd_config

#COPY SSH KEY
COPY keys/id_ed25519.pub /home/gns3user/.ssh/authorized_keys

#copy server config to run immediately
COPY gns3_server.conf /home/gns3user/.config/GNS3/2.2/
COPY gns3_gui.conf /home/gns3user/.config/GNS3/2.2/

RUN chown -R gns3user /home/gns3user
RUN apt-get -y install telnet

#run ssh service and start gns3 server via xpra on localhost
CMD service ssh start; exec bash --login
