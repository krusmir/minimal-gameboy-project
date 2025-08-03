# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables
ENV GBDK_VERSION=4.3.0
ENV GBDK_DIR=/opt/gbdk
ENV GBDK_URL=https://github.com/gbdk-2020/gbdk-2020/releases/download/${GBDK_VERSION}/gbdk-linux64.tar.gz
ENV PATH="${GBDK_DIR}/bin:${PATH}"

# Install necessary packages, download and extract GBDK, then clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    make \
    wget \
    tar \
    ca-certificates \
    && wget -O /tmp/gbdk.tar.gz ${GBDK_URL} \
    && mkdir -p ${GBDK_DIR} \
    && tar -xzf /tmp/gbdk.tar.gz -C ${GBDK_DIR} --strip-components=1 \
    && rm /tmp/gbdk.tar.gz \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory to GBDK examples
WORKDIR ${GBDK_DIR}/examples/gb

# Default command to build the examples
CMD ["make"]
