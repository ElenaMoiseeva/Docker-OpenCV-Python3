#Dockerfile for python-opencv

# Pull base image.
FROM ubuntu:14.04

MAINTAINER Moiseeva Elena <moiseeva.elena.alex@gmail.com>

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    pkg-config \
    libswscale-dev \
    python3-dev \
    python3-numpy \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN wget https://github.com/Itseez/opencv/archive/3.0.0.zip \
    && unzip 3.0.0.zip \
    && mkdir /opencv-3.0.0/cmake_binary \
    && cd /opencv-3.0.0/cmake_binary \
    && cmake -DBUILD_opencv_video=OFF -DBUILD_opencv_videoio=OFF .. \
    && make install \
    && rm /3.0.0.zip \
    && rm -r /opencv-3.0.0

