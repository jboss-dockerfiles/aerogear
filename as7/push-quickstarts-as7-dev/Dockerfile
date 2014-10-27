# Use latest aerogear/as7 image as the base
FROM aerogear/as7
MAINTAINER Bruno Oliveira <bruno@aerogear.org>

# Set the repository name
ENV REPO_NAME aerogear-push-quickstarts

# Make it explicity to the shell script
ENV TERM xterm

# Set MAVEN_OPTS to increase the amount of memory available for Maven
ENV MAVEN_OPTS -Xmx768m -XX:+UseConcMarkSweepGC -XX:MaxPermSize=128m -XX:+CMSPermGenSweepingEnabled

# Java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk

# Set the Maven version
ENV MAVEN_VERSION 3.1.1

# Set M2_HOME directory
ENV M2_HOME /opt/aerogear/tools/maven

# General system variable setup
ENV PATH $JAVA_HOME/bin:$M2_HOME/bin:$PATH

# Run everything below as aerogear root
USER root

# Install cowsay, xterm and clean the metadata
RUN sudo yum -q -y install git cowsay xterm-256color && yum -q clean all

# Give access to /bin/bash to execute shell scripts
RUN usermod -s /bin/bash aerogear

# Add initialization script to bin folder
ADD resources/quickstart-config.sh /opt/aerogear/bin/
ADD launch.sh /opt/aerogear/bin/

RUN chmod -R 755 /opt/aerogear/bin

# Run everything below as aerogear user
USER aerogear

# Switch to the working dir /opt/aerogear
WORKDIR /opt/aerogear

# Create /opt/aerogear/tools/maven, download and extract Maven
RUN mkdir -p $M2_HOME && cd $M2_HOME && curl http://mirror.nbtelecom.com.br/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar zx --strip 1 -C $M2_HOME

# Clone UnifiedPush server from the official repository
RUN git clone https://github.com/aerogear/$REPO_NAME.git

# Switch to the cloned repository and run Maven install
RUN cd $REPO_NAME && mvn clean install -DskipTests=true

ENTRYPOINT ["/opt/aerogear/bin/launch.sh"]

