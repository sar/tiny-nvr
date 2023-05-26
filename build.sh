#!/bin/sh
source ./.env
#platform=linux/amd64,linux/arm64 
podman build env HTTPS_PROXY=$HTTPS_PROXY .
