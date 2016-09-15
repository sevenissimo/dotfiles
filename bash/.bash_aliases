#
# ~/.bash_aliases
#
# If these are enabled they will be used instead of any instructions
# they may mask. For example, alias rm='rm -i' will mask the rm
# application. To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#

# Fault tollerant 'cd'
alias cd..='cd ..'

# Interactive operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable units
alias df='df -h'
alias du='du -h'


## Directory listings

# Classify files in colour
alias ls='ls -Nh --color=auto --group-directories-first'
alias ll='ls -l' # Long list
alias la='ls -A' # All, but . and ..

# Long list, sort by time
# Use "lsnew -nx" to list latest 'x' files
alias lsnew='ls -rtl | tail'
alias lsold='ls -tl  | head'

# List subdirectories
alias ld='ls -d */'
alias ldls='ls */' # ...and their content

# Directory size
alias ds='du -sh'


## Colors!

# Show matches in color
alias grep='grep --color=auto'

# Color on less (not control chars)
alias less='less -R'


## Personal shortcuts and one-liners

alias free='free -h'
alias diff='diff -uN'

# Vim style, even if I hate Vim.
alias :q=' exit'
alias :s=' screen -dRR'
