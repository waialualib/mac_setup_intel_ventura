#!/bin/zsh
source ./_functions.sh

echo 'Installing apps with user: '${USER}

echo "Installing XCode Command Line Tools"
sudo xcode-select --install
sudo xcodebuild -license accept
sudo xcodebuild -downloadPlatform iOS

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch


echo 'XCode now configured, installing ruby and cocoapods..'
# https://rvm.io/rvm/install
\curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash  -s stable --ruby
source /Users/${USER}/.rvm/scripts/rvm
## https://stackoverflow.com/questions/75589447/how-to-fix-the-running-rvm-make-j4-error-while-installing-ruby-3-2-1-us

## To get the path to installed openssl:
# which openssl
# > /opt/homebrew/bin/openssl 
rvm install ruby --latest -C --with-openssl-dir=/opt/homebrew/bin/openssl
sudo gem install cocoapods

echo "Checking if brew is installed..."
which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Updating brew..."
brew update
brew analytics off

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/${USER}/.zpro
eval "$(/opt/homebrew/bin/brew shellenv)"


echo "Installing Git..."
brew install git
echo "Git config"
git config --global user.name "Home Dev"
git config --global user.email nshkrdotcom@nshkr.com

echo "Installing Rosetta 2 for x86 compatibility..."
sudo softwareupdate --install-rosetta

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

echo 'Running installAppsDesktop.sh script...'
./installAppsDesktop.sh

echo 'Running installAppsPython.sh script...'
./installAppsPython.sh

echo 'Running installAppsPostgres.sh script...'
./installAppsPostgres.sh

echo 'Running installAppsDartFlutter.sh script...'
./installAppsDartFlutter.sh

echo 'Running installAppsRJupyter.sh script...'
./installAppsRJupyer.sh

echo 'Running installAppsDataEngineering.sh script...'
./installAppsDataEngineering.sh

# TODO: FONTS
# brew tap homebrew/cask-fonts 
# brew install --cask font-source-code-pro

brew tap lotyp/homebrew-formulae
brew install lotyp/formulae/dockutil
dockutil --version
