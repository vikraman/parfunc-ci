FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y upgrade
