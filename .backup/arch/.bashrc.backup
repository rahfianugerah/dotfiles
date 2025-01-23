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
alias restartmariadb='sudo systemctl restart mariadb'
alias enablemariadb='sudo systemctl enable mariadb'
alias disablemariadb='sudo systemctl disable mariadb'

alias startnginx='sudo systemctl start nginx'
alias stopnginx='sudo systemctl stop nginx'
alias restartnginx='sudo systemctl restart nginx'
alias enablenginx='sudo systemctl enable nginx'
alias disablenginx='sudo systemctl disable nginx'

alias starthttpd='sudo systemctl start httpd'
alias stophttpd='sudo systemctl stop httpd'
alias restarthttpd='sudo systemctl restart httpd'
alias enablehttpd='sudo systemctl enable httpd'
alias disablehttpd='sudo systemctl disable httpd'

alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -R'
alias search='pacman -Ss'
alias clean='sudo pacman -Sc'
alias cleanall='sudo pacman -Scc'

alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lh'
alias l='ls -CF'

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