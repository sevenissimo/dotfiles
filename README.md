# Dotfiles

A repository of my personal configuration files.

Plain [Git](https://git-scm.com/) is used to keep track of changes and synchronize dotfiles across various hosts.
[GNU Stow](http://www.gnu.org/software/stow/) can be used to symlink dotfiles where they're expected, but it's not mandatory. But note: there's no custom installation/update script in this repo.

### Installation

Clone the repository on local machine.
```
git clone https://github.com/sevenissimo/dotfiles.git
```
Dotfiles are now in`./dotfiles/`, organized in subfolders.

[GNU Stow](http://www.gnu.org/software/stow/) can be used to symlink dotfiles where they're expected. For example, to symlink all Bash related files stored in`./dotfiles/bash/` to the user's home directory (as `~/.bashrc`, `~/.inputrc`, etc.), just use:
```
cd ./dotfiles
stow bash
```


## Bash

[(1)]: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html#Invoked-as-an-interactive-login-shell_002c-or-with-_002d_002dlogin
[(2)]: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html#Invoked-with-name-sh
[(3)]: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html#Invoked-as-an-interactive-non_002dlogin-shell

### `~/.bash_profile`

> By default, Bash executes commands from `~/.bash_profile` only for __interactive login__ shells, right after `/etc/profile`, if that file exists. [(1)]

`~/.bash_profile` is where it all begins: on my setup, it *does* sources `~/.profile` and `~/.bashrc`.

### `~/.profile`

> By default,`~/.profile` is executed if Bash is invoked as `sh` (or by older command interpreters). [(2)]

On my setup, it's *always* sourced from `~/.bash_profile` for __interactive login__ shells.
My `~/.profile` sets LANG, PATH, and some other environment variables.

### `~/.bashrc`

> By default, Bash executes commands from `~/.bashrc` only for __interactive non-login__ shells. [(3)]

On my setup, like most, it's executed for both __interactive login__ and __interactive non-login__ shells.
My`~/.bashrc` sets prompt, shell options, history options, then it sources external rc files:

```
.bashrc
├── .bash_prompt
├── .bash_aliases
├── .bash_functions
├── .dircolors
└── .bashrc.$HOSTNAME
```

* `~/.bash_prompt` or `~/.bash_prompt_alt`: set my fancy, colored, and informative command prompt, or minimalistic one.
	In order to use `~/.bash_prompt_alt`, user may want to override symlink in home directory with: `mv -f ~/.bash_prompt{_alt,}`

	![Default Bash prompt](https://raw.githubusercontent.com/sevenissimo/dotfiles/master/images/bash-prompt.png)

	![Alternative Bash prompt](https://raw.githubusercontent.com/sevenissimo/dotfiles/master/images/bash-prompt-alt.png)

* `~/.bash_aliases`: sets convenience aliases or default options for some commands (like `ls`, `grep`, etc.)
* `~/.bash_functions`: declare convenience functions where arguments handling is needed.
* `~/.dircolors`: input file for `dircolors` command. This command outputs shell commands to setup colored output from `ls` and Bash's completion (if enabled) and it's executed by `~/.bashrc`.
	On my setup, this file is actually generated through `dircolors.gen` and an AWK script.
* `~/.bashrc.$HOSTNAME`: _per-host_ rc file. It could extend or override previous settings (options, variables, keybindings, etc.)

### `~/.inputrc`

Read from Bash and any other program which uses the Readline library; my `~/.inputrc` extends default Emacs-like keybindings used on command editing.

An handy list of default and customized keybindings is available [here](https://docs.google.com/spreadsheets/d/1tRa1Yh1wTptmva3aYDhSsJ3DjlGaMbsoN0PbDhuy8_c/).


## Nano

[Gnu Nano](https://www.nano-editor.org/) is my text editor of choice.
During startup, Nano read two files: system-wide `/etc/nanorc` and then the user-specific settings.

### `~/.nanorc`

`~/.nanorc` sets my preferences about: indentation (use tabs, no spaces), line wrapping, user interface colors, files backup, search and replace. Then, it does sets custom keybindings and import the external all-in-one syntax highlight file.

My syntax highlight file(s) is/are generated by [nanorc](https://github.com/sevenissimo/nanorc), an AWK script.

An handy list of default and customized keybindings is available [here](https://docs.google.com/spreadsheets/d/1tRa1Yh1wTptmva3aYDhSsJ3DjlGaMbsoN0PbDhuy8_c/).


## GNU Screen

[GNU Screen](https://www.gnu.org/software/screen/) is my terminal multiplexer of choice.

### `~/.screenrc`

`.screenrc` sets Screen preferences, user interface and keybingings.

#### UI

* Tab-like light

	![Tab-like UI for GNU Screen](https://raw.githubusercontent.com/sevenissimo/dotfiles/master/images/gnu_screen-ligth_tab.png)

* Tab-like dark

	![Tab-like UI for GNU Screen](https://raw.githubusercontent.com/sevenissimo/dotfiles/master/images/gnu_screen-dark_tab.png)

* Minimalistic

	![Minimalistic UI GNU Screen](https://raw.githubusercontent.com/sevenissimo/dotfiles/master/images/gnu_screen-minimalistic.png)

#### Keybindings

Keybindings are pretty same as defaults.
An handy list of default and customized keybindings is available [here](https://docs.google.com/spreadsheets/d/1tRa1Yh1wTptmva3aYDhSsJ3DjlGaMbsoN0PbDhuy8_c/).


## Less

[GNU Less](https://www.gnu.org/software/less/) is my pager of choice.

All Less setting were usually set in `~/.profile` as variables (like `LESS_TERMCAP_*`), but are moved to `~/.lesskey` now, not to pollute environment.

So, `~/.lesskey` file is added to repo. It's used to specify, in readable format, custom keybindings and environment variables to be used by Less.

Please note `~/.lesskey` file is not used directly by Less, rather it's one-time-compiled through `lesskey` command that outputs the binary `~/.less` file. The latter is read by Less when executed.
