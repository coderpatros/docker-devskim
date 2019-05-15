[![Build status](https://dev.azure.com/patros/OpenSource/_apis/build/status/docker-devskim)](https://dev.azure.com/patros/OpenSource/_build/latest?definitionId=23)
![Docker Pulls](https://img.shields.io/docker/pulls/coderpatros/devskim.svg)

DevSkim Docker Container
========================

Basic Usage
-----------

Running (assuming source code is in the current working directory)...

    docker run --user `id --user`:`id --user` --volume `pwd`:/code devskim analyze /code /code/devskim.txt

will generate a `devskim.txt` file in the current working directory.

If no issues are found the file will be empty.

Explanation:

This runs the devskim process as the current user ensuring new files have the expected file ownership

    --user `id --user`:`id --user`

This mounts the current working directory as `/code` within the container (`pwd` is print working directory)

    --volume `pwd`:/code

Docker Tags
-----------

Current tag to track is `latest`.

I regularly rebuild the image to ensure it picks up any updates to the base
`ubuntu:18.04` image

I'm keeping an eye on DevSkim releases and will update as soon as I can.

Although there hasn't been much activity in the DevSkim repo recently I've
been assured that it is still actively maintained ([refer issue #69](https://github.com/microsoft/DevSkim/issues/69)).
