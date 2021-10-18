export ZSH="$HOME/.oh-my-zsh"

echo << BLOCK
# RVM settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then
  RPS1="%{$fg[yellow]%}rvm:%{$reset_color%}%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
else
  if which rbenv &> /dev/null; then
    RPS1="%{$fg[yellow]%}rbenv:%{$reset_color%}%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
  fi
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$FG[045]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[045]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='%{$FG[082]%}[%~% ]$(git_custom_status)%{$FG[201]%}%B =>%b '

BLOCK

>> $ZSH/themes/eastwood_custom.zsh-theme

ZSH_THEME="eastwood_custom"

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
