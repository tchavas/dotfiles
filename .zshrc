export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="/workspaces/.codespaces/.persistedshare/dotfiles/.oh-my-zsh/themes/eastwood_custom"

COMPLETION_WAITING_DOTS="true"

plugins=(git rails ruby rake-fast)

autoload -U colors && colors
PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[magenta]%}%m %{$fg[magenta]%}%~ %{$reset_color%}%% "

source $ZSH/oh-my-zsh.sh

alias rtest="bin/rails test"
alias console="bin/rails console"
alias server="rm /tmp/overmind.sock || true && $(pwd)/script/server"
alias debug="rm /tmp/overmind.sock || true && $(pwd)/script/server --debug"
alias gcm="git commit -m"
alias gpo="git push origin"
