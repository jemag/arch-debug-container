FROM archlinux:base-devel@sha256:f493b023ea4e1dbc4073bf9f39898dfa153286f47547d1a5f886105e66557e5b
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
