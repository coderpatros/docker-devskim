![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/coderpatros/devskim)
![Docker Pulls](https://img.shields.io/docker/pulls/coderpatros/devskim.svg)
![GitHub](https://img.shields.io/github/license/coderpatros/docker-devskim)


# DevSkim Docker Container

_PLEASE NOTE: I am currently using a custom build of DevSkim CLI._

I _had_ been using a custom fork that included support for suppression comments
and non-zero exit codes when issues are found.

These changes have now been merged upstream. However the latest official
release still doesn't include these changes.

So this docker image includes a custom build based on the current `master`
branch.

## Basic Usage

Running (assuming source code is in the current working directory)...

    docker run --volume `pwd`:/code coderpatros/devskim:latest analyze /code

If no issues are found the exit code will be 0.

## Test Result Output

Possibly the simplest way to generate test results, for CI pipelines, is using pytest.

An example python script is available in [examples/devskim.py](examples/devskim.py).

By running `python3 -m pytest --junitxml=tests.xml devskim.py` as part of your
build pipeline you can then publish the test results from `tests.xml`.

This is a great way to incorporate the tool into your build process.

The example script can also be modified to scan multiple repositories using the
`@pytest.mark.parametrize` decorator. I'm currently using a similar script to
scan over 350 repositories in Azure DevOps from a single build pipeline
configuration.

## More Documentation

Please refer to the [official repository](https://github.com/microsoft/devskim)
for more documentation.

## Docker Tags

Current tag to track is `latest`.

I regularly rebuild the image to ensure it picks up any updates to the base
`ubuntu:18.04` image

I'm keeping an eye on DevSkim releases and will update as soon as I can.

Although there hasn't been much activity in the DevSkim repo recently I've
been assured that it is still actively maintained ([refer issue #69](https://github.com/microsoft/DevSkim/issues/69)).
