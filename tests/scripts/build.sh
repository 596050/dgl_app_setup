#!/bin/bash

# Argument
#  - dev: cpu or gpu
if [ $# -ne 1 ]; then
    echo "Device argument required, can be cpu or gpu"
    exit -1
fi

dev=$1

set -e
. /opt/conda/etc/profile.d/conda.sh

for backend in pytorch mxnet tensorflow
do
  conda activate "${backend}-ci"
  # install dgl nightly-build
  if [ "$dev" == "gpu" ]; then
    pip install -y dgl-cu101 --pre
  else
    pip install -y dgl --pre
  fi
done
