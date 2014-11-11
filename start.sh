#!/bin/bash
set -e

BUILDOUT_DIR=/opt/buildout

if [ -s $BUILDOUT_DIR/requirements.txt ]; then
    sudo pip install -r $BUILDOUT_DIR/requirements.txt
fi

if [ ! -s $BUILDOUT_DIR/bootstrap.py ]; then
    sudo easy_install -U setuptools
    wget -O $BUILDOUT_DIR/bootstrap.py http://svn.zope.org/*checkout*/zc.buildout/trunk/bootstrap/bootstrap.py
fi
