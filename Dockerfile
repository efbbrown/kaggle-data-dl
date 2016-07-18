FROM ubuntu:latest
MAINTAINER Eugene Brown "efbbrown@gmail.com"
RUN apt-get update -y
COPY . /dir
WORKDIR /dir