export IPADIC_NEOLOGD="`mecab-config --dicdir`/mecab-ipadic-neologd"
export CGO_LDFLAGS="`mecab-config --libs`"
export CGO_FLAGS="`mecab-config --inc-dir`"
