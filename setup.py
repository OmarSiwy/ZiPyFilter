from setuptools import setup
from pathlib import Path

from builder import ZigBuilder

setup(
    name="ZiPyFilter",
    version="0.0.1",
    url="https://github.com/OmarSiwy/ZiPyFilter",
    description="Fast Filter for Python 3.6+",
    cmdclass={"build_ext": ZigBuilder},
    long_description=(Path(__file__).parent / "README.md").read_text(encoding="utf-8"),
    long_description_content_type="text/markdown",
    py_modules=["builder"],
)
