import subprocess

failed = subprocess.call(["pip", "install", "-e", ".", "--verbose"])
assert not failed

import ZiPyFilter

assert zaml.load() == 1
