# Use latest jboss/wildfly image as the base
FROM jboss/wildfly
MAINTAINER Bruno Oliveira <bruno@abstractj.org>

# Set the HOME environment variable
ENV HOME /opt/aerogear

# Set the Java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk

# Run everything below as root user
USER root

# Clean the metadata
RUN yum -q clean all

# Disable requiretty to prevent Node.js sessions hangup
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

# Create the aerogear user
RUN useradd -m aerogear -d /opt/aerogear -s /sbin/nologin

# Change the owner of /opt/aerogear and /opt/wildfly directory
RUN chown -R aerogear /opt/aerogear && chown -R aerogear /opt/wildfly*

# Change the group of /opt/aerogear and /opt/wildfly directory
RUN chgrp -R users /opt/aerogear && chown -R aerogear /opt/wildfly*

# Allows aerogear user to run keytool and yum with sudo
RUN echo "aerogear ALL=NOPASSWD:/usr/bin/keytool,/usr/bin/yum" >> /etc/sudoers

# Rename the original configuration file
RUN mv $JBOSS_HOME/standalone/configuration/standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml.orig

# WildFly configuration file ready for HTTPS
ADD configuration/xml/standalone-sample.xml $JBOSS_HOME/standalone/configuration/standalone.xml

# Add the certificate.sh script into $JBOSS_HOME/standalone/configuration/certs
ADD configuration/certs/ $JBOSS_HOME/standalone/configuration/certs

# Add the database configuration file to $JBOSS_HOME/standalone/deployments
ADD configuration/database/unifiedpush-h2-ds.xml $JBOSS_HOME/standalone/deployments/

# Switch to $JBOSS_HOME/configuration/certs
WORKDIR /opt/wildfly/standalone/configuration/certs

# Execute the script to generate self signed certificates
RUN ./certificate.sh

# Switch to the working dir /opt/wildfly
WORKDIR /opt/wildfly

# Expose SSL default port
EXPOSE 8443
