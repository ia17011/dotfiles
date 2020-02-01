#!/bin/bash

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle

set -u

DOTPATH=~/.dotfiles
GITHUB_URL=https://github.com/ia17011/dotfiles

# git が使えるなら git
if has "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif has "curl" || has "wget"; then
    tarball="https://github.com/ia17011/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if has "curl"; then
        curl -L "$tarball"

    elif has "wget"; then
        wget -O - "$tarball"

    fi | tar zxv

    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi


cd ~/.dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

# ドットファイルを列挙してlnを実行する(無視したいファイルは明示)
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

