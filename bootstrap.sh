#!/usr/bin/env bash

HUGO_LATEST=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r '. as $artifacts | .tag_name | ltrimstr("v") as $version | $artifacts | .assets | .[] | [.name, .browser_download_url] |  if (.[0] | contains($version) and contains("extended") and (contains("withdeploy") | not) and contains("Linux-64bit") and contains(".tar.gz")) then .[1]  else empty end')

curl -sL $HUGO_LATEST | sudo tar -C /usr/local/hugo/bin -xzf - hugo
