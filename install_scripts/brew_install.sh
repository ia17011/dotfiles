#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
  git
  ghq
  peco
  zsh-syntax-highlighting
  jq
  mysql
  postgresql
  redis
  yarn
  rbenv
  goenv
  pyenv
  nodenv
  tree
  terraform
  wget
  ricty
  tig
  gibo
)

"brew tap..."
brew tap homebrew/versions
brew tap homebrew/apache

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    google-chrome
    google-japanese-ime
    slack
    alfred
    notion
    skitch
    visual-studio-code
    karabiner-elements
    kindle
    iterm2
    docker
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END

