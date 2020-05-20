#
# ~/.bashrc
# Personal Bash startup file, executed for both
# interactive login and interactive non-login shells.
#

### By default, this file is not read by bash(1) for login shells. ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


## Bash prompt

# Simple prompt with GNU Screen support
export PS1='\[\e[1m\]\u \[\e[0;37m\]\W \[\e[0m\ek\e\\\]\$ '

# Set GNU Screen hadrstatus to $PWD (truncated to last 20 chars)
#case $TERM in
#	screen*) PROMPT_COMMAND=': ${PWD/#$HOME/\~};printf "\e_%s\e\\" "${_:${#_}>20?-20:0}"' ;;
#esac


## Shell Options

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell
shopt -s dirspell

# Type directory name to cd it
shopt -s autocd

# Argument to 'cd' builtin command that is not a directory
# is assumed to be a variable whose value is the path to change to.
shopt -s cdable_vars


## History Options

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Save multiple-line command in the same history entry
shopt -s cmdhist

# reedit a history substitution line if it failed
shopt -s histreedit

# Edit a recalled history line before executing
shopt -s histverify

# Number of commands to remember on the history list
export HISTSIZE=1000

# Number of lines contained in the history file
export HISTFILESIZE=10000

# Remove duplicate lines in history (current session only!)
export HISTCONTROL='erasedups'

# Ignore some controlling instructions (colon-delimited list of patterns)
# '&' matches the previous line (identical to ignoredups),
# '\ *' matches lines preceded by space char (identical to ignorespace)
export HISTIGNORE=$'&:\ *:[fb]g:l[slad]*:cd*:mv*:rm*:echo*:exit:kill*:shred*'

# ALPHA: Extend history functionalities
[[ -r ~/snippets/bash/history.sh ]] &&
	. ~/snippets/bash/history.sh


## Drop-ins

# Source external prompt, aliases, functions
for rc in prompt aliases functions; do
	[[ -r ~/.bash_$rc ]] && . ~/.bash_$rc
done

## Colors
[[ -r ~/.dircolors ]] &&
	eval "$(dircolors -b ~/.dircolors)"


## Bindings

# Most of Readline bindings happens on .inputrc
# Except those that bind shell commands (-x)

# ^G Displays manual of current editing command (C-g)
bind -x '"\C-g":"man ${READLINE_LINE%% *}"'


## Host dependent .bashrc

# Source an external .bashrc chosen based on $HOSTNAME
# This file could extend or override previous settings
[[ -r ~/.bashrc.${HOSTNAME%%.*} ]] &&
	. ~/.bashrc.${HOSTNAME%%.*}
