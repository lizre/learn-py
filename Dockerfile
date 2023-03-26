##############################
# FROM: 
# means the "base image"
##############################

ARG VARIANT="3.7"
FROM mcr.microsoft.com/vscode/devcontainers/python:0.204.6-${VARIANT}

# alternative:
# FROM python:3.9

# The mcr.microsoft.com one includes not only the Python runtime and standard library, but 
# also a tools and libraries like pip, virtualenv, and Git. 
# also pre-configured settings and extensions for Visual Studio Code, 
# such as syntax highlighting and linting for Python

# python:3.9 image provides only the Python 3.9 runtime and standard library
# all the ones you can use are at https://github.com/docker-library/python/tree/master
# ones under 3.X.X are OSs; eg 3.11-alpine3.16 https://github.com/docker-library/python/tree/master/3.11/alpine3.16

# these python ones already come with an OS. otherwise you could do something like FROM ubuntu:16.04.

##############################
# LABEL: 
# for metadata 
##############################

LABEL AUTHOR=lizre

##############################
# COPY: 
# copy files from the host computer into the container when container is run
##############################

COPY requirements.txt /tmp/pip-tmp/

# copies from the requirements.txt directory in your Codespace,
# into the /tmp/pip-tmp directory in the Docker image.

# if you copy your requirements.txt file directly into the image, 
# it will be stored in the same directory as the other files in the image. 
# If there are any other files in the image with the same name as your requirements.txt file, 
# or if there are any files in the image that conflict with the dependencies you are 
# trying to install, this could cause issues when you try to install the dependencies using pip.

# so instead, copy into a /tmp/pip-tmp/ directory 

##############################
# RUN: 
# 
##############################

RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

# By default, pip checks for the latest version of pip before installing any packages. 
# --disable-pip-version-check option disables this check. Faster installation and avoid potential compatibility issues.

# --no-cache-dir can help reduce the size of the Docker image.

# rm -rf /tmp/pip-tmp removes the tmp/pip-tmp directory from the Docker image to clean up the temporary files
    # you could also comment it out to leave the tmp directory there
        # as here https://github.com/github/security-advisory-filtering/commit/3938d544b471ee1f81e7e663ee14fd8714c90ac7