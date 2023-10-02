#!/bin/zsh
source ./_functions.sh

appsNoCask=(
  erlang
  elixir
)
install_nocasks $appsNoCask

# Install Phoenix web framework
echo 'Installing Mix and Phoenix web framework.'
mix local.hex --force
mix archive.install --force hex phx_new
