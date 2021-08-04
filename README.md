# Dockerized Cell Ranger ATAC v2.0.0

## Build Container Image

```bash
./build.sh
```

`build.sh` can fail if the download link has expired (10x expires the Cell Ranger download link periodically). In this case, get the fresh link from https://support.10xgenomics.com/single-cell-atac/software/downloads/2.0/, and open `config.sh` and replace `${FRESH_LINK}` with the new link:

```
version="2.0.0"
download_url="${FRESH_LINK}"

# docker related
registry="quay.io/hisplan"
image_name="cellranger-atac"
```

## Push to Docker Registry

Either you can use the `docker push` command or run `push.sh` (requires [SCING](https://github.com/hisplan/scing)):

```bash
./push.sh
```
