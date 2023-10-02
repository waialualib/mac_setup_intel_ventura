#!/bin/zsh
source ./_functions.sh

appsNoCask=(
  postgresql@15
)
install_nocasks $appsNoCask

echo 'Adding postgresql@15 to path.'
echo 'export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc

echo 'Adding postgresql@15 to startup.'
brew services start postgresql@15

echo 'Creating postgres superuser "postgres".'
createuser -s postgres
