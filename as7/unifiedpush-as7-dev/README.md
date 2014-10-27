# AeroGear UnifiedPush server developer environment

This image prepares the environment required to build [AeroGear UnifiedPush](https://github.com/aerogear/aerogear-unifiedpush-server/) Server from scratch.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Running the image

**Note**: The image will run SSL by default with self signed certificates being automatically generated.

`docker run -it -p 8443:8443 abstractj/unifiedpush-as7-dev`

## Building the image (alternative)

Clone the repo and build yourself:

`docker build -t abstractj/unifiedpush-as7-dev .`

## Accessing it

Get the image IP address, for example:

`boot2docker ip` or `docker inspect IMAGENAME | grep -i IPAdr`

Access it:

It only exposes SSL port, all the requests will be redirected to HTTPS.

`https://myip:8443/ag-push`

## Pull request review

Start Docker with Bash

`docker run --rm -it --entrypoint=/bin/bash abstractj/unifiedpush-as7-dev && cd ..`

Add the configuration to fetch pull requests

`git config --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"`

Run git fetch

`git fetch origin`

Checkout

`git checkout origin/pr/PR_NUMBER`

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it. If you want more images, open issues
with the request.
