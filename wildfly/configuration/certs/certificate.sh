#!/bin/sh

DOMAIN="aerogear.dev"

SERVER_PASSWORD=$(head -c 2000 /dev/urandom | tr -dc a-z0-9A-Z | head -c 256)

keytool -genkey -noprompt -alias server.$DOMAIN -keyalg RSA -keysize 2048 -keystore server.$DOMAIN.keystore -storepass $SERVER_PASSWORD -keypass $SERVER_PASSWORD -validity 365 -dname "C=US,ST=North Carolina,O=Red Hat,L=Raleigh,CN=server.aerogear.dev,OU=DEVELOPMENT,emailAddress=aerogear@aerogear.org"

sed -i "s/weak42/$SERVER_PASSWORD/g" ../standalone.xml

CLIENT_PASSWORD=$(head -c 2000 /dev/urandom | tr -dc a-z0-9A-Z | head -c 256)

keytool -genkey -noprompt -alias client.$DOMAIN -keyalg RSA -keysize 2048 -keystore client.$DOMAIN.keystore -storepass $CLIENT_PASSWORD -keypass $CLIENT_PASSWORD -validity 365 -storetype pkcs12 -dname "C=US,ST=North Carolina,O=Red Hat,L=Raleigh,CN=client.dev.aerogear,OU=DEVELOPMENT,emailAddress=aerogear@aerogear.org"

keytool -exportcert -keystore client.$DOMAIN.keystore -storetype pkcs12 -storepass $CLIENT_PASSWORD -alias client.$DOMAIN -keypass $CLIENT_PASSWORD -file client.$DOMAIN.cer
keytool -import -noprompt -file client.$DOMAIN.cer -alias client.$DOMAIN -keystore client.$DOMAIN.truststore -storepass $CLIENT_PASSWORD -keypass $CLIENT_PASSWORD
