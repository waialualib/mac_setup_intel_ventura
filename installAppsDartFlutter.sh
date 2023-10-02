#!/bin/zsh
source ./_functions.sh

apps=(
  flutter
)
install_casks $apps

brew cleanup