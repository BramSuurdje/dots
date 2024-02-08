eval "$(starship init zsh)"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
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
alias clear='clear && pfetch'
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

pfetch

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-theme
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
turnWifi(){
  sudo ip link set wlo1 down
  sudo iw wlo1 set type managed
  sudo ip link set wlo1 up
}
