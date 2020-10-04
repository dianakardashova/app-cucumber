#!/bin/bash
set -e
echo "$(pwd) /usr/local/bundle/bin/cucumber ./features/ "$@""
mkdir -p ../test-reports
/usr/local/bundle/bin/cucumber ./features/ "$@"
