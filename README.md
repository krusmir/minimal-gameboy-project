[LaroldsJubilantJunkard.com](LaroldsJubilantJunkard.com) - [How to make a Gameboy Game](LaroldsJubilantJunkard.com/tutorials/how-to-make-a-gameboy-game)

# Minimal Gameboy Project - Linux Fork

This repository is a **Linux-focused fork** that provides a Docker-based development environment for creating Game Boy ROMs using GBDK 2020.

## Purpose of This Fork

This fork was created to provide a streamlined Linux development experience by:
- **Eliminating Windows dependencies** - Removes `make.bat` and Windows-specific tooling
- **Docker containerization** - Ensures consistent builds across different Linux distributions
- **Simplified workflow** - Single script handles both image building and compilation
- **Cross-platform compatibility** - Works on any system with Docker (Linux, macOS, WSL)
- **No local GBDK installation required** - Everything runs in an isolated container

Everything is built using [GBDK 2020](https://github.com/gbdk-2020/gbdk-2020) and the C Programming Language, containerized for reliable and reproducible builds.

## Prerequisites

- Docker installed on your system
- A Game Boy emulator like [BGB](https://bgb.bircd.org/) for testing

## Quick Start

1. **Clone this repository**
   ```bash
   git clone <your-repo-url>
   cd <your-repo-name>
   ```

2. **Build and compile your Game Boy ROM**
   ```bash
   ./gbdk.sh
   ```
   
   This will automatically:
   - Build the GBDK Docker image (first time only)
   - Compile your project to create the .gb ROM file

3. **Run the ROM file** in your preferred Game Boy emulator

## Usage

The `gbdk.sh` script provides several options:

```bash
# Basic compilation (builds image if needed)
./gbdk.sh

# Clean and rebuild
./gbdk.sh clean

# Force rebuild the Docker image
./gbdk.sh --force-build

# Only build the Docker image
./gbdk.sh --build-only

# Show help
./gbdk.sh --help
```

## Project Structure

- `Dockerfile` - Docker configuration for GBDK environment
- `gbdk.sh` - Unified build and compilation script
- `Makefile` - Build configuration for your Game Boy project
- Your C source files

## Docker Environment

The Docker setup includes:
- Ubuntu 24.04 base image
- GBDK 2020 v4.3.0
- All necessary build tools
- Optimized for minimal image size

## Development Workflow

1. Edit your C source files
2. Run `./gbdk.sh` to compile
3. Test the generated .gb file in an emulator
4. Repeat!

## Contact

If you have any questions, feel free to reach out to Larold's Jubilant Junkyard:
- Website: [LaroldsJubilantJunkard.com](LaroldsJubilantJunkard.com)
- Tutorial: [How to make a Gameboy Game](LaroldsJubilantJunkard.com/tutorials/how-to-make-a-gameboy-game)
- Facebook: [LaroldsJubilantJunkyard](https://www.facebook.com/LaroldsJubilantJunkyard)
- Email: <laroldsjubilantjunkyard@gmail.com>
