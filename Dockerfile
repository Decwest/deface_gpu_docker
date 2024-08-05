FROM nvidia/cuda:12.5.1-cudnn-devel-ubuntu20.04

#######################################################################
##                            Speeding up                            ##
#######################################################################
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

#######################################################################
##                      install common packages                      ##
#######################################################################
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
   pkg-config \
   apt-utils \
   wget \
   curl \
   git \
   build-essential \ 
   net-tools \
   gedit \
   terminator \
   nautilus \
   software-properties-common \
   apt-transport-https \
   libopencv-dev \
   ffmpeg \
   x264 \
   libx264-dev \
   zip \
   unzip \
   usbutils \
   sudo \
   python-pip \
   libusb-1.0-0-dev \
   dbus-x11

#######################################################################
##                           install font                            ##
#######################################################################
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections 
RUN apt-get update && apt-get install -y ttf-mscorefonts-installer \
    ttf-ubuntu-font-family \
    msttcorefonts -qq

RUN python -m pip install
RUN apt-get install  -y python-ruamel.yaml

#######################################################################
##                          install deface                           ##
#######################################################################
RUN python3 -m pip install deface onnx onnxruntime-gpu

#######################################################################
##                            delete cash                            ##
#######################################################################
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /video
