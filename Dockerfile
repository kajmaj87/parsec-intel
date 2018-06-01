# to start parsec, run:
# $ sudo docker run -it --rm -e PULSE_SERVER=unix:/run/user/1000/pulse/native -e DISPLAY=unix:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/1000/pulse:/run/user/1000/pulse --device=/dev/dri:/dev/dri parsec
FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
    libcairo2 \
    libfreetype6 \
    libgdk-pixbuf2.0-0 \
    libgl1-mesa-glx \
    libgl1 \
    libglib2.0-0 \
    libgtk2.0-0 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libsm6 \
    libsndio6.1 \
    libxxf86vm1 \
    pulseaudio-utils \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    xserver-xorg-video-intel \
    i965-va-driver \
    libva1 \
    libva-x11-1 \
    libva-glx1

ADD https://s3.amazonaws.com/parsec-build/package/parsec-linux.deb parsec-linux.deb
RUN dpkg -i parsec-linux.deb

RUN useradd -ms /bin/bash parsec
USER parsec
WORKDIR /home/parsec

CMD /usr/bin/parsecd
