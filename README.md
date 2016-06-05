# Dotfiles

A repository of my configuration files.

[GNU Stow](http://www.gnu.org/software/stow/) can be used to symlink dotfiles into the `$HOME` tree.

## Example usage

```
$ cd /dotfiles
$ stow bash
```

Stow will symlink all the files in `~/dotfiles/bash` into the home directory.
