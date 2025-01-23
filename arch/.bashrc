#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias grep='grep --color=auto'

alias startmariadb='sudo systemctl start mariadb'
alias stopmariadb='sudo systemctl stop mariadb'

PS1='[\u@\h \W]\$ '

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ~/.bashrc

# Starship
eval "$(starship init bash)"

# Fastfetch
fastfetch