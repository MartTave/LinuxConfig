# Todos

Remove old ssh keys from github/gitlab

Then you can generate a new pair by following the github tutorial.


# Useful packages : 

You need to install those in order.

### ZSH -> new shell

[Installation guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

Or with `sudo apt install zsh`

Then set it as shell by default `chsh -s $(which zsh)`

If zsh as default shell doesn't work -> logout/log back in

### OMZ

Then you can install oh-my-zsh [here](https://ohmyz.sh/#install)

Or with `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### ZSH theme (p10k)

You can install the recommended font [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

Then install the theme with omz [here](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)

Or with `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

### Guake

To install :`sudo apt install guake`

Then you can restore settings with `guake --restore-preferences filePath` with the file in the ../home folder

### Brew

Need to install brew in order to install everything else ([here](https://brew.sh/))

or with `sudo apt install brew`

Then you need to add it to $PATH with 
```
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc
```

### Z

Super fast folder navigator -> keep in track folder you cd'ed into ([here](https://formulae.brew.sh/formula/z))

`brew install z`

Once you've done this, you need to add this `. /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh` to your `.zshrc`

### BTOP

fancy system monitor -> ([here](https://formulae.brew.sh/formula/btop))

`brew install btop`

### Neofetch

Get infos about your system -> ([here](https://formulae.brew.sh/formula/neofetch))

`brew install neofetch`

### Remarkable viewer

Repo to install -> [rmview](https://github.com/bordaigorl/rmview) -> work only until remarkable 2.0

### Miniconda

You can install miniconda -> a environment manager for python [here](https://docs.anaconda.com/miniconda/)

Or with ```
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm ~/miniconda3/miniconda.sh
```

Then initialize it with `~/miniconda3/bin/conda init zsh`


# Small details for config

## Getting * on password input :

`sudo visudo` -> then modify line from `Defaults env_reset` to `Defaults env_reset,pwfeedback `

### ULauncher

Very cool app launcher. MacOs style [here](https://ulauncher.io/)