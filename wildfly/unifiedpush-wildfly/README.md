# AeroGear UnifiedPush server environment

This image prepares the environment required to run [AeroGear UnifiedPush](https://github.com/aerogear/aerogear-unifiedpush-server/) server with the binaries.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Running the image

**Note**: The image will run SSL by default with self signed certificates being automatically generated.

`docker run -it -p 8443:8443 abstractj/unifiedpush-wildfly`

## Building the image (alternative)

Clone the repo and build yourself:

`docker build -t abstractj/unifiedpush-wildfly .`

## Accessing it

Get the image IP address, for example:

`boot2docker ip` or `docker inspect IMAGENAME | grep -i IPAdr`

Access it:

It only exposes SSL port, all the requests will be redirected to HTTPS.

`https://myip:8443/ag-push`

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it. If you want more images, open issues
with the request.
