#!/bin/bash
set -e
devskim analyze . devskim.txt
EXIT_CODE=$?
chmod 666 devskim.txt
exit $EXIT_CODE