#!/bin/bash

set -e
# run migrator
echo "Starting Liquibase migration"
cd $UPSDIST/migrator/ups-migrator
./bin/ups-migrator update

# launch wildfly
exec /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 $@
