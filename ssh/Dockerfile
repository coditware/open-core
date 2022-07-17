FROM ubuntu:latest

RUN apt-get update \
    && apt-get -y upgrade

RUN mkdir /run/sshd
RUN apt-get -y install openssh-server

RUN apt-get autoclean && apt-get clean

RUN service ssh stop

COPY ./sshd_config /etc/ssh/sshd_config

# USER CONFIGURATIONS
ARG SSH_USER=sshuser

RUN useradd -u 1000 --create-home --user-group ${SSH_USER}
RUN usermod --shell /bin/bash ${SSH_USER}

RUN mkdir -p /home/${SSH_USER}/.ssh
RUN chmod 700 /home/${SSH_USER}/.ssh
RUN chown -R ${SSH_USER}:${SSH_USER} /home/${SSH_USER}/.ssh

CMD [ "/usr/sbin/sshd", "-D" ]
