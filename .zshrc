# export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
export GO111MODULE=auto

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

alias la='ls -a'
alias la='ls -al'
alias ll='ls -lav' 
alias ll='ls -l'
alias lla='ls -la'
alias ls='ls -F'
alias ls='ls -v -G'
alias l='clear && ll'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias dot='~/.dotfiles'
alias zshrc='vi ~/.dotfiles/.zshrc'
alias zshconfig='vi ~/.dotfiles/.zshrc'

# peco and ghq settings
alias repos='ghq list -p | peco'
alias repo='cd $(repos)'
alias github='gh-open $(repos)'

function find_cd() {
        cd "$(find . -type d | peco)"
}

function peco_history_selection() {
  BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco_history_selection
bindkey '^R' peco_history_selection

alias fc="find_cd"



# git settings
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcod='git checkout develop'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gpl='git pull origin'
alias gpo='git push origin'
alias gst='git status'
alias gss='git status -s'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'


# prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
