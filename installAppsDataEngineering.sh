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
echo 'Installing Data Engineering apps with user: '${USER}

appsNoCask=(
  docker
  helm
  awscli
  terraform
  tableau
  kubernetes-cli
  minikube	
  metabase
  nginx
  dbt-postgres
)
install_nocasks $appsNoCask

#To start metabase now and restart at startup:
#  sudo brew services start metabase
#Or, if you don't want/need a background service you can just run:
#  /opt/homebrew/opt/metabase/bin/metabase

apps=(
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


