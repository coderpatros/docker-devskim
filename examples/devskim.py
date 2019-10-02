import os
import pytest
import shutil
import subprocess


def test_devskim():
    issues_found = False
    devskim_output = None
    try:
        parameters = [
            'docker',
            'run',
            '--user',
            '%s:%s' % (os.getuid(), os.getuid()),
            '--volume',
            '%s:/code' % (os.getcwd(),),
            'coderpatros/devskim:latest',
            'analyze',
            '--severity',
            'critical',
            '/code',
            '/code/devskim.txt',
        ]
        subprocess.check_output(parameters)
    except subprocess.CalledProcessError as e:
        # DevSkim issues found
        if e.returncode != 0:
            issues_found = True
            with open('devskim.txt', 'rt') as f:
                devskim_output = f.read()
        # Something actually went wrong
        else:
            raise e
    assert issues_found == False, devskim_output
