#!/bin/bash
set -e
devskim analyze . devskim.txt
chmod 666 devskim.txt

if [ -s devskim.txt ]
then
    exit 1
else
    exit 0
fi