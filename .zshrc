# export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME=$HOME/.dotfiles/.config
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LINES=100000000
export PATH="/usr/local/opt/openssl/bin:$PATH"
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%Y%m%d %T'

# google cloud
export GOOGLE_APPLICATION_CREDENTIALS="/Users/kirohi/Dev/key/sec_koolhaas.json"

# go
export GO111MODULE=on
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$GOPATH/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# gen-hie
export PATH=$HOME/.local/bin

# mysql
export PATH="/usr/local/opt/mysql@8.0.19/bin:$PATH"

# aliases
if [ $(command -v exa) ]; then
  alias l='exa'
  alias ls='exa --git'
  alias la='exa -a --git'
  alias ll='exa -lab --git'
  alias tree='exa --tree'
else 
  alias la='ls -a'
  alias la='ls -al'
  alias ll='ls -lav' 
  alias ll='ls -l'
  alias lla='ls -la'
  alias l='clear && ll'
fi

alias cat='bat'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias n='navi'

alias zshrc='vi ~/dotfiles/.zshrc'
alias zshconfig='vi ~/dotfiles/.zshrc'
alias vz="vim ~/.zshrc";
alias cz="code ~/.zshrc";
alias sz="source ~/.zshrc";
alias de="cd ~/Desktop";
alias npm-update="npx npm-check -u";
alias yarn-update="yarn upgrade-interactive --latest";

alias python -v="python --version"
alias nrc="npm run local"

# zsh settings
setopt nonomatch
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS

function peco-select-history() {
    # historyを番号なし、逆順、最初から表示。
    # 順番を保持して重複を削除。
    # カーソルの左側の文字列をクエリにしてpecoを起動
    # \nを改行に変換
    BUFFER="$(\history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
    CURSOR=$#BUFFER             # カーソルを文末に移動
    zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

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

function peco-checkout-pull-request () {
    local selected_pr_id=$(gh pr list | peco | awk '{ print $1 }')
    if [ -n "$selected_pr_id" ]; then
        BUFFER="gh pr checkout ${selected_pr_id}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-checkout-pull-request


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

# git aliases
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
alias hb='hub browse'

## npm aliases
alias ni="npm install";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrt="npm run test -s --";
alias nrtw="npm run test:watch -s --";
alias nrv="npm run validate -s --";
alias rmn="rm -rf node_modules";
alias flush-npm="rm -rf node_modules && npm i && say NPM is done";
alias nicache="npm install --prefer-offline";
alias nioff="npm install --offline";

# yarn aliases
alias yar="yarn run";
alias yas="yarn run start";
alias yab="yarn run build";
alias yat="yarn run test";
alias yav="yarn run validate";
alias yoff="yarn add --offline";
alias ypm="echo \"Installing deps without lockfile and ignoring engines\" && yarn install --no-lockfile --ignore-engines"lias yar="yarn run"

# use hub for git
alias git=hub

# prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

[[ -s "/Users/kirohi/.gvm/scripts/gvm" ]] && source "/Users/kirohi/.gvm/scripts/gvm"
eval "$(anyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kirohi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kirohi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kirohi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kirohi/google-cloud-sdk/completion.zsh.inc'; fi
