###############################################################################
# This Dockerfile defines the vapurrmaid/coder:latest image.
###############################################################################

# Ubuntu "Focal Fossa" is 20.04.3 LTS
# https://releases.ubuntu.com/20.04/
FROM ubuntu:focal

# Use /bin/bash instead of the Dockerfile default shell of /bin/sh
# https://docs.docker.com/engine/reference/builder/#shell
SHELL ["/bin/bash", "-c"]

# Install packages from apt repositories
ARG DEBIAN_FRONTEND="noninteractive"
 
RUN apt-get update --quiet && \
  # Install software-properties-common to add git-core ppa.
  apt-get install software-properties-common -y && \
  # Add git-core ppa
  add-apt-repository --yes ppa:git-core/ppa && \
  # Install packages
  apt-get update --quiet && \
  apt-get install --no-install-recommends --yes --quiet \
    apt-transport-https \
    bash \
    bash-completion \
    binutils \
    bison \
    build-essential \
    ca-certificates \
    curl \
    golang-go \
    git \
    htop \
    jq \
    language-pack-en \
    man \
    nodejs \
    npm \
    openssh-server \
    python3 \
    python3-pip \
    ripgrep \
    rsync \
    shellcheck \
    sudo \
    tig \
    tree \
    vim \
    wget \
    yarn \
    zip && \
  # Re-enable manual pages - Ubuntu strips these by default
  yes | unminimize
    

# Install global npm utilities
RUN npm install -g \
  pm2 \
  typescript \
  yo

# Add coder user and allow use of sudo
RUN useradd coder \
      --create-home \
      --shell=/bin/bash \
      --uid=1000 \
      --user-group

# Adjust OpenSSH config
RUN echo "PermitUserEnvironment yes" >>/etc/ssh/sshd_config && \
    echo "X11Forwarding yes" >>/etc/ssh/sshd_config && \
    echo "X11UseLocalhost no" >>/etc/ssh/sshd_config

USER coder

# Ensure go bins are in the 'coder' user's path
ENV PATH="/home/coder/go/bin:${PATH}"