FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

ARG CELLRANGER_ATAC_VERSION
ARG DOWNLOAD_URL
ENV PATH /opt/cellranger-atac-${CELLRANGER_ATAC_VERSION}:$PATH

RUN yum group install -y "Development Tools" \
    && yum install -y which

RUN curl -o cellranger-atac-${CELLRANGER_ATAC_VERSION}.tar.gz ${DOWNLOAD_URL} \
    && tar xzf cellranger-atac-${CELLRANGER_ATAC_VERSION}.tar.gz \
    && rm -rf cellranger-atac-${CELLRANGER_ATAC_VERSION}.tar.gz \
    && mv cellranger-atac-${CELLRANGER_ATAC_VERSION} /opt/

WORKDIR /opt

ENTRYPOINT [ "cellranger-atac" ]
CMD [ "--help"]
