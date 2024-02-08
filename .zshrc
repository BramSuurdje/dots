
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/kushal.omp.json')"
typeset -g POWERLEVEL10K_INSTANT_PROMPT=quiet
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_THEME=""
export ZSH="$HOME/.oh-my-zsh"
plugins=( 
    git
    archlinux
    zsh-autosuggestions
    you-should-use
    zsh-syntax-highlighting
    extract
    web-search
    docker
)

source $ZSH/oh-my-zsh.sh

# Exports
export EDITOR=nvim
export VISUAL=nvim

alias vup='wg-quick up laptop'
alias vdown='wg-quick down laptop'
alias vm='/home/bram/.config/hypr/scripts/vm.sh'
alias vim='nvim'
alias ls='eza -alh --color=always --group-directories-first'
# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# Remove duplicates from $PATH
typeset -U PATH

### From this line is for pywal-colors
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/nvm/init-nvm.sh

# Functions
refreshMirrors() {
  sudo reflector --verbose \
  --latest 15 \
  --fastest 15 \
  --age 10 \
  --protocol https \
  --sort rate \
  --save /etc/pacman.d/mirrorlist
}
