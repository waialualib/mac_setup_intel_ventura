#!/bin/bash

echo 'Did you add keys to BitBucket and Github?'
echo 'Press [Enter] to continue'
read FOO

mkdir -p "~/projects/github/waialualib"
mkdir -p "~/projects/bitbucket/gtcode"

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

cd ~/projects/bitbucket/gtcode
bitbucketRepos=(
    "git clone git@bitbucket.org:drkeithwebb/boonyah.git"
    # ""
    # ""
)

for repo in ${bitbucketRepos}
do
  echo 'Cloning repo from BitBucket: '${repo}
  git clone ${repo}
done