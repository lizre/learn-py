# Python language and development environment

In addition to language, covers package management, codespaces, devcontainers with docker, jupyter, testing.

# Codespace playbook

## Components

Secrets
- https://github.com/lizre/learn-py/settings/secrets/codespaces

### Relevant files 

.devcontainer/devcontainer.json
- configures the DevContainer: says the Docker image to use, extensions to install.
- runs .devcontainer/test_codespace.py

.devcontainer/Dockerfile
- instructions for building the Docker image  basis for the DevContainer. 
- Specifies the base image to use, and installs `pip` and `requirements.txt` 

.devcontainer/test_codespace.py
- tests Codespace: that it has `pip` and that the `secret` is not empty. 

## Maintenance
- when secrets change, update them at https://github.com/lizre/learn-py/settings/secrets/codespaces

