#!/usr/bin/bash
source ./.env
#platform=linux/amd64,linux/arm64 

podman build \
    -f Dockerfile \
    --tag tiny_nvr:latest \
    --build-arg HTTPS_PROXY=$HTTPS_PROXY \
    .

