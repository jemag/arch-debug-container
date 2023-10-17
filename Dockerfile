FROM archlinux:base-devel@sha256:7c4e1da516627362dfd40c9c13a073ebaffb5235b9850ebcd6deb508a9f25dee
RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
  cargo \
  dnsutils \
  ethtool \
  git \
  htop \
  iftop \
  iperf \
  iptstate \
  jless \
  jq \
  lsb-release \
  lsof \
  lynx \
  make \
  net-tools \
  netperf \
  socat \
  strace \
  sysstat \
  tcpdump \
  tree \
  unzip \
  vim \
  wget \
  yq
RUN useradd -m -G wheel -s /bin/bash debug
RUN sed -Ei 's/^#\ (%wheel.*NOPASSWD.*)/\1/' /etc/sudoers
RUN cat /etc/sudoers
USER debug
WORKDIR /home/debug/
RUN git clone https://aur.archlinux.org/paru.git && cd paru \
  && makepkg -si --noconfirm && cd .. && rm -rf paru
