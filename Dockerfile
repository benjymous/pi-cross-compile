FROM debian:stable
MAINTAINER benjymous <benjymous@users.noreply.github.com>

# Intended to run from a gitlab CI build, rather than running manually
# cmake . -DCMAKE_TOOLCHAIN_FILE=/opt/rpi/Toolchain-RaspberryPi.cmake

# Enable armhf packages
RUN dpkg --add-architecture armhf

# Install build tools and sdl/gl libraries
RUN apt-get update && apt-get install -y git && apt-get install -y build-essential wget rsync cmake mesa-util:armhf libsdl2-dev:armhf libglew-dev:armhf

# Get rpi toolchain
RUN cd /opt \
 && mkdir rpi \
 && git clone https://github.com/raspberrypi/tools.git --depth=1 rpi/tools

# Copy over the CMake toolchain definition file
COPY Toolchain-RaspberryPi.cmake /opt/rpi/


