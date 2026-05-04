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
alias free='free -h'


## Listings

# Classify files in colors
alias ls='ls -FNh --color=auto --group-directories-first'
alias ll='ls -l' # Long list
alias la='ls -A' # All, but . and ..

# Long list, sort by time
# Use "ls-new -nx" to list latest 'x' files
alias ls-new='ls -rtl | tail'
alias ls-old='ls -tl  | head'

# List subdirectories
alias ld='ls -d */'
alias lsd='ls */' # ...and their content

# Directory size
alias ds='du -sh'


## Colors!

# Show matches in color
alias grep='grep --color=always'

alias diff='diff -u --color=always'
alias sdiff='\diff -y --color=always'

# Use colors on GNU Less
alias less='less -R' # also in ~/.less


## Personal shortcuts and one-liners

alias copy='rsync -rsvP'
#alias diff='diff -u' # unified output format

alias screen='screen -dRR'
alias shred='shred -u' # Be careful!

alias ipinfo='curl ipinfo.io/ip'
alias dl='curl -C - -O'

# Case switch
# Pure bash functions are preferable


## Disk management

# Mount world writable
alias mount-rw='sudo mount -o rw,dmask=000,fmask=111,noatime'
alias mount-smb1='sudo mount -t cifs -o "vers=1.0,dmask=000,fmask=000"'

# Veracrypt
alias vcrypt='sudo cryptsetup --veracrypt open --type tcrypt'
alias vcrypt-hidden='sudo cryptsetup --veracrypt --tcrypt-hidden open --type tcrypt'


## Service management (SystemD)

# Home-Assistant
alias runhass='systemd-run --uid=$(id -u hass) --gid=$(id -g hass) /usr/bin/python -m venv /var/lib/hass/.venv &&'
