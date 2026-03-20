# Those are to prevent folding !
mkdir -p ~/.config
mkdir -p ~/.local
mkdir -p ~/.ssh
mkdir -p ~/.config/systemd/user

stow -t ~/ dotfiles
