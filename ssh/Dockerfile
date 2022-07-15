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

# ADD AUTHORIZED KEYS FOR ACCESS
COPY ./authorized_keys /home/${SSH_USER}/.ssh/authorized_keys

RUN chmod 700 /home/${SSH_USER}/.ssh \
    && chmod 600 /home/${SSH_USER}/.ssh/authorized_keys

RUN chown -R ${SSH_USER}:${SSH_USER} /home/${SSH_USER}/.ssh

CMD [ "/usr/sbin/sshd", "-D" ]
