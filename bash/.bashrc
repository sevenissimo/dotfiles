#
# ~/.bashrc
# User dependent .bashrc file
# executed by bash(1) for interactive non-login shells.
#

### By default, this file is not read by bash(1) for login shells. ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


## Bash prompt

# Simple prompt w/ GNU Screen support
export PS1='\[\e[1m\ek\e\\\]\u \[\e[0;37m\]\W \[\e[0m\]> '

# Fancy prompt
[[ -r ~/.bash_prompt ]] && source ~/.bash_prompt


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

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Save multiple-line command in the same history entry
shopt -s cmdhist


## History Options

#export HISTSIZE=500
export HISTFILESIZE=10000

# Remove duplicate lines in history (current session only!)
export HISTCONTROL='erasedups'

# Ignore some controlling instructions (colon-delimited list of patterns)
# '&' matches the previous line (identical to ignoredups),
# '[ \t]' matches lines preceded by spacing char (identical to ignorespace)
export HISTIGNORE=$'&:[ \t]*:[fb]g:l[slad]*:cd*:mv*:rm*:exit:\:*'

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# On exit, erase duplicated lines in history (across sessions)
__history_erasedups () {
	if nl "$HISTFILE" | sort -k 2 -k 1,1nr | uniq -f 1 | sort -n | cut -f 2 > "${HISTFILE}.uniq"; then
		[[ -s "$HISTFILE.uniq" ]] && mv -f "${HISTFILE}"{.uniq,}
	fi
	clear
}
#trap __history_erasedups EXIT


## Aliases
if [[ -r ~/.bash_aliases ]]; then
	source ~/.bash_aliases
fi

## Functions
if [[ -r ~/.bash_functions ]]; then
	source ~/.bash_functions
fi

## Colors
if [[ -r ~/.dircolors ]]; then
  eval "$(dircolors -b ~/.dircolors)"
fi


## Host dependent .bashrc
if [[ -r ~/.bashrc.${HOSTNAME%%.*} ]]; then
	source ~/.bashrc.${HOSTNAME%%.*}
fi
