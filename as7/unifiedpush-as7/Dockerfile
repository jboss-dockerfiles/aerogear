# Use latest aerogear/as7 image as the base
FROM aerogear/as7
MAINTAINER Bruno Oliveira <bruno@aerogear.org>

# Run everything below as aerogear user
USER aerogear

# Switch to the working dir $JBOSS_HOME/standalone/deployments
WORKDIR /opt/aerogear/server/standalone/deployments

# Download binary file for the UnifiedPush server
RUN curl -o ag-push.war https://repository.jboss.org/nexus/content/repositories/public-jboss/org/jboss/aerogear/unifiedpush/unifiedpush-server-as7/1.0.1/unifiedpush-server-as7-1.0.1.war

# Download binary file for the auth-server with Keycloak
RUN curl -o auth-server.war https://repository.jboss.org/nexus/content/repositories/public-jboss/org/jboss/aerogear/unifiedpush/unifiedpush-auth-server/1.0.1/unifiedpush-auth-server-1.0.1.war
