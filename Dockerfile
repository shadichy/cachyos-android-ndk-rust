FROM ghcr.io/shadichy/cachyos-android-ci:latest

# Switch to builder user
USER builder
WORKDIR /home/builder
RUN export HOME=/home/builder

# Install rust
RUN rustup default stable
RUN rustup target add x86_64-linux-android

# Switch back to root
USER root
