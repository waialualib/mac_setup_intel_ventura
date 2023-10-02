#!/bin/zsh
source ./_functions.sh

apps=(
#  alfred # brew --cask alfred link
#  bettertouchtool
#  cloud
#  colloquy  
#  cornerstone
#  diffmerge
#  dropbox
#  filezilla
#  harvest
#  hipchat
#  licecap
#  mou
#  phpstorm
#  private-internet-access
#  razer-synapse
#  sourcetree
#  steam
#  spotify
#  sublime-text2
#  textexpander
#  virtualbox
#  mailbox
#  vlc 
#  skype
#  transmission
#  zoomus
#  onepassword
#  chromecast
#  qlmarkdown  
#  qlstephen
#  suspicious-package 
#  adguard
#  messenger
#  snapapi
  bartender
  #cleanmymac
  firefox
  microsoft-edge
  google-chrome
  vagrant
  iterm2
  sequel-pro
  anaconda
  android-studio
  dbeaver-community
  element
  firefox
  gimp
  inkscape
  krita
  whatsapp
  microsoft-excel
  microsoft-powerpoint
  microsoft-word
  scribus
  sloth
  visual-studio-code
  #virtualbox  
  wireshark
  #mactex
)
install_casks $apps

brew cleanup