FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

ENV CELLRANGER_ATAC_VERSION 1.2.0

ENV PATH /opt/cellranger-atac-${CELLRANGER_ATAC_VERSION}:$PATH

RUN yum group install -y "Development Tools" \
    && yum install -y which

# https://support.10xgenomics.com/single-cell-atac/software/downloads/1.2/
# cell ranger atac binaries
RUN curl -o cellranger-atac-${CELLRANGER_ATAC_VERSION}.tar.gz "http://cf.10xgenomics.com/releases/cell-atac/cellranger-atac-1.2.0.tar.gz?Expires=1580027812&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWF0YWMvY2VsbHJhbmdlci1hdGFjLTEuMi4wLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTU4MDAyNzgxMn19fV19&Signature=EgRrXv4I0tcflBMgUgzlDRKMMHUEutvpvIAGTcjP9fokkYpCc7zbXOp6c7NGxrdzMv-912TVGVEHlcIXVCZ0XV1mjUZ2eKWn0L-vcLi1QF4u~8FHVkuMGr-ncrOXePdOtESI3ItctYq8BMil8xXwDpZf-0TIPeTxhMTmFjy4ITw04xop09DgTr6wTbsbv7WycFujrH4avepGHwWH0llfW2PXHZt9TVnsGwwikHkpRgYiKIemh09URSEucAIHUYwZdfEMODDgJWB9KWrN-vLAE-fDB48vLkFUyx3PZGdVb0tzEaEtleC5BJXO4yq-caCYAW7M5AfIQy5bFOLmmBO2zA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" \
    && tar xzf cellranger-atac-${CELLRANGER_ATAC_VERSION}.tar.gz \
    && rm -rf cellranger-atac-${CELLRANGER_ATAC_VERSION}.tar.gz \
    && mv cellranger-atac-${CELLRANGER_ATAC_VERSION} /opt/

# human reference
# RUN curl -O http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-GRCh38-${CELLRANGER_ATAC_VERSION}.tar.gz \
#     && tar xzf refdata-cellranger-atac-GRCh38-${CELLRANGER_ATAC_VERSION}.tar.gz \
#     && rm -rf refdata-cellranger-atac-GRCh38-${CELLRANGER_ATAC_VERSION}.tar.gz \
#     && mv refdata-cellranger-atac-GRCh38-${CELLRANGER_ATAC_VERSION} /opt/

# # mouse reference
# RUN curl -O http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-mm10-${CELLRANGER_ATAC_VERSION}.tar.gz \
#     && tar xzf refdata-cellranger-atac-mm10-${CELLRANGER_ATAC_VERSION}.tar.gz \
#     && rm -rf refdata-cellranger-atac-mm10-${CELLRANGER_ATAC_VERSION}.tar.gz \
#     && mv refdata-cellranger-atac-mm10-${CELLRANGER_ATAC_VERSION} /opt/

WORKDIR /opt
