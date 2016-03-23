FROM golang:1.6-alpine

MAINTAINER sys-cat <systemcat91@gmail.com>

RUN apk update && apk add git
RUN apk info mecab
