#!/usr/bin/env bash
set -e

# Set the version for tagging
VERSION="4.3.0"

# Build and tag the Docker image
docker build -t "gbdk:${VERSION}" .

