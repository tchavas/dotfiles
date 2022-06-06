export ZSH="$HOME/.oh-my-zsh"

cp /workspaces/.codespaces/.persistedshare/dotfiles/nanotech_custom.zsh-theme $ZSH/themes/

ZSH_THEME="nanotech_custom"

COMPLETION_WAITING_DOTS="true"

plugins=(git rails ruby rake-fast)

source $ZSH/oh-my-zsh.sh

alias rtest="bin/rails test"
alias console="bin/rails console"
alias server="rm /tmp/overmind.sock || true && $(pwd)/script/server"
alias debug="rm /tmp/overmind.sock || true && $(pwd)/script/server --debug"
alias gcm="git commit -m"
alias gpo="git push origin"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
function glg() {
  if [ "$1" != "" ]
  then 
    git log --pretty=oneline -"$1"
  else
    git log --pretty=oneline -10
  fi
}

