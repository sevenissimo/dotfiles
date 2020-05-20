#
# ~/.bash_profile
# Personal Bash startup file, executed when
# Bash is invoked as an interactive login shell.

### Bash first executes commands from /etc/profile ###


# By default, ~/.profile is not read by Bash if this file
# (or ~/.bash_login) exists, but I still use it.
[[ -r ~/.profile ]] && . ~/.profile

# Unset ArchLinux default command_prompt, set new one later.
unset COMMAND_PROMPT

## End of login-specific initializations ##

# Load ~/.bashrc also for login shells.
[[ -r ~/.bashrc ]] && . ~/.bashrc
