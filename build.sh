#!/bin/bash
docker build --tag=devskim .
cd tests
if ./tests.sh devskim ; then
    echo All tests passed
else
    echo There were failed tests
    exit 1
fi