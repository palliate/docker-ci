FROM ubuntu:latest
ENV DOXYGEN_VERSION="1.9.4"


RUN apt update
RUN apt install -y wget python3 cmake capnproto libcapnp-dev pkg-config libsystemd-dev python3-toml python3-git xorg-dev libgtk-3-dev libappindicator3-dev graphviz
RUN cd /tmp
RUN mkdir doxygen
RUN cd doxygen
RUN wget https://www.doxygen.nl/files/doxygen-${DOXYGEN_VERSION}.linux.bin.tar.gz
RUN tar -xvzf doxygen-${DOXYGEN_VERSION}.linux.bin.tar.gz
RUN make -C doxygen-${DOXYGEN_VERSION} install
RUN cd .. 
RUN rm -r doxygen