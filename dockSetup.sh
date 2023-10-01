#!/bin/zsh
userName=`whoami`
appsInDock=(
  /System/Applications/Messages
  /System/Applications/FaceTime
  /Applications/Element
  /Applications/Whatsapp
  #/Applications/Messenger
  /System/Applications/App\ Store
  /System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari
  /Applications/Firefox
  /Applications/Microsoft\ Edge
  /Applications/Google\ Chrome
  # /Applications/Anaconda-Navigator
  /Applications/Wireshark
  # /Applications/VirtualBox
  /System/Applications/Utilities/Terminal
  /Applications/iTerm
  /Applications/XCode
  /Applications/Visual\ Studio\ Code
  /Applications/Android\ Studio
  /Applications/Tableau\ Desktop\ 2023.2
  /Applications/R
  /Applications/RStudio
  /Applications/DBeaver
  /Applications/Sequel\ Pro
  /System/Applications/Freeform
  /Applications/Gimp
  /Applications/Inkscape
  /Applications/Scribus
  /Applications/krita
  /Applications/Microsoft\ Excel
  /Applications/Microsoft\ PowerPoint
  /Applications/Microsoft\ Word
  /System/Applications/Music
  /System/Applications/News
  /System/Applications/System\ Settings
  /System/Applications/Calculator
  /System/Applications/TextEdit
  # /Applications/AdGuard

)

dockutil --remove all
for appName in ${appsInDock} #--no-restart
do
  # echo 'Adding item '${appName}' to Dock...'
  dockutil --add ${appName}.app
done
dockutil --add /Users/${userName}/Downloads

dockutil --list
