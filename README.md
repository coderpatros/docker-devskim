![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/coderpatros/devskim)
![Docker Pulls](https://img.shields.io/docker/pulls/coderpatros/devskim.svg)
[![](https://images.microbadger.com/badges/image/coderpatros/devskim.svg)](https://microbadger.com/images/coderpatros/devskim "Get your own image badge on microbadger.com")
![GitHub](https://img.shields.io/github/license/patros/docker-devskim)


DevSkim Docker Container
========================

_PLEASE NOTE: I am currently using a custom build of DevSkim CLI._

The official build does not currently support suppression comments or non-zero exit codes when issues are found.
To review the changes I've made please view the commit history in my
[custom branch](https://github.com/patros/DevSkim/commits/custom).

Once upstream changes have been accepted I'll revert to using it.

Basic Usage
-----------

Running (assuming source code is in the current working directory)...

    docker run --volume `pwd`:/code coderpatros/devskim:latest analyze /code

If no issues are found the exit code will be 0.

More Documentation
------------------

Please refer to the [official repository](https://github.com/microsoft/devskim) for more documentation.

Docker Tags
-----------

Current tag to track is `latest`.

I regularly rebuild the image to ensure it picks up any updates to the base
`ubuntu:18.04` image

I'm keeping an eye on DevSkim releases and will update as soon as I can.

Although there hasn't been much activity in the DevSkim repo recently I've
been assured that it is still actively maintained ([refer issue #69](https://github.com/microsoft/DevSkim/issues/69)).
