#! /usr/bin/env bash
set -e -o verbose

export DEBIAN_FRONTEND=noninteractive

apt update --yes
apt upgrade --yes

# Deps
apt install --yes \
    build-essential \
    locales \
    docker.io \
    curl \
    ruby-bundler \
    nodejs \
    gnupg2

# Locales
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update --yes
apt install --yes yarn