#!/bin/bash

# Setup environment
if [ ! -d venv ] ; then
  python -m venv venv
  . venv/bin/activate
  pip install -r requirements.txt
else
  . venv/bin/activate
fi

# Build example
if [ ! -d sources/PressStart2P.designspace ] ; then
  python -m scripts.bdf2ufo.cli -c sources/PressStart2P-build-config.yaml sources/PressStart2P.bdf sources
fi
gftools builder sources/config.yaml
