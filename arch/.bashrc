#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias grep='grep --color=auto'

# Mariadb (MySQL) commands
alias startmariadb='sudo systemctl start mariadb'
alias stopmariadb='sudo systemctl stop mariadb'
alias restartmariadb='sudo systemctl restart mariadb'
alias enablemariadb='sudo systemctl enable mariadb'
alias disablemariadb='sudo systemctl disable mariadb'

# Nginx commands
alias startnginx='sudo systemctl start nginx'
alias stopnginx='sudo systemctl stop nginx'
alias restartnginx='sudo systemctl restart nginx'
alias enablenginx='sudo systemctl enable nginx'
alias disablenginx='sudo systemctl disable nginx'

# Apache commands
alias starthttpd='sudo systemctl start httpd'
alias stophttpd='sudo systemctl stop httpd'
alias restarthttpd='sudo systemctl restart httpd'
alias enablehttpd='sudo systemctl enable httpd'
alias disablehttpd='sudo systemctl disable httpd'

# Pacman commands
alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -R'
alias search='pacman -Ss'
alias clean='sudo pacman -Sc'
alias cleanall='sudo pacman -Scc'
alias orphans='sudo pacman -Qdt'

# Network commands
alias startiwctl='sudo systemctl start iwctl'
alias stopiwctl='sudo systemctl stop iwctl'
alias restartiwctl='sudo systemctl restart iwctl'
alias enableiwctl='sudo systemctl enable iwctl'
alias disableiwctl='sudo systemctl disable iwctl'

# Docker commands
alias startdocker='sudo systemctl start docker'
alias stopdocker='sudo systemctl stop docker'
alias restartdocker='sudo systemctl restart docker'
alias enabledocker='sudo systemctl enable docker'
alias disabledocker='sudo systemctl disable docker'

# Check active ports
alias checkport='sudo lsof -i -P -n | grep LISTEN'
alias checkport1='sudo netstat -tulnp'
alias checkport2='sudo netstat -tuln'

# Edit configuration files
alias editbashrc='nano ~/.bashrc'
alias editbashprofile='nano ~/.bash_profile'
alias editvimrc='nano ~/.vimrc'
alias editzshrc='nano ~/.zshrc'
alias editgitconfig='nano ~/.gitconfig'
alias editstarshipconfig='nano ~/.config/starship.toml'
alias editfastfetchconfig='nano ~/.config/fastfetch/fastfetch.conf'

# System commands
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lh'
alias l='ls -CF'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias p='ps aux'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'

PS1='[\u@\h \W]\$ '

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ~/.bashrc

# Starship
eval "$(starship init bash)"

# Fastfetch
fastfetch
