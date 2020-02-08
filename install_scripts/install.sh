#!/bin/bash

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle

set -u

DOTPATH=~/.dotfiles
GITHUB_URL=https://github.com/ia17011/dotfiles

# add submodule
git submodule update --init --recursive

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cd ~/.dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

# ドットファイルを列挙してlnを実行する(無視したいファイルは明示)
for f in .??*;do
    [ "$f" = ".git" ] && continue
	[ "$f" = ".config"] && continue
	[ "$f" = ".env" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv "$DOTPATH/$f" ~/"$f"
done

chsh -s $(which zsh)

source "$DOTPATH"/.zshrc
source "$DOTPATH"/.zpreztorc

