export ZSH="$HOME/.oh-my-zsh"

cp /workspaces/.codespaces/.persistedshare/dotfiles/nanotech_custom.zsh-theme $ZSH/themes/
cp /workspaces/.codespaces/.persistedshare/dotfiles/tom_config.zsh $ZSH/custom

ZSH_THEME="nanotech_custom"

COMPLETION_WAITING_DOTS="true"

plugins=(git rails ruby rake-fast)

source $ZSH/oh-my-zsh.sh
git config --global --add --bool push.autoSetupRemote true
git config --global core.editor "code --wait"

alias rtestall="TEST_ALL_FEATURES=1 bin/rails test"
alias rtestemu="TEST_ALL_EMUS=1 bin/rails test"
alias rtest="bin/rails test"
alias console="bin/rails console"
alias ff="bin/toggle-feature-flag"
alias server="rm /tmp/overmind.sock || true && $(pwd)/script/server"
alias debug="rm /tmp/overmind.sock || true && $(pwd)/script/server --debug"
alias gcm="git commit -m"
alias gcv="git commit -v"
alias gap="git add -p"
alias gpa="git add -p"
alias gpo="git push origin"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
unalias glg
function glg() {
  if [ "$1" != "" ]
  then 
    git log --pretty=oneline -"$1"
  else
    git log --pretty=oneline -10
  fi
}

function openPR() {
  PR=$(git branch --show-current)
  code $(git diff --name-only origin/$PR `git merge-base origin/$PR origin/master`)
}


