#!/bin/bash

docker login
docker tag cellranger-atac:1.2.0 hisplan/cellranger-atac:1.2.0
docker push hisplan/cellranger-atac:1.2.0
