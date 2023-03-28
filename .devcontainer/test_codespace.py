import os
import subprocess


def check_secret_characteristics():
    """
    Checks that we have a secret accessible to this codespace.
    """
    secret = os.environ['NOT_SO_SECRET']
    assert secret is not None, "AIP_API_KEY_TEMPORARY is not set"
    assert secret.isalnum(), "AIP_API_KEY_TEMPORARY is not alphanumeric"
    assert len(secret) > 0, "AIP_API_KEY_TEMPORARY is not >0 characters long"


def check_pip():
    """
    Checks that we have pip.
    """
    assert "pip3" in os.popen("which pip3").read()


check_secret_characteristics()
check_pip()

print("All checks passed! Codespace set up correctly.")
