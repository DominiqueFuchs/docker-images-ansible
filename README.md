# Docker images for Ansible/Molecule role testing

There is not much going on here - there is only added layers that contain an ansible installation as well as dependencies used/expected by my ansible roles. 

## Linux Distributions (base images)

- AlmaLinux [8, 9]
- Debian [11]

## Included packages/installations

- Ansible
- Docker Compose
- Python3
- sudo

## Tags

- `latest`: As each docker image only tracks the latest version of the corresponding base image, only one tag exists
