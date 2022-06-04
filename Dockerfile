FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
ENV DOXYGEN_VERSION="1.9.4"

RUN apt update
RUN apt install -y git wget build-essential cmake capnproto libcapnp-dev pkg-config libsystemd-dev python3 python3-setuptools python3-toml python3-git python3-click python3-jinja2 xorg-dev libgtk-3-dev libappindicator3-dev graphviz
RUN mkdir doxygen
RUN cd doxygen
RUN wget https://www.doxygen.nl/files/doxygen-${DOXYGEN_VERSION}.linux.bin.tar.gz
RUN tar -xvzf doxygen-${DOXYGEN_VERSION}.linux.bin.tar.gz
RUN make -C doxygen-${DOXYGEN_VERSION} install
RUN rm -r doxygen

COPY codegen/ /codegen
RUN cd codegen && ls && python3 setup.py install