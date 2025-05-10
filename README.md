[![Publish](https://github.com/DominiqueFuchs/docker-images-ansible/actions/workflows/publish.yaml/badge.svg?branch=main)](https://github.com/DominiqueFuchs/docker-images-ansible/actions/workflows/publish.yaml)

# Docker Images for Ansible Role and Molecule Testing

This repository provides Docker images pre-configured for testing Ansible roles, particularly with [Molecule](https://molecule.readthedocs.io/). The images are automatically built and published to [Docker Hub](https://hub.docker.com/u/dfuchs) via GitHub Actions.

These Docker images were initially created for and are used by my other repo [ansible-grafana-compose](https://github.com/DominiqueFuchs/ansible-grafana-compose). This Ansible role deploys a Grafana, Prometheus, Loki, and Alertmanager stack using Docker Compose, leveraging these images for its Molecule testing scenarios.

## Available Linux Distributions

The following base images are available, each equipped with Ansible and other testing essentials:

*   **AlmaLinux:**
    *   [`dfuchs/alma-8-ansible`](https://hub.docker.com/r/dfuchs/alma-8-ansible) (AlmaLinux 8)
    *   [`dfuchs/alma-9-ansible`](https://hub.docker.com/r/dfuchs/alma-9-ansible) (AlmaLinux 9)
*   **Debian:**
    *   [`dfuchs/debian-12-ansible`](https://hub.docker.com/r/dfuchs/debian-12-ansible) (Debian 12 Bookworm)
    *   [`dfuchs/debian-11-ansible`](https://hub.docker.com/r/dfuchs/debian-11-ansible) (Debian 11 Bullseye)
*   **Ubuntu:**
    *   [`dfuchs/ubuntu-24.04-ansible`](https://hub.docker.com/r/dfuchs/ubuntu-24.04-ansible) (Ubuntu 24.04 LTS Noble Numbat)
    *   [`dfuchs/ubuntu-22.04-ansible`](https://hub.docker.com/r/dfuchs/ubuntu-22.04-ansible) (Ubuntu 22.04 LTS Jammy Jellyfish)

## Core Included Packages

Each image comes with:

*   **Ansible:** Latest version installed via pip.
*   **Python 3 & pip:** For Ansible and general scripting.
*   **`sudo`:** For privilege escalation.
*   **Docker Engine (CE):** For roles that might interact with Docker.
*   **Docker Compose (plugin):** For managing multi-container applications within tests.
*   **`systemd`:** Enabled in the base images to allow testing of service management.

## Tags

*   `latest`: Each image currently tracks the latest available version of its base distribution and has a single `latest` tag.

## Usage Example (with Molecule)

You can use these images in your `molecule.yml` file:

```yaml
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance
    image: dfuchs/ubuntu-24.04-ansible:latest
    pre_build_image: true
    override_command: false
    privileged: true # For systemd, in conjunction with the cgroup mount
    volume_mounts:
      - "/sys/fs/cgroup:/sys/fs/cgroup:ro"
provisioner:
  name: ansible
verifier:
  name: ansible
```
