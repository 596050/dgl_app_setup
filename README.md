# Setup for DGL-based Application Packages

## CI

The CI will be triggered with each commit and nightly. It depends on DGL nightly version 
and has separate tests for CPU and GPU.

We use Jenkins for CI server. `Jenkinsfile` defines the Jenkins Pipeline. Scripts for building 
docker images used are placed under `docker`.

## Documentation

Each application will have a documentation page host on `https://www.dgl.ai/`. Scripts for building 
documentation are placed under `docs`.

## Release

Pip and Conda distributions will be built and released.
