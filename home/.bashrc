#!/usr/bin/env bash
#
# ~/.bashrc
#
# Bash startup file for interactive non-login shells

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# Shell Environment
# ----------------------------------------------------------------------------

#Colorized shell
export CLICOLOR=true

# Make `vim` the default editor
export EDITOR=vim

# Don't save duplicate entries on the history list
export HISTCONTROL=ignoredups

# Commands not to be saved on the history list
export HISTIGNORE="clear:cls:la:ll:ls:ltr:cd:pwd:exit:date"

# Options for `less`
#   -i: ignore case when searching
#   -F: automatically quit `less` when the file can be displayed on the first
#       screen
#   -R: display ANSI colors
#   -X: don't clear the screen when quitting
export LESS="-iFRX"

# Make `less` the default pager
export PAGER=less

# Prompt
export PS1="\u@\h:\w$ "

# Git prompt
if [[ -f $(xcode-select -p)/usr/share/git-core/git-prompt.sh ]]
then
  source $(xcode-select -p)/usr/share/git-core/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWCOLORHINTS=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWUPSTREAM=auto
  GIT_PS1_HIDE_IF_PWD_IGNORED=1
  GIT_PS1_DESCRIBE_STYLE=branch
  PROMPT_COMMAND='__git_ps1 "${VIRTUAL_ENV:+(${VIRTUAL_ENV##*/})}\u@\h:\w" "\\$ " " (%s)"'"; $PROMPT_COMMAND"
fi

# Git bash completion
if [[ -f $(xcode-select -p)/usr/share/git-core/git-completion.bash ]]
then
  source $(xcode-select -p)/usr/share/git-core/git-completion.bash
fi

# Homebrew package manager
if [[ -n $(command -v brew) ]]
then
  export HOMEBREW_TEMP=$TMPDIR

  # Homebrew's bash completion
  if [[ -f $(brew --prefix)/etc/bash_completion.d/brew ]]
  then
    source $(brew --prefix)/etc/bash_completion.d/brew
  fi

  # Homebrew Cask
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  # Ruby version management: rbenv and ruby-build
  if [[ -n $(command -v rbenv) ]]
  then
    export RBENV_ROOT=$(brew --prefix)/var/rbenv
    export RUBY_CONFIGURE_OPTS="--disable-install-doc"
    eval "$(rbenv init -)"
  fi
fi

# Swiftenv
if [[ -n $(command -v swiftenv) ]]
then
  # Load swiftenv automatically by appending
  # the following to your ~/.bash_profile:

  eval "$(swiftenv init -)"
fi

# Append ~/local/bin to PATH
[[ -d $HOME/local/bin ]] && export PATH=$PATH:$HOME/local/bin

# Source Bash files
for file in $HOME/.{bash_aliases,bash_functions,bashrc.local}
do
  [[ -r $file ]] && [[ -f $file ]] && source $file
done
unset file
