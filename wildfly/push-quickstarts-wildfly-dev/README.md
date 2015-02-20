# AeroGear UnifiedPush Quickstarts developer environment

This image prepares the environment required to build [AeroGear UnifiedPush Quickstarts](https://github.com/aerogear/aerogear-push-quickstarts/tree/master/server/) Server from scratch.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Running the image

**Note**: The image will run SSL by default with self signed certificates being automatically generated.

The quickstarts require the quickstarts-config.json file configuration for an initial setup, more details [here](https://github.com/aerogear/aerogear-push-quickstarts/blob/master/README.md). Under the *resources* folder is possible to find a sample.

There are two primary ways to configure it:

### Specify during the boot time

`docker run -e CONFIG="$(cat resources/quickstarts-config-sample.json)" -it aerogear/push-quickstarts-wildfly-dev`

### Execute the configuration script

Get Shell access:

`docker run -it -p 8443:8443 aerogear/push-quickstarts-wildfly-dev`

Execute the script:

`bin/launch.sh setup`

## Building the image (alternative)

Clone the repo and build yourself:

`docker build -t aerogear/push-quickstarts-wildfly-dev .`

## Accessing it

Get the image IP address, for example:

`boot2docker ip` or `docker inspect IMAGENAME | grep -i IPAdr`

Access it:

It only exposes SSL port, all the requests will be redirected to HTTPS.

`https://myip:8443/ag-push`

## Pull request review

Start Docker with Bash

`docker run --rm -it --entrypoint=/bin/bash aerogear/push-quickstarts-wildfly-dev && cd ..`

Add the configuration to fetch pull requests

`git config --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"`

Run git fetch

`git fetch origin`

Checkout

`git checkout origin/pr/PR_NUMBER`

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it. If you want more images, open issues
with the request.



