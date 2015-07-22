# AeroGear UnifiedPush server environment

This image prepares the environment required to run [AeroGear UnifiedPush](https://github.com/aerogear/aerogear-unifiedpush-server/) server with the binaries.

## Install Docker

Follow the [instructions](http://docs.docker.com/installation/)

## Running the image

We need to run two different datasources, and each has been slpit up into its own container.

For our bundled Keycloak instance run the following command:


```shell
docker run --name keycloak \
           -p 5306:3306 \
           -e MYSQL_USER=unifiedpush \
           -e MYSQL_PASSWORD=unifiedpush \
           -e MYSQL_DATABASE=keycloak \
           -e MYSQL_ROOT_PASSWORD=supersecret \
           -d mysql		   
```


For the database of the UnifiedPush Server itself, a similar command is needed:

```shell
docker run --name unifiedpush \
           -p 3306:3306 \
           -e MYSQL_USER=unifiedpush \
           -e MYSQL_PASSWORD=unifiedpush \
           -e MYSQL_DATABASE=unifiedpush \
           -e MYSQL_ROOT_PASSWORD=supersecret \
           -d mysql
```

The two databases are now linked into the container that serves WildFly, containing the latest release of the UPS

```shell
docker run --name ups \
           --link unifiedpush:unifiedpush \
           --link keycloak:keycloak \
           -p 8443:8443 \
           -it aerogear/unifiedpush-wildfly
``` 

**Note**: The image will run SSL by default with self signed certificates being automatically generated.

## Building the image (alternative)

**Note**: First, you need to build the Dockerfile of the parent folder!

Afterwards build the `unifiedpush-wildfly` image yourself, by running: 

`docker build -t aerogear/unifiedpush-wildfly .`

## Accessing it

Get the image IP address, for example:

`boot2docker ip` or `docker inspect IMAGENAME | grep -i IPAdr`

Access it:

It only exposes SSL port, all the requests will be redirected to HTTPS.

`https://myip:8443/ag-push`

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it. If you want more images, open issues
with the request.
