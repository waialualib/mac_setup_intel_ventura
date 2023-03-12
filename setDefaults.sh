#!/bin/zsh

# https://superuser.com/questions/472038/how-can-i-enable-the-firewall-via-command-line-on-mac-os-x
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# https://github.com/drduh/macOS-Security-and-Privacy-Guide#application-layer-firewall
## anything interestint in here?

# https://www.kolide.com/blog/the-security-and-it-admin-s-guide-to-macos-ventura
# educational

# https://www.intego.com/mac-security-blog/unlock-the-macos-docks-hidden-secrets-in-terminal/

# MORE education?
# https://gist.github.com/ChristopherA/98628f8cd00c94f11ee6035d53b0d3c6

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName home
sudo scutil --set HostName home
sudo scutil --set LocalHostName home
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string home.share
dscacheutil -flushcache


# Disable the sound effects on boot
#sudo nvram SystemAudioVolume=" "
# https://apple.stackexchange.com/questions/431910/how-to-permanently-disable-the-mac-startup-sound
sudo nvram StartupMute=%01

defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
#defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false
# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
#defaults write com.apple.CrashReporter DialogType -string "none"
defaults write com.apple.helpviewer DevMode -bool true
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# https://git.herrbischoff.com/awesome-macos-command-line/about/
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Welcome to your MBP"

# https://www.defaults-write.com/os-x-display-additional-information-on-the-loginscreen/#more-939
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# https://www.defaults-write.com/stop-photos-from-opening-automatically/#more-1283
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# https://lupin3000.github.io/macOS/defaults/
defaults write com.apple.Dock orientation -string right

defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# https://macos-defaults.com/safari/showfullurlinsmartsearchfield.html#set-to-true

defaults write NSGlobalDomain com.apple.mouse.forceClick -bool false
defaults write com.apple.dock "orientation" -string "right"
defaults write com.apple.dock "tilesize" -int "36" 
defaults write com.apple.dock "show-recents" -bool "false" 
defaults write com.apple.dock "static-only" -bool "false"
killall Dock


#### DOCK TODO
# defaults read com.apple.Dock
defaults write com.apple.TextEdit "RichText" -bool "false"
# killall TextEdit
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "FALSE"
defaults write com.apple.menuextra.clock "Show24Hour" -bool "TRUE"
defaults write com.apple.menuextra.clock "ShowAMPM" -bool "FALSE"
defaults write com.apple.menuextra.clock "ShowDate" -bool "TRUE"
defaults write com.apple.menuextra.clock "ShowDayOfWeek" -bool "TRUE"
defaults write com.apple.menuextra.clock "ShowSeconds" -bool "TRUE"

killall SystemUIServer

defaults write com.apple.terminal "Startup Window Settings" Pro
defaults write com.apple.terminal "Default Window Settings" Pro

# adapted from 
# https://github.com/bramus/freshinstall/blob/master/steps/1.macos-settings.sh
# defaults read com.apple.Terminal
/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Pro:CursorBlink" ~/Library/Preferences/com.apple.Terminal.plist > /dev/null 2>&1
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Pro:CursorBlink bool true" ~/Library/Preferences/com.apple.Terminal.plist         

/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Pro:CursorType" ~/Library/Preferences/com.apple.Terminal.plist > /dev/null 2>&1
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Pro:CursorType integer 1" ~/Library/Preferences/com.apple.Terminal.plist         


# defaults read com.apple.preference.trackpad
### THIS WORKS, but requires a reboot
### TODO: make this work without needing to reboot
# defaults write com.apple.preference.trackpad ForceClickSavedState -int 0 &&
# defaults write com.apple.preference.trackpad ForceClick -int 0 &&
defaults write com.apple.AppleMultitouchTrackpad "ActuateDetents" -int 0 &&
defaults write com.apple.AppleMultitouchTrackpad "ForceSuppressed" -int 1

# /usr/libexec/PlistBuddy -c "Delete ActuateDetents" ~/Library/Preferences/com.apple.AppleMultitouchTrackpad  &&
# /usr/libexec/PlistBuddy -c "Add ActuateDetents bool true" ~/Library/Preferences/com.apple.AppleMultitouchTrackpad &&
# /usr/libexec/PlistBuddy -c "Delete ForceSuppressed" ~/Library/Preferences/com.apple.AppleMultitouchTrackpad  &&
# /usr/libexec/PlistBuddy -c "Add ForceSuppressed bool false" ~/Library/Preferences/com.apple.AppleMultitouchTrackpad

## more reading
# https://mosen.github.io/profiledocs/index.html
# https://developer.apple.com/documentation/devicemanagement/dock
# https://stackoverflow.com/questions/49214368/using-applescript-to-modify-settings-system-preferences
