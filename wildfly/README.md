# AeroGear WildFly Docker image

This base image prepares [WildFly 10.x](http://wildfly.org/) to successfully deploy the AeroGear UnifiedPush Server project, including database and SSL configuration. This image is used on two slightly different variants on the UPS.

## Running the stable UPS release

To run the latest stable release of the UnifiedPush Server, please use the image provided [here](./unifiedpush-wildfly).

## Running the latest and greatest UPS version (fresh from github)

To run the latest and greatest from the community, please use the image provided [here](./unifiedpush-wildfly-dev). This builds and deploys the lastest from our master branch!

## Building the image (alternative)

Build the parent `wildfly` image yourself, by running: 

`docker build -t aerogear/wildfly .`

## Contributing

Patches are welcome, just send a pull request and I will be happy on merging it. If you want more images, open issues
with the request.
