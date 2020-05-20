#
# ~/.profile
# Personal startup file for csh/sh/bash shells.
# Executed by the command interpreter for login shells.
#

### By default, this file is not read by bash(1) ###
### if ~/.bash_profile or ~/.bash_login exists.  ###


# Set user-defined locale
export LANG=it_IT.UTF-8

# Export user executables path
if [ -d "${HOME}/.local/bin" ]; then
	export PATH="${HOME}/.local/bin:${PATH}"
fi


## Terminal settings

# Let any char restart output after XOFF
# and "unbind" usefull ^Q keystroke
stty ixany
stty start ^@


## Default apps

export EDITOR=nano
export GIT_EDITOR=$EDITOR
export PAGER=less


## Apps config

## All GNU Less vars (like LESS_TERMCAP_*) removed. ##
## Options will be loaded from ~/.less file instead ##

## GREP_OPTIONS is also deprecated ##

# Revert to pre-8.25 LS behavior
export QUOTING_STYLE=literal

# Lynx browser settings
export WWW_HOME="http://google.com/"
export LYNX_LSS="$HOME/.lynx.lss"
