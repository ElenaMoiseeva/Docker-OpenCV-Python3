#Dockerfile for python-opencv

# Pull base image.
FROM ubuntu:14.04

MAINTAINER Moiseeva Elena <moiseeva.elena.alex@gmail.com>

RUN apt-get update && \
	apt-get install -y \
	build-essential \
	cmake \
	git \
	libgtk2.0-dev \
	pkg-config \
	libavcodec-dev \
	libavformat-dev \
	libswscale-dev \
	python3-dev \
	python3-numpy \
	libtbb2 \
	libtbb-dev \
	libjpeg-dev \
	libpng-dev \
	libtiff-dev \
	libjasper-dev \
	libdc1394-22-dev \
	&& apt-get -y clean all \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /opencv
RUN git clone https://github.com/Itseez/opencv.git \
	&& mkdir /opencv/opencv/cmake_binary \
	&& cd /opencv/opencv/cmake_binary \
	&& sudo cmake /opencv/opencv \
	&& sudo make install \
	&& cd /
	
WORKDIR /
RUN	rm -r /opencv
