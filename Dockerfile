FROM i386/ubuntu:xenial

RUN apt-get update && echo updated
RUN apt-get install -y wget

RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
    apt-key add winehq.key

RUN apt-get install -y software-properties-common
RUN apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'
RUN apt-get install -y apt-transport-https
RUN apt-get update

RUN apt-get install -y --install-recommends winehq-stable

RUN apt-get install -y xorg openbox

RUN apt-get install -y \
    x11-xserver-utils \
    x11vnc \
    xinit \
    xserver-xorg-video-dummy \
    xserver-xorg-input-void

RUN apt-get install -y \
    xvfb \
    menu


COPY render.sh /
RUN chmod +x /render.sh


EXPOSE 5900

