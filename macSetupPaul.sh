#!/bin/zsh
echo 'Your WAN IP Address is: '$(dig +short txt ch whoami.cloudflare @1.0.0.1)
#read FOO
osascript -e 'tell application "System Preferences" to quit'
echo 'Your password is required to run commands as root...'
sudo -v
### is this needed? https://github.com/kevinSuttle/macOS-Defaults
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo 'System Settings -> My Name -> iCloud -> Turn off iCloud Drive, iCloud Mail, Photos'
echo 'Make sure Find My Mac is on'
echo 'Make sure Passwords & Keychain is on, and others below as needed'
echo 'System Settings -> Sharing: ALL OFF'
echo 'System Settings -> Airdrop & Handoff -> Allow Handoff: OFF'
echo 'System Settings -> Airdrop & Handoff -> Airdrop: No One'
echo 'System Settings -> Airdrop & Handoff -> Airplay Receiver: OFF'
echo 'Finder -> Settings -> Sidebar -> Favorites -> click "home"'
echo 'Messages -> Settings -> Shared with you -> turn off'
echo 'Are those done?'
echo 'Press [Enter] to continue...'
read FOO

echo 'These items cannot be automated as of macOS Monterey'
echo 'Please install XCode from the App Store now.'
echo 'Press [Enter] to continue...'
read FOO

echo 'Running setDefaults.sh script...'
./setDefaults.sh

####################### SSH
if [ ! -f ~/.ssh/id_rsa ]; then
  echo "Creating an RSA SSH key of length 4096 in ~/.ssh"   
  ssh-keygen -t rsa -b 4096
fi
echo "Please add your public key to your Github and Bitbucket accounts: \n"
cat ~/.ssh/id_rsa.pub
echo "https://github.com/account/ssh \n"
echo 'Press [Enter] to continue...'
read FOO

echo 'Running installApps.sh script...'
./installApps.sh

echo 'Running dockSetup.sh script...'
./dockSetup.sh

#SnapAPI
# Transporter - XCODE UPLOAD THING
#TypeFace - free font thing?
#Virtualbox ? Do I need?  DOCKER??

# FLUTTER / DART
## PYTHON
#  node??
# yarn

# echo 'Installing Phoenix Web Framework...'
# mix local.hex --force

### TODO: more stuff
### https://github.com/thomaspoignant/mac-dev-setup/blob/master/src/mac-dev-setup.sh
### https://github.com/donnemartin/dev-setup#osxprepsh-script

echo 'Running projectSetup.sh script'
./projectSetup.sh
