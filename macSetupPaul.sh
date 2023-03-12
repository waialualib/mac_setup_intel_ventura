#!/bin/zsh
echo 'Your WAN IP Address is: '$(dig +short txt ch whoami.cloudflare @1.0.0.1)
#read FOO
osascript -e 'tell application "System Preferences" to quit'
echo 'Your password is required to run commands as root...'
sudo -v

#dig +short txt ch whoami.cloudflare @1.0.0.1

### is this needed? https://github.com/kevinSuttle/macOS-Defaults
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
## while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &




echo 'These items cannot be automated as of macOS Monterey'
echo 'System Settings -> Trackpad -> Force Click and haptic feedback: OFF'
echo 'System Settings -> Sharing: ALL OFF'
echo 'System Settings -> Airdrop & Handoff -> Allow Handoff: OFF'
echo 'System Settings -> Airdrop & Handoff -> Airdrop: No One'
echo 'System Settings -> Airdrop & Handoff -> Airplay Receiver: OFF'
echo 'Are those done? Press [Enter] to continue...'
read FOO

# https://superuser.com/questions/472038/how-can-i-enable-the-firewall-via-command-line-on-mac-os-x
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# https://github.com/drduh/macOS-Security-and-Privacy-Guide#application-layer-firewall
## anything interestint in here?

# https://www.kolide.com/blog/the-security-and-it-admin-s-guide-to-macos-ventura
# educational

# https://www.intego.com/mac-security-blog/unlock-the-macos-docks-hidden-secrets-in-terminal/






# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName home
sudo scutil --set HostName home
sudo scutil --set LocalHostName home.local
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string home.share
dscacheutil -flushcache


# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "



defaults write NSGlobalDomain AppleShowScrollBars -string "Always"



















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
defaults write com.apple.dock "static-only" -bool "true"
killall Dock
#### DOCK TODO
# defaults read com.apple.Dock
defaults write com.apple.TextEdit "RichText" -bool "false"
killall TextEdit
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE dd MMM HH:mm:ss\"" 
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "true"
killall SystemUIServer

####################### SSH
if [ ! -f ~/.ssh/id_rsa ]; then
  echo "Creating an RSA SSH key of length 4096 in ~/.ssh"   
  ssh-keygen -t rsa -b 4096
fi
echo "Please add your public key to your Github: \n"
cat ~/.ssh/id_rsa.pub
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key once added"

###################### XCode
echo "Installing XCode"
xcode-select --install
xcodebuild -license accept

echo "Checking if brew is installed..."
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Updating brew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "Home Dev"
git config --global user.email nshkrdotcom@nshkr.com


echo "Installing brew git utilities..."
brew install git-extras 
brew install legit
brew install git-flow
  
echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
# brew install svn
# brew install mackup
# brew install node
  

USER=`whoami`

#@TODO install our custom fonts and stuff
  
echo "Cleaning up brew"
brew cleanup

### TODO: dotfiles


# git clone git@github.com:TODO/dotfiles.git .dotfiles
# cd .dotfiles
# sh symdotfiles

# GET NODE INSTALLED FIRST
brew install node

# echo "Grunting it up"
npm install -g grunt-cli

# #Install Zsh & Oh My Zsh
# # echo "Installing Oh My ZSH..."
# curl -L http://install.ohmyz.sh | sh

# # echo "Setting up Oh My Zsh theme..." 
# #cd  /Users/home/.oh-my-zsh/themes
# # curl 
# #  https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > ${USER}/.zsh-theme

# echo "Setting up Zsh plugins..."
# #cd ~/.oh-my-zsh/custom/plugins
# #git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
# cd ~





apps=(
#  alfred
  bartender
#  bettertouchtool
  cleanmymac
#  cloud
#  colloquy  
#  cornerstone
#  diffmerge
#  dropbox
#  filezilla
  firefox
  google-chrome
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
  vagrant
  iterm2
#  sublime-text2
#  textexpander
#  virtualbox
#  mailbox
#  vlc 
#  skype
#  transmission
#  zoomus
#  onepassword
  sequel-pro
#  chromecast
#  qlmarkdown  
#  qlstephen
#  suspicious-package 
  adguard
  anaconda
  android-studio
  dbeaver-community
  element
  firefox
  gimp
  inkscape
  krita
  messenger
  microsoft-excel
  microsoft-powerpoint
  microsoft-word
  scribus
  sloth
#  snapapi
  visual-studio-code
  virtualbox  
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps with Brew Cask..."   

for appName in ${apps}
do
  echo 'Installing cask: ${appName}'
  brew install --cask --appdir="/Applications" ${appName}
done


# brew --cask alfred link

brew cleanup

# https://www.chrisjmendez.com/2018/11/07/installing-jupyter-on-os-x-using-homebrew/

appsNoCask=(
  pyenv
  erlang
  elixir
  
)


for appName in ${appsNoCask}
do
  echo 'Installing apps with Brew...'
  brew install --appdir="/Applications" ${appName}
done

pyenv install -vf 3
pyenv local 3
pyenv global 3

# https://github.com/pyenv/pyenv#installation
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# https://www.chrisjmendez.com/2018/11/07/installing-jupyter-on-os-x-using-homebrew/
brew install jupyterlab

brew install libgit2
brew install r
echo 'Install R and link to Jupyter per: https://www.chrisjmendez.com/2018/12/04/configure-jupyter-notebook-to-work-with-r/ '


















brew tap homebrew/cask-fonts 

#SnapAPI
# Transporter - XCODE UPLOAD THING
#TypeFace - free font thing?
#Virtualbox ? Do I need?  DOCKER??



# FLUTTER / DART
## PYTHON
#  node??
# yarn
# Erlang?
#Elixir/Phoenix?


echo 'Installing Phoenix Web Framework...'
mix local.hex --force


### TODO: more stuff
### https://github.com/thomaspoignant/mac-dev-setup/blob/master/src/mac-dev-setup.sh
### https://github.com/donnemartin/dev-setup#osxprepsh-script


