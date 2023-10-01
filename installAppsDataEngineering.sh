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

echo 'Installing rust...'
brew install rustup
rustup-init
source . ~/.zshrc
rustc --version


echo 'Installing Data Engineering apps with user: '${USER}

echo 'Tapping cask for dbt...'
brew tap dbt-labs/dbt

appsNoCask=(
  helm
  awscli
  terraform
  tableau
  kubernetes-cli
  minikube
  nginx
)
install_nocasks $appsNoCask

#To start metabase now and restart at startup:
#  sudo brew services start metabase
#Or, if you don't want/need a background service you can just run:
#  /opt/homebrew/opt/metabase/bin/metabase

apps=(
  docker
  metabase
  slack
  #mactex
)
install_casks $apps


brew cleanup

#### pip: 
### pip install elementary-data
### 



### Docker
### Helm  (mage is installed under helm), apache airflow
#### helm charts

### AWS CLI
### Terraform
### Tableau
### kube-ctl
### minikube

#### metabase
#### nginx
### python 3.1x
### Python libraries
#### dbt
#### dbt-snowflake
#### dbt-postgres
#### dbt-databricks
#### postgres (13 !! ) ### how to man age multiople postgres installations versions TODO
#### psql
#### pg-admin or native variant
#### elementary-data (python visualization library)
#### 
#### TODO: streamline node.js environments - work with Django, 





### rebuild concert finder app, maybe some kaggle, maybe some viz tools
#### dashboard
#### documentation build
#### kaggle 


### key: DBT is the main one - the GOAT, Elementary is a package on DBT, mage
### snowflake / databricks most valuable to integrate



#### Data Science
#### Data Engineering
#### Data Analyst
#### Data Architect


#### Engineer <-> Analysis
#### Scientist (high level) has to know both engineering and analysis
#### Architect needs to know all four, plus the business role




#### DBT brew vs pip?
## https://interworks.com/blog/2022/10/12/installing-dbt-with-mac-m1-chips/
## https://docs.getdbt.com/docs/core/homebrew-install
## https://docs.getdbt.com/docs/core/pip-install

### TODO: set up pyenv/venv for dbt correctly
### https://realpython.com/intro-to-pyenv/
#pyenv virtualenv 3.11.5 dbt-env
#pyenv local dbt-env
### https://discourse.getdbt.com/t/using-pyenv-to-run-multiple-versions-of-dbt-per-project/437

echo 'Installing dbt-postgres using pip...'
pip install dbt-postgres


### METABASE:
## https://github.com/kfprimm/Metabase/blob/master/docs/operations-guide/running-the-metabase-mac-app.md
## https://github.com/kfprimm/Metabase/blob/master/docs/setting-up-metabase.md


### AWS CLI on M2:
## https://medium.com/@Rohit_Varma/effortless-installation-installing-aws-cli-on-mac-m2-made-easy-cbd18ebdc575


