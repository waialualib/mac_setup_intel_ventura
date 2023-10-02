#!/bin/zsh

function install_casks {
  # Install apps to /Applications, Default is: /Users/$user/Applications
  for appName in "$@"
  do
    echo 'Installing cask: '"$appName"
    brew install --cask --appdir="/Applications" "$appName"
  done
}

function install_nocasks {
  echo "Installing apps with Brew Cask..." 
  for appName in "$@"
  do
    echo 'Installing app '"$appName"' with Brew...'
    brew install --appdir="/Applications" "$appName"
  done
}

USER=`whoami`
