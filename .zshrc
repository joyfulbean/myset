export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
export INTERFACES="wlp2s0"
export LANG="en_US.UTF-8"
PATH=$PATH:~/.local/bin
ZSH_THEME="alien-minimal/alien-minimal"
#ZSH_THEME="fox"
plugins=( 
  z 
  zsh-autosuggestions
  autojump
  git
)
source ~/.oh-my-zsh/plugins/zsh-syntax-highlihgting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
stty -ixon
source .zsh_aliases
