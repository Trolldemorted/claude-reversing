FROM ubuntu

WORKDIR /workdir
ENV PATH="$PATH:/root/.local/bin"
ENV IS_SANDBOX=1

RUN apt-get update && apt-get install -y curl zip unzip wget python3 git python3-setuptools python3-pip maven jq build-essential file xxd gcc-mingw-w64-i686-win32 wine wine64 xvfb imagemagick gcc-mingw-w64-i686 mingw-w64-tools autoconf automake libtool make clang-tidy tmux screen

# Install Claude
RUN curl -fsSL https://claude.ai/install.sh | bash

COPY --from=ghcr.io/trolldemorted/ghidra-headless-cli/ghidra-rpc:latest /ghidra-headless-cli /usr/local/bin/ghidra-headless-cli
COPY --from=ghcr.io/trolldemorted/warren:latest /usr/local/bin/warren-cli /usr/local/bin/warren-cli

ENTRYPOINT sleep 999999999
