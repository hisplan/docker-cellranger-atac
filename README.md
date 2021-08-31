# docker-cellranger-atac

Dockerized Cell Ranger ATAC v2.0.0

## Build Container Image

SCING (Single-Cell pIpeliNe Garden; pronounced as "sing" /siŋ/) is required for smooth and uninteruppted build process (e.g. CI/CD). For setup, please refer to [this page](https://github.com/hisplan/scing). All the instructions below is given under the assumption that you have already configured SCING in your environment.

[SCING](https://github.com/hisplan/scing) installation is required.

```bash
conda activate scing

./build.sh
```

## Push to Docker Registry

```bash
conda activate scing

./push.sh
```

## Usage

```bash
$ docker run -it --rm cellranger-atac:2.0.0 --help

cellranger-atac cellranger-atac-2.0.0
Process 10x Genomics Chromium Single Cell ATAC data

USAGE:
    cellranger-atac <SUBCOMMAND>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    count        Count reads from a single Single Cell ATAC library
    mkfastq      Run bcl2fastq on Single Cell ATAC sequencing data
    mkref        Create a cellranger-atac-compatible reference package
    aggr         Aggregate data from multiple `cellranger-atac count` runs
    reanalyze    Re-run secondary analysis (dimensionality reduction, clustering, etc) on a
                 completed `cellranger-atac count` or `cellranger-atac aggr` run
    testrun      Run a tiny cellranger-atac count pipeline to verify software integrity
    mkgtf        Filter a GTF file by attribute prior to creating a 10x reference
    upload       Upload analysis logs to 10x Genomics support
    sitecheck    Collect linux system configuration information
    help         Prints this message or the help of the given subcommand(s)
```
