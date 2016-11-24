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

# Network
# ----------------------------------------------------------------------------

# IP addresses
alias ip='dig @resolver1.opendns.com myip.opendns.com +short'
