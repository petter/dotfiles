#/bin/bash

CUR_DIR="$(pwd)"

function vim_setup() {
	printf "\nSetting up Vim...\n"

	# Set up Vundle
	VUNDLE_INSTALL_DIR=~/.vim/bundle/Vundle.vim
	echo "Vundle:"
	if [ ! -d "$VUNDLE_INSTALL_DIR" ]; then
		git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_INSTALL_DIR"
	else
		printf "\tVundle already installed.\n\tSkipping Vundle install.\n"
	fi

	echo "Linking $HOME/.vimrc to $CUR_DIR/.vimrc"
	cd "$HOME"	
	ln -s "$CUR_DIR/.vimrc"
	cd "$CUR_DIR"

	echo "Finished setting up Vim!"
}

function neovim_setup() {
	printf "\nSetting up NeoVim...\n"
	
	NEOVIM_DIR="$HOME/.config/nvim"

	if [ ! -d "$NEOVIM_DIR" ]; then
		echo "Creating nvim config folder at $NEOVIM_DIR"
		mkdir "$NEOVIM_DIR"
	fi

	echo "Linking $NEOVIM_DIR/init.vim to $CUR_DIR/init.vim"
	cd "$NEOVIM_DIR"
	ln -s "$CUR_DIR/init.vim"
	cd "$CUR_DIR"

	echo "Finished setting up NeoVim!"
}

vim_setup
neovim_setup
