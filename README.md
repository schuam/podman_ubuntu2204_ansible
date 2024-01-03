# Arch Linux Docker Image for Ansible Role Testing

I use the Containerfile contained in this repository to build a Podman image
that I can use to test Ansible roles on an Arch Linux system. It's based on the
official [Ubuntu docker image](https://hub.docker.com/\_/ubuntu) and
just installs some additionally needed packages.

To test Ansible roles, I use Molecule. To use the image that is generated from
the Containerfile in this repo, I added the following parts to the file
molecule/default/molecule.yml within the Ansible role:

```yml
driver:
  name: podman
platforms:
  - name: ubuntu
    image: "docker.io/schuam/podman_ubuntu_ansible:latest"
    pre_build_image: true
```

You can find the
[image on dockerhub](https://hub.docker.com/r/schuam/podman\_ubuntu2204\_ansible).

