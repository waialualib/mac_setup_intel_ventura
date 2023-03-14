#!/bin/bash

userName=`whoami`
echo 'By continuing, your Home directory '${userName}' will be used to clone your Github and Bitbucket repositories.'
echo 'Did you add keys to Github and Bitbucket?'
echo 'Press [Enter] to continue...'
read FOO

echo 'Making directory and cd-ing into directory github/waialualib'
mkdir -p /Users/${userName}/projects/github/waialualib
cd /Users/${userName}/projects/github/waialualib
git clone git@github.com:waialualib/boonyah-backend.git 

echo 'Making directory and cd-ing into directory bitbucket/drkeithwebb'
mkdir -p /Users/${userName}/projects/bitbucket/drkeithwebb
cd /Users/${userName}/projects/bitbucket/drkeithwebb
git clone git@bitbucket.org:drkeithwebb/boonyah.git
git clone git@bitbucket.org:drkeithwebb/android-version.git

echo 'Making directory and cd-ing into directory bitbucket/bitwkspace'
mkdir -p /Users/${userName}/projects/bitbucket/bitwkspace
cd /Users/${userName}/projects/bitbucket/bitwkspace
git clone git@bitbucket.org:bitwkspace/testprivaterepo.git