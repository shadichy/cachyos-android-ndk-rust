FROM ghcr.io/shadichy/cachyos-android-ci:latest

# Switch to builder user
USER builder
WORKDIR /home/builder
RUN export HOME=/home/builder

# Install dependencies
RUN paru -S --skipreview --batchinstall --noconfirm --needed doxygen glslang python-mako python-yaml python-ply python-packaging rustup cmake rust-bindgen cbindgen flex bison libclc spirv-tools spirv-llvm-translator llvm llvm-libs

# Install rust
RUN rustup default stable
RUN rustup target add x86_64-linux-android

# Switch back to root
USER root
