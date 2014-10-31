#!/bin/bash

CONFIG_FILE=$HOME/$REPO_NAME/server/contacts-mobile-picketlink-secured/src/main/resources/META-INF/quickstarts-config.json

# Color functions
blue(){
  printf "\e[38;05;4m $1"
  tput sgr0
}
red(){
  printf "\e[38;05;160m $1"
  tput sgr0
}
yellow(){
  printf "\e[38;05;136m $1"
  tput sgr0
}
green(){
  printf "\e[38;05;100m $1"
  tput sgr0
}

# Configuration menu
config(){
  clear
  green "=========================================================================\n"
  green  "Quickstarts initial configuration\n"
  green "=========================================================================\n"
  blue ">>> UnifiedPush server URL: "
  read URL
  blue ">>> Push application ID: "
  read APPLICATION_ID
  blue ">>> Master Secret: "
  read MASTER_SECRET

  if [ -z $URL ] && [ -z $APPLICATION_ID ] && [ -z $MASTER_SECRET ]; then
    clear
    red "I would love if you configure the quickstarts, otherwise I won't be able to help you\n" | cowsay
    config
  else
    printf '{"serverUrl":"%s","applicationId":"%s","masterSecret":"%s"}\n' "$URL" "$APPLICATION_ID" "$MASTER_SECRET" > $CONFIG_FILE
    launch
    exit 0
  fi
}

