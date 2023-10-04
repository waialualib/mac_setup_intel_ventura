#!/bin/zsh
source ./_functions.sh

## https://stackoverflow.com/questions/72782659/installing-flutter-using-homebrew

brew tap leoafarias/fvm
brew install fvm

#apps=(
#  flutter
#)
#install_casks $apps

brew cleanup

#fvm install stable
#fvm cleanup

fvm install 2.10.5
fvm cleanup
fvm global 2.10.5

echo 'export PATH="$PATH:$USER/fvm/default/bin"' >> ~/.zshrc

source ~/.zshrc

dart --disable-analytics
code --install-extension Dart-Code.flutter
