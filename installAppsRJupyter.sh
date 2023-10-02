#!/bin/zsh
source ./_functions.sh

# https://www.chrisjmendez.com/2018/11/07/installing-jupyter-on-os-x-using-homebrew/
brew install jupyterlab
brew install libgit2

apps=(
  r
  rstudio
)
install_casks $apps

echo 'Install R and link to Jupyter per: https://www.chrisjmendez.com/2018/12/04/configure-jupyter-notebook-to-work-with-r/ '
