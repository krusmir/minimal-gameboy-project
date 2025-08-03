#!/usr/bin/env bash
set -e

# Configuration
VERSION="4.3.0"
DOCKER_IMAGE="gbdk:${VERSION}"

# Function to check if Docker image exists
image_exists() {
    docker image inspect "$DOCKER_IMAGE" >/dev/null 2>&1
}

# Function to build the Docker image
build_image() {
    echo "Building GBDK Docker image..."
    docker build -t "$DOCKER_IMAGE" .
    echo "✓ Image built successfully"
}

# Parse command line arguments
BUILD_ONLY=false
FORCE_BUILD=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --build-only)
            BUILD_ONLY=true
            shift
            ;;
        --force-build)
            FORCE_BUILD=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS] [MAKE_ARGS...]"
            echo ""
            echo "Options:"
            echo "  --build-only    Only build the Docker image, don't run make"
            echo "  --force-build   Force rebuild of the Docker image"
            echo "  --help, -h      Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                    # Build image if needed, then run make"
            echo "  $0 clean             # Build image if needed, then run make clean"
            echo "  $0 --build-only      # Only build the Docker image"
            echo "  $0 --force-build     # Force rebuild, then run make"
            exit 0
            ;;
        *)
            break
            ;;
    esac
done

# Build image if it doesn't exist or if forced
if [[ "$FORCE_BUILD" == "true" ]] || ! image_exists; then
    build_image
fi

# If build-only flag is set, exit after building
if [[ "$BUILD_ONLY" == "true" ]]; then
    echo "Build complete. Use without --build-only to compile your project."
    exit 0
fi

# Run make with the remaining arguments
echo "Running make in GBDK container..."
docker run --rm -v "$(pwd)":/src -w /src "$DOCKER_IMAGE" make "$@"
