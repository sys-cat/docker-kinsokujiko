# Add exports
export IPADIC_NEOLOGD="`mecab-config --dicdir`/mecab-ipadic-neologd"
export CGO_LDFLAGS="`mecab-config --libs`"
export CGO_FLAGS="`mecab-config --inc-dir`"

# go get use libraries
go get github.com/gin-gonic/gin
go get github.com/bluele/mecab-golang
