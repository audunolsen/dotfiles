#!/bin/zsh
setopt extended_glob

# files=(.zshrc .nvimrc .gitconfig .hyper.css .hyper.js)
# 
# for file in $files; do
#     ln -sf $HOME/dotfiles/$file $HOME/$file
# done
# 
for f in **/.*~.git/*~.git(DN); do
     ln -sf $HOME/dotfiles/$f $HOME/$f:t 
done

#ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
#ln -sf $HOME/dotfiles/.nvimrc $HOME/.nvimrc
#ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
#ln -sf $HOME/dotfiles/.hyper.css $HOME/.hyper.css
#ln -sf $HOME/dotfiles/.hyper.js $HOME/.hyper.js
