#!/bin/bash -e

source config.sh

# cellranger
docker run -it --rm \
    cellranger-atac:${version} --help
