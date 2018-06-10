#
# ~/.bash_aliases
#
# If these are enabled they will be used instead of any instructions
# they may mask. For example, alias rm='rm -i' will mask the rm
# application. To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#

# Directory navigation
alias cd..='cd ..' # Fault tollerant
alias   ..='cd ..' # Shortcut

# Interactive operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Directory creation/deletion
alias md=mkdir
alias rd='rm -id' #rmdir
alias rd+='rmdir -p'

# Default to human readable units
alias df='df -h'
alias du='du -h'


## Listings

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
alias lsd='ls */' # ...and their content

# Directory size
alias ds='du -sh'


## Colors!

# Show matches in color
alias grep='grep --color=auto'

# Color on less (not control chars)
alias less='less -R'


## Personal shortcuts and one-liners

alias copy='rsync -rsvP'
alias free='free -h'
alias diff='diff -uN'

alias screen='\screen -dRR' # Don't save to hist

# Case switch
alias lower='tr [:upper:] [:lower:]'
alias upper='tr [:lower:] [:upper:]'


## Disk management

# Mount world writable
alias mount-rw='sudo mount -o rw,dmask=000,fmask=111,noatime'

# Veracrypt
alias vcrypt='sudo cryptsetup --veracrypt open --type tcrypt'
alias vcrypt-hidden='sudo cryptsetup --veracrypt --tcrypt-hidden open --type tcrypt'
