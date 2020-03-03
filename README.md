![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/coderpatros/devskim)
![Docker Pulls](https://img.shields.io/docker/pulls/coderpatros/devskim.svg)
![GitHub](https://img.shields.io/github/license/coderpatros/docker-devskim)


# DevSkim Docker Container

_PLEASE NOTE: The DevSkim team are planning to release an official Docker image [issue #64](https://github.com/microsoft/DevSkim/issues/64)._

When that happens I will being deprecating this image in favour of theirs.

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
