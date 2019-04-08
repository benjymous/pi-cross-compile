FROM ubuntu:18.04
MAINTAINER benjymous <benjymous@users.noreply.github.com>

# Intended to run from a gitlab CI build, rather than running manually

RUN apt-get update && apt-get install -y git && apt-get install -y build-essential wget rsync cmake

RUN cd /opt \
 && mkdir rpi \
 && git clone https://github.com/raspberrypi/tools.git --depth=1 tools

COPY Toolchain-RaspberryPi.cmake /opt/rpi/

#ENV BUILD_FOLDER /build

#WORKDIR ${BUILD_FOLDER}

#CMD ["/bin/bash", "-c", "make", "-f", "${BUILD_FOLDER}/Makefile"]
# CMD ["make", "clean"]
