#!/bin/bash

printf \
'======================
Scripts: Build container image with props
Props: [image_name: str], [tag_name: str]
====================== \n'

# ---------------
# Declare build variables
# ---------------
image_name="tinynvr"
tag_name="latest"

read -p "Set container image name [tinynvr]: " image_name
read -p "Set version or build tag [latest]: " tag_name

# ---------------
# Build container image
# ---------------
props="
-f ./dockerfile
-t ${image_name}:${tag_name}
"

sudo docker build ${props} .

# ---------------
# Read back images
# ---------------
sudo docker images | head -n 2

printf \'\
\n======================
Image: ${image_name}
Tag: ${tag_name}
Refer to readme.md on usage with docker compose as image base.
====================== \n\'