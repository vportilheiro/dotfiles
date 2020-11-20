#!/bin/sh
#
# This script takes as arguments the names of tools/directories in the main
# dotfiles directory. Each one of these tools is then installed under the
# INSTALL_DIR directory (default to $HOME).

# Exit immediately if any command returns with an error
set -e

# Main dotfiles project directory (location of this script)
DOTFILES_DIR=$HOME/dotfiles

# Directory to which dotfiles are symlinked
INSTALL_DIR=$HOME

# Extension added to existing files/directories that are replaced
BACKUP_EXT=.pre-dotfiles-install

# Print output for all actions
VERBOSE=false

# Takes the name of a tool/directory, and symlinks all hidden files to
# INSTALL_DIR. Existsing files in INSTALL_DIR are backed up.
symlink_hidden() {
	for file in $DOTFILES_DIR/$1/.[!.]* $DOTFILES_DIR/$1/..?*; do
		# Skip non-matched globs
		[ -e $file ] || [ -L $file ] || continue
		filename=`basename $file`
		if [ -e $INSTALL_DIR/$filename ]; then
			if [ $VERBOSE = true ]; then
				echo "Backing up $filename to $filename$BACKUP_EXT"
			fi
			mv $INSTALL_DIR/$filename $INSTALL_DIR/$filename$BACKUP_EXT
		fi
		if [ $VERBOSE = true ]; then
			echo "Creating symlink at $INSTALL_DIR/$filename"
		fi
		ln -s $file $INSTALL_DIR/$filename
	done
}

# Symlinks .zshrc and .oh-my-zsh to INSTALL_DIR, and adds custom themes
install_zsh() {
	symlink_hidden zsh
	ln -s $DOTFILES_DIR/zsh/*.zsh-theme $DOTFILES_DIR/zsh/.oh-my-zsh/custom/themes
}

main() {

	# Make sure submodules are all installed and updated
	git submodule update --init --recursive

	# Parse arguments
  while [ $# -gt 0 ]; do
    case $1 in
      bash) symlink_hidden bash;;
			git) symlink_hidden git;;
			tmux) symlink_hidden tmux;;
      vim) symlink_hidden vim;;
			zsh) install_zsh;;
    esac
    shift
  done
}

main "$@"
