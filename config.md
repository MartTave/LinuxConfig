# Applications

- [Bitwarden](https://bitwarden.com/download/)
- Brave -> in ubuntu software
- [VSCode](https://code.visualstudio.com/)
- Guake -> `sudo apt install guake` Then `guake --restore-preferences ~/Downloads/guake_prefs`

# Todos

Remove old ssh keys from github/gitlab



# Useful packages : 

### Brew

Need to install brew in order to install everything else ([here](https://brew.sh/))

### ZSH -> new shell

[Installation guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

Or with `sudo apt install zsh`

Then set it as shell by default `chsh -s $(which zsh)`

### OMZ

Then you can install oh-my-zsh [here](https://ohmyz.sh/#install)

Or with `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### ZSH theme (p10k)

You can install the recommended font [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

Then install the theme with omz [here](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)

### Z

Super fast folder navigator -> keep in track folder you cd'ed into ([here](https://formulae.brew.sh/formula/z))

### BTOP

fancy system monitor -> ([here](https://formulae.brew.sh/formula/btop))

### Neofetch

Get infos about your system -> ([here](https://formulae.brew.sh/formula/neofetch))

### Remarkable viewer

Repo to install -> [rmview](https://github.com/bordaigorl/rmview) -> work only until remarkable 2.0

# Small details for config

## Getting * on password input :

`sudo visudo` -> then modify line from `Defaults env_reset` to `Defaults env_reset,pwfeedback `
