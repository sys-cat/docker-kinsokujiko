FROM golang:1.6-wheezy

MAINTAINER sys-cat <systemcat91@gmail.com>

RUN apt-get update &&\
    apt-get install -y \
      git\
      mecab\
      mecab-ipadic-utf8\
      libmecab-dev\
      libstdc++6\
      libstdc++6-4.7-dev &&\
    apt-get clean
