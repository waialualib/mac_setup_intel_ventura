#!/bin/zsh
appsInDock=(
  #"/System/Applications/Finder"
  "/Applications/Anaconda-Navigator"
  "/System/Applications/Utilities/Terminal"
  "/Applications/AdGuard"
  "/Applications/Android Studio"
  "/System/Applications/App Store"
  "/System/Applications/Calculator"
  "/Applications/DBeaver"
  "/Applications/Element"
  "/System/Applications/FaceTime"
  "/Applications/Firefox"
  "/System/Applications/Freeform"
  "/Applications/Gimp"
  "/Applications/Google Chrome"
  "/Applications/Inkscape"
  "/Applications/iTerm"
  "/Applications/krita"
  "/System/Applications/Messages"
  "/Applications/Messenger"
  "/Applications/Microsoft Excel"
  "/Applications/Microsoft PowerPoint"
  "/Applications/Microsoft Word"
  "/System/Applications/Music"
  "/System/Applications/News"
  "/Applications/Safari"
  "/Applications/Sequel Pro"
  "/System/Applications/System Settings"
  "/System/Applications/TextEdit"
  "/Applications/VirtualBox"
  "/Applications/Visual Studio Code"
)

dockutil --remove all
for appName in ${appsInDock}
do
  # echo 'Adding item '${appName}' to Dock...'
  dockutil --add ${appName}.app --no-restart
done
dockutil --list