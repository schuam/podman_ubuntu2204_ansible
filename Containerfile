FROM ubuntu:22.04

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        locales \
        openssh-server \
        python3 \
        sudo \
        systemd \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man

RUN locale-gen en_US.UTF-8

# Remove unnecessary getty and udev targets that result in high CPU usage when using
# multiple containers with Molecule (https://github.com/ansible/molecule/issues/1104)
RUN rm -f /lib/systemd/system/systemd*udev* \
    && rm -f /lib/systemd/system/getty.target

# Add entrypoint
ENTRYPOINT ["/usr/sbin/init"]
