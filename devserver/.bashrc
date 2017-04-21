# .bashrc
# Unlike earlier versions, Bash4 sources your bashrc on non-interactive shells.
# The line below prevents anything in this file from creating output that will
# break utilities that use ssh as a pipe, including git and mercurial.
# [ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source Facebook definitions
if [ -f /usr/facebook/ops/rc/master.bashrc ]; then
  . /usr/facebook/ops/rc/master.bashrc
elif [ -f /mnt/vol/engshare/admin/scripts/master.bashrc ]; then
  . /mnt/vol/engshare/admin/scripts/master.bashrc
fi

# User specific aliases and functions for all shells
# Enable Vi key bindings
set -o vi

HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize
HISTSIZE=130000 HISTFILESIZE=-1

export PROMPT_COMMAND="history -a; history -n"
export EDITOR=vim
export VISUAL=vim

alias cp='cp --backup=numbered'
alias ln='ln --backup=numbered'
alias mv='mv -f --backup=numbered'

alias th='aiwatch th'
alias cuth='aiwatch cuth'

if [ -f $ADMIN_SCRIPTS/scm-prompt ]; then
  source $ADMIN_SCRIPTS/scm-prompt
fi

function parse_hg_branch {
  if [[ -n $(_dotfiles_scm_info) ]]; then
    # wrap in parens
    echo "$(_dotfiles_scm_info)"
  fi
}

# Show current hg bookmark
function hgproml {
  # here are a bunch of colors in case
  # you want to get colorful
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local RESET_COLOR="\[\033[0m\]"

  export PS1="$GREEN[\u:\w$LIGHT_GRAY\$(parse_hg_branch)$GREEN]\$$RESET_COLOR "
PS2='> '
PS4='+ '
}
hgproml

export PATH=~/bin:~/rtags-install/bin:$PATH
alias tmux='tmux -2'
export TERM=screen-256color

alias sfd='~/fbsource/fbcode/_bin/servicefoundry/sfcli/sf_par.lpar --config-file=~/.servicefoundry_dev'

export PATH=$PATH:$HOME/.rbenv/bin

# export LLVM_DIR=/home/engshare/third-party2/llvm-fb/stable/centos6-native/da39a3e
# export GCC_TOOLCHAIN=/home/engshare/third-party2/gcc/4.9.x/centos6-native/1317bc4
# export PATH=$GCC_TOOLCHAIN/bin:$PATH
# export LD_LIBRARY_PATH=$GCC_TOOLCHAIN/lib64:$LD_LIBRARY_PATH
# export CMAKE_LIBRARY_PATH=/opt/chef/embedded/lib
# export CMAKE_INCLUDE_PATH=/opt/chef/embedded/include

# A function to launch ipython notebooks
function ifbpynb { pushd ~/python; /usr/local/bin/ifbpy notebook --profile=nbserver; popd; }
