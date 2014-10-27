#!/bin/bash

##############################################################
# Run Maven, deploy the war file and start the server
##############################################################

source $HOME/bin/quickstart-config.sh

launch() {
  if [ -d $HOME/$REPO_NAME ] && [ -f $CONFIG_FILE ];then
    echo "Time to run Maven, be patient" | cowsay
    cd $HOME/$REPO_NAME && mvn clean install -DskipTests=true
    find $HOME/$REPO_NAME/ -not \( -name *mobile-proxy* -prune \) -name *.war -exec cp -i {} $JBOSS_HOME/standalone/deployments/ \;
  fi
  $JBOSS_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
}

##############################################################
# Check if the argument was informed during the boot time
# otherwise just call bash
##############################################################
if [ ! -z "$CONFIG" ]; then
  echo $CONFIG > $CONFIG_FILE
  launch; /bin/bash
elif [ "$1" = "setup" ]; then
  config
else
  /bin/bash
fi

