#!/bin/bash

if [ ! -s $BUILDOUT_DIR/bootstrap.py ]; then
    easy_install -U setuptools
    wget -O $BUILDOUT_DIR/bootstrap.py http://svn.zope.org/*checkout*/zc.buildout/trunk/bootstrap/bootstrap.py
fi
