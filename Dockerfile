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
    yes yes | ./bin/install-mecab-ipadic-neologd -n --asuser

#RUN cd /tmp &&\
#    git clone https://github.com/direnv/direnv &&\
#    cd direnv &&\
#    make install &&\
#    echo 'eval "($direnv hook bash)"' >> ~/.bashrc && . ~/.bashrc

ADD script/exports.sh /app/exports.sh
#CMD ["/app/exports.sh"]

RUN go get github.com/mattn/gom &&\
    #mkdir /app &&\
    cd /app &&\
    . /app/exports.sh &&\
    git clone https://github.com/sys-cat/Kinsokujiko.git &&\
    cd Kinsokujiko &&\
    gom install &&\
    ls -la vendor &&\
    echo $GOPATH &&\
    ls -la /go/bin &&\
    go run mecab-golang.go
