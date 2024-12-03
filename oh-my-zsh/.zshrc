
#oh-my-zsh folder
export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:$HOME/go/bin
export XDG_CONFIG_HOME="$HOME/.config"
export OS="MacOS"

alias n="nvim"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
