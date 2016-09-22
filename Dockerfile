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
    libavformat-dev \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN cv_version='3.1.0' \
    && wget https://github.com/Itseez/opencv/archive/"$cv_version".zip \
    && unzip "$cv_version".zip \
    && mkdir /opencv-"$cv_version"/cmake_binary \
    && cd /opencv-"$cv_version"/cmake_binary \
    && cmake .. \
    && make install \
    && rm /"$cv_version".zip \
    && rm -r /opencv-"$cv_version"
