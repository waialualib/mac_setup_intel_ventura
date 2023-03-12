#!/bin/zsh
appsInDock=(
  #"/System/Applications/Finder"
  "/System/Applications/App Store"
  "/Applications/Safari"
  "/Applications/Firefox"
  "/Applications/Google Chrome"
  # "/Applications/Anaconda-Navigator"
  "/System/Applications/Utilities/Terminal"
  "/Applications/XCode"
  "/Applications/Visual Studio Code"
  "/Applications/Android Studio"
  "/Applications/DBeaver"
  "/Applications/Element"
  "/System/Applications/FaceTime"
  "/System/Applications/Freeform"
  "/Applications/Gimp"
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
  "/Applications/Sequel Pro"
  "/System/Applications/System Settings"
  "/System/Applications/Calculator"
  "/System/Applications/TextEdit"
  # "/Applications/AdGuard"
  # "/Applications/VirtualBox"

)

dockutil --remove all
for appName in ${appsInDock}
do
  # echo 'Adding item '${appName}' to Dock...'
  dockutil --add ${appName}.app --no-restart
done
dockutil --list