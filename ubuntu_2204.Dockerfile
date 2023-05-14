FROM jrei/systemd-ubuntu:22.04
LABEL org.opencontainers.image.authors="Dominique Fuchs"

RUN apt-get -y update && \
    apt-get -y install ca-certificates curl gnupg && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get -y update && \
    apt-get -y install docker-ce docker-ce-cli docker-compose-plugin python3 python3-pip sudo && \
    apt-get -y clean && \
    systemctl enable docker
RUN pip3 install --upgrade pip && pip3 install wheel && pip3 install ansible
