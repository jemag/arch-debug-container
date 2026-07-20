FROM archlinux:base-devel@sha256:412efebb0eeef0ef322ff24ad73f82b1ba2d3b12377db4c5fbe3074c7e7e8678
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
