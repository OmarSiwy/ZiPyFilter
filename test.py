import subprocess

failed = subprocess.call(["pip", "install", "-e", ".", "--verbose"])
assert not failed

import ZiPyFilter

assert ZiPyFilter.load() == 1
