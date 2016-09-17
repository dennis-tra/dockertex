FROM ubuntu:16.04
MAINTAINER Dennis Trautwein

RUN apt-get update && apt-get install --yes vim texlive-full

WORKDIR /data
VOLUME /data
