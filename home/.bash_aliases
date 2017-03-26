#!/usr/bin/env bash
#
# ~/.bash_aliases

# Make aliases work with `sudo`
# From the alias section in the bash(1) manpage:
#   A trailing space in VALUE causes the next word to be checked for alias
#   substitution when the alias is expanded.
alias sudo='sudo '

# Shortcuts
# ----------------------------------------------------------------------------

alias a='alias'
alias cls='clear'
alias h='history'

# Options for `ls`
#   -a: Include directory entries whose names begin with a dot (.)
#   -l: List in long format
#   -F: use special characters immediately after the name to distinguish
#       between file types
#   -H: follow symbolic links on the command line
alias ls='ls -alFH'

# Delete all local git branches which do not contain 'develop' in name
alias gitbc='git branch | grep -v develop | xargs -n 1 git branch -D'

# Recursively finds and deletes all files with .orig extension
alias rmorig='find . -type f -name *.orig | xargs -n 1 rm'

# Finds and opens xcode workspace or project in current directoty
alias oxcw='find -X ./*.xcworkspace -type d -maxdepth 0 | xargs -n 1 open'
alias oxcp='find -X ./*.xcodeproj -type d -maxdepth 0 | xargs -n 1 open'

# Goes to main repositiries folder
alias godev='cd ~/sources/'

# Goes to dotfiles repository
alias godot='cd ~/sources/dotfiles/'

# Goes to ssh directory
alias gossh='cd ~/.ssh/'

# Network
# ----------------------------------------------------------------------------

# IP addresses
alias ip='dig @resolver1.opendns.com myip.opendns.com +short'
