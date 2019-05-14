DevSkim Docker Container
========================

Basic Usage
-----------

Running (assuming source code is in the current working directory)...

    docker run -v `pwd`:/code --tty coderpatros/devskim:latest

will generate a `devskim.txt` file.

If no issues are found the file will be empty and the process will terminate
with a zero exit code.

Otherwise you get a non-zero exit code and non-empty file.

Intent
------

There are already very good IDE plugins available for Visual Studio and VS Code.
You should definitely be using them.

The intent of this docker container is not to make it easy to run locally.
But to make it easy to run as part of your CI/CD process.

In my use case I want to "break builds" when rules haven't been addressed.
Hence the non-zero exit code for any rule matches, regardless of severity.

Docker Tags
-----------

Current tag to track is `latest`.

I regularly rebuild the image to ensure it picks up any updates to the base
`ubuntu:18.04` image

I'm keeping an eye on DevSkim releases and will update as soon as I can.

Although there hasn't been much activity in the DevSkim repo recently I've
been assured that it is still actively maintained ([refer issue #69](https://github.com/microsoft/DevSkim/issues/69)).
