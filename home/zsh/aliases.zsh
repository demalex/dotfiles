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

# Goes to main repositiries folder
alias godev='cd ~/sources/'

# Goes to dotfiles repository
alias godot='cd ~/sources/dotfiles/'

# Goes to ssh directory
alias gossh='cd ~/.ssh/'

#Add all private ssh key identities to the authentication agent
alias ssh-add-all='command ls ~/.ssh | grep -v .pub | grep -v known_hosts | xargs -n 1 -I{} ssh-add -K ~/.ssh/{}'

# Network
# ----------------------------------------------------------------------------

# IP addresses
alias ip='dig @resolver1.opendns.com myip.opendns.com +short'
