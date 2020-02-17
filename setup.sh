#/bin/bash

CUR_DIR="$(pwd)"

function fzf_setup() {
	printf "\nInstalling fzf\n"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
}

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

	echo "Installing Vim Plugins"
	vim +PluginInstall +qall

	echo "Compiling YCM Core"
	cd ~/.vim/bundle/YouCompleteMe
	python3 install.py --all

	cd "$CUR_DIR"
	echo "Finished setting up Vim!"
}

function neovim_setup() {
	printf "\nSetting up NeoVim...\n"
	
	CONFIG_DIR="$HOME/.config"
	NEOVIM_DIR="$HOME/.config/nvim"

	if [ ! -d "$CONFIG_DIR" ]; then
	    echo "Creating config folder at $CONFIG_DIR"
	    mkdir "$CONFIG_DIR"
	fi

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

function oh_my_zsh_setup() {
    printf "\nSetting up Oh-My-Zsh...\n"	
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm $HOME/.zshrc
    cd $HOME
    ln -s $CUR_DIR/.zshrc
    cd $CUR_DIR
}

if [ $# -gt 0 ]; then
	while [ "$1" != "" ]; do
		echo "$1"
		case $1 in
			fzf)		fzf_setup 
						;;	
			vim)		vim_setup
						;;
			nvim)	 	neovim_setup
						;;
			oh-my-zsh) 	oh_my_zsh_setup
						;;
		esac
		shift
	done
else
	fzf_setup
	vim_setup
	neovim_setup
	oh_my_zsh_setup
fi
