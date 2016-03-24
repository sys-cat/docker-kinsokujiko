FROM golang:1.6-wheezy

MAINTAINER sys-cat <systemcat91@gmail.com>

# apt update and install libraries.
RUN apt-get update &&\
    apt-get install -y \
      git\
      make\
      curl\
      xz-utils\
      mecab\
      mecab-ipadic-utf8\
      libmecab-dev\
      libstdc++6\
      libstdc++6-4.7-dev\
      patch\
      gcc\
      file &&\
    apt-get clean

# add mecab dic file
RUN cd /tmp &&\
    git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git &&\
    cd mecab-ipadic-neologd &&\
    yes yes | ./bin/install-mecab-ipadic-neologd -n&&\
    echo "10日放送の「中居正広のミになる図書館」（テレビ朝日系）で、SMAPの中居正広が、篠原信一の過去の勘違いを明かす一幕があった。" | mecab -d `mecab-config --dicdir`"/mecab-ipadic-neologd"
