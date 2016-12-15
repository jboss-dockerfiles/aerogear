#!/bin/bash

set -e

# launch wildfly
exec /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 $@
