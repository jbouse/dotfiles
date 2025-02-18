#!/usr/bin/env bash

if [ ! -d /go/bin ]; then
  mkdir -p /go/bin
fi

go install -tags extended github.com/gohugoio/hugo@latest
