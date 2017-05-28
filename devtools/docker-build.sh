#!/bin/bash
set -e
set -x

# Activate devtools
source /opt/docker/bin/entrypoint

conda config --add channels omnia
conda config --add channels omnia/labels/cuda75
# Move the conda-forge channel to the top
# Cannot just append omnia otherwise default would have higher priority
conda config --add channels conda-forge
conda install -yq conda\>=4.3 conda-build jinja2 anaconda-client

/io/conda-build-all -vvv --python $PY_BUILD_VERSION $UPLOAD -- /io/*

#mv /anaconda/conda-bld/linux-64/*tar.bz2 /io/ || true
