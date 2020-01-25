#!/bin/bash

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle

set -u

DOTPATH=~/.dotfiles

for f in .??*;do
    [ "$f" = ".git" ] && continue
	[ "$f" = ".config"] && continue
	[ "$f" = ".env" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done



curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s /bin/zsh



