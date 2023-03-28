##############################
# FROM: 
# means the "base image"
##############################
ARG VARIANT="3.7"
FROM mcr.microsoft.com/vscode/devcontainers/python:0.204.6-${VARIANT}

# alternative:
# FROM python:3.7

# This mcr.microsoft.com (microsoft container registey) "image" includes not only Python,
# but git, zsh, a non-root vscode user with sudo access, nvm for node, 
# and stuff for VS Code like syntax highlighting and linting.
# Read more here: https://mcr.microsoft.com/en-us/product/devcontainers/python/about

# python:3.7 image only has Python
# all options: https://github.com/docker-library/python/tree/master
# already come with an OS. part after "-"" is OS; eg 3.11-alpine3.16
# otherwise you could do another FROM: like FROM ubuntu:16.04


##############################
# RUN: 
# execute command
##############################

RUN useradd -u 1337 -m non_root_user

# creates a new user with ID 1337
# -m creates a home directory for the new user. usually required to store user-specific data, settings, and configurations.
# non_root_user is the username for the new user.


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

# if you copy requirements.txt directly into the image, 
# it will be stored in the same directory as the other files in the image. 
    # If there are other files with the same name as requirements.txt, 
    # or that conflict with the packages in it, could cause issues.
# so instead, copy into a /tmp/pip-tmp/ directory 


##############################
# RUN
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

