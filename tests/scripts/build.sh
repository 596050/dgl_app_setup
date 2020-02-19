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

rm -rf _deps
mkdir _deps
pushd _deps
conda activate "pytorch-ci"
if [ "$dev" == "gpu" ]; then
  pip download dgl-cu101 --pre --no-deps
else
  pip download dgl --pre --no-deps
fi
unzip dgl*.whl
rm dgl*.whl
popd
