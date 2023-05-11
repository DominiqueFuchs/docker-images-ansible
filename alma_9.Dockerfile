FROM almalinux/9-init:latest
LABEL org.opencontainers.image.authors="Dominique Fuchs"

RUN dnf -y install 'dnf-command(config-manager)'
RUN dnf -y config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN dnf -y update && dnf -y install docker-ce docker-ce-cli docker-compose-plugin epel-release python3 python3-pip
RUN pip3 install --upgrade pip && pip3 install ansible

RUN systemctl enable docker