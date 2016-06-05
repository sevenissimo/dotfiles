#
# ~/.bash_profile
# User dependent .bash_profile file
# executed by bash(1) for login shells.
#

# By default, ~/.profile is not read by bash(1)
# if this file (or ~/.bash_login) exists.
if [[ -r ${HOME}/.profile ]]; then
	source ${HOME}/.profile
fi

# Load ~/.bashrc also for non-login shells.
if [[ -r ${HOME}/.bashrc ]]; then
	source ${HOME}/.bashrc
fi
