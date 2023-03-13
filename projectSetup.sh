#!/bin/bash

userName=`whoami`
echo 'By continuing, your Home directory '${userName}' will be used to clone your Github and Bitbucket repositories.'
echo 'Did you add keys to Github and Bitbucket?'
echo 'Press [Enter] to continue...'
read FOO

mkdir -p /Users/${userName}/projects/github/waialualib
cd ~/projects/github/waialualib
githubRepos=(
    "git@github.com:waialualib/boonyah-backend.git"
    # ""
    # ""
)
for repo in ${githubRepos}
do
  echo 'Cloning repo from GitHub: '${repo}
  git clone ${repo}
done

mkdir -p /Users/${userName}/projects/bitbucket/drkeithwebb
cd /Users/${userName}/projects/bitbucket/drkeithwebb
bitbucketRepos=(
    "git@bitbucket.org:drkeithwebb/boonyah.git"
    "git@bitbucket.org:drkeithwebb/android-version.git"
)
for repo in ${bitbucketRepos}
do
  echo 'Cloning repo from BitBucket: '${repo}
  git clone ${repo}
done

mkdir -p /Users/{$userName}/projects/bitbucket/bitwkspace
cd /Users/{$userName}/projects/bitbucket/bitwkspace
bitbucketRepos=(
    "git@bitbucket.org:bitwkspace/testprivaterepo.git"
)
for repo in ${bitbucketRepos}
do
  echo 'Cloning repo from BitBucket: '${repo}
  git clone ${repo}
done