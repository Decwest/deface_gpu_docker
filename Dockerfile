FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

#######################################################################
##                            Speeding up                            ##
#######################################################################
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

#######################################################################
##                      install common packages                      ##
#######################################################################
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y sudo python3-pip libopencv-dev

#######################################################################
##                          install deface                           ##
#######################################################################
RUN python3 -m pip install deface onnx onnxruntime-gpu

#######################################################################
##                            delete cash                            ##
#######################################################################
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /video
