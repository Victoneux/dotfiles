# Generates the neccisary symlinks between the git repo and dotfiles. Must be run from the git repo directory.
# The git repo directory must be placed as ~/dotfiles

ln -sf ~/dotfiles/picom.conf ~/.config/picom.conf
ln -sf ~/dotfiles/gtk-3.0/ ~/.config/
ln -sf ~/dotfiles/awesome/ ~/.config/
ln -sf ~/dotfiles/rofi/ ~/.config/
ln -sf ~/dotfiles/fusuma ~/.config/
ln -sf ~/dotfiles/betterlockscreenrc ~/.config/
ln -sf ~/dotfiles/terminator ~/.config/
ln -sf ~/dotfiles/.zshrc ~/.zshrc
