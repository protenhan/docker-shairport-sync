FROM resin/rpi-raspbian:jessie 
MAINTAINER @protenhan

RUN apt-get update \
 && apt-get upgrade \
 && apt-get install -y \
    libtool \
    build-essential \
    git \
    libdaemon-dev \
    libasound2-dev \
    libpopt-dev \
    libconfig-dev \
    avahi-daemon \
    libavahi-client-dev \
    autoconf \
    automake \
    libssl-dev \
    libsoxr-dev \
 && rm -rf /var/lib/apt/lists/*

RUN cd /root \
 && git clone https://github.com/mikebrady/shairport-sync.git \
 && cd /root/shairport-sync \
 && git checkout -q tags/2.8.3 \
 && autoreconf -i -f \
 && ./configure --with-alsa --with-pipe --with-avahi --with-ssl=openssl --with-soxr --with-metadata \
 && make \
 && make install

COPY start.sh /start

ENV AIRPLAY_NAME Docker

ENTRYPOINT [ "/start" ]
