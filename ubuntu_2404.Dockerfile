FROM jrei/systemd-ubuntu:24.04
LABEL org.opencontainers.image.authors="Dominique Fuchs"

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends ca-certificates curl gnupg lsb-release && \
    apt-get -y install acl sudo python3 python3-pip python3-wheel ansible && \
    echo 'ALL ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/nopasswd && \
    chmod 0440 /etc/sudoers.d/nopasswd && \
    apt-get -y clean && \
    systemctl enable docker
