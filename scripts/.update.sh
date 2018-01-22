#!/bin/sh

echo "Updating AppStore dependencies..."
mas outdated && mas upgrade

echo "Updating brew formulas..."
brew update

echo "Updating brew dependencies..."
cd ~/ && brew bundle install --global --verbose

echo "Updating gem..."
gem update --system

echo "Updating gems..."
gem update
cd ~/ && bundle install --gemfile=.Gemfile
