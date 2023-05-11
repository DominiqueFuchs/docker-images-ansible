FROM almalinux/9-init:latest
LABEL org.opencontainers.image.authors="Dominique Fuchs"

RUN dnf -y update && dnf -y install python3 python3-pip
RUN pip3 install --upgrade pip && pip3 install ansible
