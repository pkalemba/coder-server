#!/bin/bash

export GO_VERSION=1.12.5
export GOPATH=/usr/local/go-packages
export GO_ROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:${GOPATH}/bin
sudo mkdir /usr/local/go
curl -sS https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz | tar -C /usr/local -xzf -
go get -u -v github.com/ramya-rao-a/go-outline && \
go get -u -v github.com/acroca/go-symbols && \
go get -u -v github.com/mdempsky/gocode && \
go get -u -v github.com/rogpeppe/godef && \
go get -u -v golang.org/x/tools/cmd/godoc && \
go get -u -v github.com/zmb3/gogetdoc && \
go get -u -v golang.org/x/lint/golint && \
go get -u -v github.com/fatih/gomodifytags && \
go get -u -v golang.org/x/tools/cmd/gorename && \
go get -u -v sourcegraph.com/sqs/goreturns && \
go get -u -v golang.org/x/tools/cmd/goimports && \
go get -u -v github.com/cweill/gotests/... && \
go get -u -v golang.org/x/tools/cmd/guru && \
go get -u -v github.com/josharian/impl && \
go get -u -v github.com/haya14busa/goplay/cmd/goplay && \
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs && \
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct && \
go get -u github.com/go-delve/delve/cmd/dlv && \
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint && \
go get -u golang.org/x/tools/cmd/golsp/...
