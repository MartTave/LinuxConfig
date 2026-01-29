[[ -f ~/.config/zsh/zshrc ]] && source ~/.config/zsh/zshrc

. "$HOME/.local/bin/env"

# bun completions
[ -s "/home/marttave/.bun/_bun" ] && source "/home/marttave/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
