#!/usr/bin/env bash

sudo apt install zsh;

mkdir ~/.fonts;

cp ./fonts/*.ttf ~/fonts/;

fc-cache -f -v;

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;

sudo apt install brew;

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)";
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc;

brew install z;

echo ". /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh" >> ~/.zshrc;

brew install btop;

brew install neofetch;

cat ./home/zshrc >> ~/.zshrc;
