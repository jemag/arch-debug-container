FROM archlinux:base-devel@sha256:996c3a1d6b0d87b01242f6fcd8cfa3ad3eece1a67ab5c8f108e20af1d7b97bdd
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
CMD [ "bash", "-c", "sleep infinity" ]
