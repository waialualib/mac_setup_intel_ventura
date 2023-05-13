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
echo 'Installing apps with user: '${USER}

echo "Installing XCode Command Line Tools"
xcode-select --install
sudo xcodebuild -license accept

echo "Checking if brew is installed..."
which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Updating brew..."
brew update
brew analytics off

echo "Installing Git..."
brew install git
echo "Git config"
git config --global user.name "Home Dev"
git config --global user.email nshkrdotcom@nshkr.com

appsNoCask=(
  # git-extras
  # legit
  # git-flow
  tree
  wget
  gnupg
  # trash
  # node
  ffmpeg
  yt-dlp
  hugo
)
install_nocasks $appsNoCask

./setupYTDLP.sh

# echo "Install grunt for node"
# npm install -g grunt-cli
#@TODO install our custom fonts
brew cleanup

### TODO: dotfiles
# git clone git@github.com:TODO/dotfiles.git .dotfiles
# cd .dotfiles
# sh symdotfiles

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

# https://proxyman.io/posts/2019-10-26-Alternatives-for-charles-proxy-and-wireshark

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
  cleanmymac
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
  virtualbox  
  wireshark
  mactex
)
install_casks $apps

brew cleanup

appsNoCask=(
  pyenv
  erlang
  elixir
  postgresql@15
)
install_nocasks $appsNoCask

echo 'Adding postgresql@15 to path.'
echo 'export PATH="/usr/local/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc

echo 'Adding postgresql@15 to startup.'
brew services start postgresql@15

# Install Phoenix web framework
echo 'Installing Mix and Phoenix web framework.'
mix local.hex --force
mix archive.install --force hex phx_new

if [ ! -f ~/.pyenv/version ]; then
  echo 'Installing latest Python 3 via pyenv.'
  pyenv install -vf 3
  echo 'Setting latest Python 3 to global via pyenv.'
  pyenv global 3
  # pyenv local 3
  # pyenv install -vf 2
  # # pyenv local 2
  # pyenv local 2
  # https://github.com/pyenv/pyenv#installation
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(pyenv init -)"' >> ~/.zshrc
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
  echo 'eval "$(pyenv init -)"' >> ~/.zprofile
else ## TODO: test if 3 is installed and set
  echo "~/.pyenv/version exists." >&2
fi

# https://www.chrisjmendez.com/2018/11/07/installing-jupyter-on-os-x-using-homebrew/
brew install jupyterlab
brew install libgit2

apps=(
  r
  rstudio
)
install_casks $apps

echo 'Install R and link to Jupyter per: https://www.chrisjmendez.com/2018/12/04/configure-jupyter-notebook-to-work-with-r/ '

# TODO: FONTS
# brew tap homebrew/cask-fonts 
# brew install --cask font-source-code-pro

brew tap lotyp/homebrew-formulae
brew install lotyp/formulae/dockutil
dockutil --version
