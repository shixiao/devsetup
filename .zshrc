#
# Executes commands at the start of an interactive session.
#

export ZSH=/Users/xshi/.oh-my-zsh
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

HISTFILE=~/.zsh-history
HISTSIZE=130000
SAVEHIST=130000

# set -o vi
set -o emacs 

#setopt BASH_AUTO_LIST

# Use vi mode.
bindkey -v
export EDITOR=vim
export VISUAL=vim

# Enable reverse history search in VI mode.
bindkey "^r" history-incremental-search-backward
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# For mac OSX
bindkey '\eOA' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward
# For Linux
# bindkey '\e[A' history-beginning-search-backward
# bindkey '\e[B' history-beginning-search-forward

bindkey "^?" backward-delete-char
bindkey "^h" backward-delete-char
bindkey "\e[3~" delete-char
bindkey "\e." insert-last-word

# protect fat fingering
set -o noclobber
alias rm='rm -i'
# alias grep='grep -P'

alias ls='ls -ACF'
# clear screen and sync zsh history
alias cls='clear screen && fc -IR'

KEYTIMEOUT=1

# ASAN options
export ASAN_OPTIONS=check_initialization_order=1:strict_init_order=1:detect_odr_violation=1 # :detect_leaks=0

export LC_ALL="en_US.UTF-8"
export TERM="screen-256color"
alias tmux="tmux -2"

echo ".zshrc sourced"
