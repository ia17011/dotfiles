# export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME=$HOME/.dotfiles/.config
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# go
export GO111MODULE=on

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

# zsh settings
setopt nonomatch

# peco and ghq settings
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")

    BUFFER="${BUFFER}${echo $selected_files | tr '\n' ' '}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
bindkey '^Q' peco-find-file


alias repos='ghq list -p | peco'
alias repo='cd $(repos)'
alias github='gh repo view $(repos)'
alias gb='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

function find_cd() {
        cd "$(find . -type d | peco)"
}

alias fc="find_cd"

# diary
alias dia='vi ~/diary/$(date "+%Y/%m/%d.md")'

# todoist find project
function peco-todoist-project () {
    local SELECTED_PROJECT="$(todoist projects | peco | head -n1 | cut -d ' ' -f 1)"
    if [ -n "$SELECTED_PROJECT" ]; then
        if [ -n "$LBUFFER" ]; then
            local new_left="${LBUFFER%\ } $SELECTED_PROJECT"
        else
            local new_left="$SELECTED_PROJECT"
        fi
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
}
zle -N peco-todoist-project
bindkey "^xtp" peco-todoist-project

# todoist find labels
function peco-todoist-labels () {
    local SELECTED_LABELS="$(todoist labels | peco | cut -d ' ' -f 1 | tr '\n' ',' | sed -e 's/,$//')"
    if [ -n "$SELECTED_LABELS" ]; then
        if [ -n "$LBUFFER" ]; then
            local new_left="${LBUFFER%\ } $SELECTED_LABELS"
        else
            local new_left="$SELECTED_LABELS"
        fi
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
}
zle -N peco-todoist-labels
bindkey "^xtl" peco-todoist-labels

# always show prompt
toggl_current() {
  local tgc=$(toggl --cache --csv current)
  local tgc_time=$(echo $tgc | grep Duration | cut -d ',' -f 2)
  local tgc_dsc=$(echo $tgc | grep Description | cut -d ',' -f 2 | cut -c 1-20)
  local short_tgc_dsc=$(if [ $(echo $tgc_dsc | wc -m) -lt 20 ]; then echo $tgc_dsc; else echo "${tgc_dsc}.."; fi)
  if [ ! -n "$tgc_time" ]; then
      echo "NoTimeEntry"
  else
      echo "[$tgc_time $short_tgc_dsc]"
  fi
}

# toggle alias
alias tl='todoist --project-namespace --namespace --color list'
alias tgs='toggl stop'

# git settings
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
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
alias gclean-local='git branch --merged | grep -v "*" | xargs -I % git branch -d %'
alias gcz='git cz'

# prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

[[ -s "/Users/kirohi/.gvm/scripts/gvm" ]] && source "/Users/kirohi/.gvm/scripts/gvm"
