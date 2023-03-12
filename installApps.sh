#!/bin/zsh


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
# #  https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > 
${USER}/.zsh-theme

# echo "Setting up Zsh plugins..."
# #cd ~/.oh-my-zsh/custom/plugins
# #git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
# cd ~



# https://proxyman.io/posts/2019-10-26-Alternatives-for-charles-proxy-and-wireshark

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
#  adguard
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

# pyenv install -vf 2
# pyenv local 2
# pyenv local 2


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
brew install --cask font-source-code-pro










brew tap lotyp/homebrew-formulae
brew install lotyp/formulae/dockutil
dockutil --version

