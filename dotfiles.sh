#!/bin/sh

#  dotfiles.sh
#  
#
#  Created by Lidan Hifi on 20/07/12.

# ZSH
echo "Copying ZSH themes and settings ..."
cp Themes/prose.zsh-theme ~/.oh-my-zsh/themes
cp dotfiles/rails3.plugin.zsh ~/.oh-my-zsh/plugins/rails3
cp dotfiles/git.plugin.zsh ~/.oh-my-zsh/plugins/git
cp dotfiles/.zshrc ~/


# Sublime Text
echo "Copying Sublime Text 2 themes and settings ..."
cp Themes/Twilight.tmTheme ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Default/
cp Themes/Twilight.tmTheme.cache ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Default/
cp dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
mkdir ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Rails/Snippets
cp Snippets/* ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Rails/Snippets

echo "Finished!"