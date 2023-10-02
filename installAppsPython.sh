#!/bin/zsh
source ./_functions.sh

appsNoCask=(
  pyenv
)
install_nocasks $appsNoCask

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

## PYENV docs
## https://realpython.com/intro-to-pyenv/


echo 'Installing virtualenv for pyenv...'
brew install pyenv-virtualenv

echo 'Enabling auto-activation of pyenv virtualenv...'
echo 'if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi' >> ~/.zshrc
