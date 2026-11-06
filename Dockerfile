FROM archlinux:base-devel@sha256:2de80105abb49f813a85393c6758a4334deb6bcec4a2411bd2f059c0bee6ee4c
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
