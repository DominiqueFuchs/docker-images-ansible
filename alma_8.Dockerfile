FROM almalinux/8-init:8.10
LABEL org.opencontainers.image.authors="Dominique Fuchs"

RUN dnf -y install 'dnf-command(config-manager)' && \
    dnf -y config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf -y update && \
    dnf -y install docker-ce docker-ce-cli docker-compose-plugin epel-release python3 python3-pip sudo && \
    dnf -y clean all && \
    systemctl enable docker
RUN pip3 install --upgrade pip && pip3 install wheel && pip3 install ansible
