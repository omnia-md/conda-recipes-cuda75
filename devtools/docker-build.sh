#!/bin/bash
set -e
set -x

# Activate devtools
source /opt/docker/bin/entrypoint

conda config --add channels omnia
conda config --add channels omnia/label/cuda75
# Move the conda-forge channel to the top
# Cannot just append omnia otherwise default would have higher priority
conda config --add channels conda-forge
conda install -yq conda\>=4.3 conda-build=2.1.5 jinja2 anaconda-client

#/io/conda-build-all -vvv --python $PY_BUILD_VERSION $UPLOAD -- /io/cuda75
conda install -yq cuda75
/io/conda-build-all -vvv --check-against "omnia/label/cuda75" --python $PY_BUILD_VERSION $UPLOAD -- /io/openmm-cuda75

#mv /anaconda/conda-bld/linux-64/*tar.bz2 /io/ || true
