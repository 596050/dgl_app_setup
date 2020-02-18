#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Setup script"""
import os
import re
import sys
import shutil
import platform
import subprocess

from setuptools import find_packages
from setuptools.dist import Distribution
from setuptools.command.build_ext import build_ext
from distutils.version import LooseVersion

# need to use distutils.core for correct placement of cython dll
if '--inplace' in sys.argv:
    from distutils.core import setup
    from distutils.extension import Extension
else:
    from setuptools import setup
    from setuptools.extension import Extension

# Package name. Change this to your app name.
app = 'myapp'

CURRENT_DIR = os.path.dirname(__file__)

def get_lib_version():
    """Get library  and version"""
     # We can not import `libinfo.py` in setup.py directly since __init__.py
    # Will be invoked which introduces dependences
    libinfo_py = os.path.join(CURRENT_DIR, app, 'libinfo.py')
    libinfo = {'__file__': libinfo_py}
    exec(compile(open(libinfo_py, "rb").read(), libinfo_py, 'exec'), libinfo, libinfo)
    version = libinfo['__version__']

    return version

VERSION = get_lib_version()

setup_kwargs = {}

setup(
    name=app,
    version=VERSION,
    author='Peter Pan',
    author_email='Peter@neverland.org',
    description='Some short description',
    keywords=[
        'fairy',
        'pirate',
        'mermaid',
    ],
    packages=find_packages(),
    install_requires=[
        'dgl>=0.4',
    ],
    long_description="""
Long long long long long long long long long long long long long long long long 
long long long long long long long long long long long long long long long long 
long long long long long long long long long long long long long long long long 
description.
    """,
    zip_safe=False,
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: Apache Software License',
    ],
    license='APACHE',
    **setup_kwargs
)
