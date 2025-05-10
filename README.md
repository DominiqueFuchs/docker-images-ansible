# Docker images for Ansible/Molecule role testing

There is not much going on here - there is only added layers that contain an ansible installation as well as dependencies used/expected by my ansible roles.

## Linux Distributions (base images)

- AlmaLinux
  - [dfuchs/alma-8-ansible](https://hub.docker.com/r/dfuchs/alma-8-ansible)
  - [dfuchs/alma-9-ansible](https://hub.docker.com/r/dfuchs/alma-9-ansible)
- Debian
  - [dfuchs/debian-11-ansible](https://hub.docker.com/r/dfuchs/debian-11-ansible)
- Ubuntu
  - [dfuchs/ubuntu-22.04-ansible](https://hub.docker.com/r/dfuchs/ubuntu-22.04-ansible)

## Included packages/installations

- Ansible
- Docker Compose
- Python3
- sudo

## Tags

- `latest`: As each docker image only tracks the latest version of the corresponding base image, only one tag exists
