#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

dotfiles="bashrc bash_aliases tmux.conf tmux_completion bash_profile tmux_git.sh"    # list of filesto symlink in homedir

##########
if ! hash brew 2>/dev/null; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Dependencies
if ! hash tmux-next 2>/dev/null; then
    echo "Upgrading tmux to latest version"
    brew install tmux
fi

if ! hash pip3 2>/dev/null; then
    brew install python
    brew install python3
    pip2 install neovim --upgrade
    pip3 install neovim --upgrade
fi

if ! hash nvim 2>/dev/null; then
    echo "Installing NeoVim"
    brew install neovim/neovim/neovim
fi


# change to the dotfiles directory
cd $dir

#Create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $dotfiles; do
    rm ~/.$file 2>/dev/null
    ln -s $dir/$file ~/.$file 2>/dev/null
done

rm -rf ~/.vim 2>/dev/null
mkdir -p $dir/vim/plugged
ln -s $dir/vim ~/.vim

# Add neovim config
mkdir -p ~/.config/nvim
rm ~/.config/nvim/init.vim 2>/dev/null
ln -s $dir/init.vim ~/.config/nvim/
ln -s $dir/UltiSnips ~/.config/nvim/UltiSnips


#Install VimPlug
if ! [ -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "Installing VimPlug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

nvim +PlugInstall +qall

echo "done"
