import os
import subprocess


def check_secret_characteristics():
    """
    Checks that we have a secret accessible to this codespace.
    """
    secret = os.environ['NOT_SO_SECRET']
    assert secret is not None, "secret is not set"
    assert len(secret) > 0, "secret is not >0 characters long"


def check_pip():
    """
    Checks that we have pip.
    """
    assert "pip3" in os.popen("which pip3").read()


check_secret_characteristics()
check_pip()

print("All checks passed! Codespace set up correctly.")
