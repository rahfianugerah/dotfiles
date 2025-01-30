#!/bin/bash

cat << "EOF"
        .--.
       |o_o |    config-script: run.sh
       |:_/ |    version: 1.4 (arch-linux)
      //   \ \   author(github): rahfianugerah
     (|     | )  repository: rahfianugerah/dotfiles
    /'\_   _/'\
    \___)=(___/
EOF

# Function to check if a package is installed
is_installed() {
    pacman -Qi "$1" &>/dev/null
}

# Install required base-devel if not installed
if ! is_installed base-devel; then
    echo "Installing base-devel (required for building AUR packages)..."
    sudo pacman -S --needed --noconfirm base-devel
fi

# Install Google Chrome manually from AUR
if ! is_installed google-chrome; then
    echo "Installing Google Chrome..."
    if [ ! -d "google-chrome" ]; then
        git clone https://aur.archlinux.org/google-chrome.git
    fi
    cd google-chrome || exit
    makepkg -si --noconfirm
    cd ..
else
    echo "Google Chrome is already installed."
fi

# Install NVM
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\" # This loads nvm" >> ~/.bashrc
    echo "[ -s \"$NVM_DIR/bash_completion\" ] && . \"$NVM_DIR/bash_completion\" # This loads nvm bash_completion" >> ~/.bashrc
    source ~/.bashrc
else
    echo "NVM is already installed."
fi

# Install Visual Studio Code manually from AUR
if ! is_installed code; then
    echo "Installing Visual Studio Code..."
    if [ ! -d "visual-studio-code-bin" ]; then
        git clone https://aur.archlinux.org/visual-studio-code-bin.git
    fi
    cd visual-studio-code-bin || exit
    makepkg -si --noconfirm
    cd ..
else
    echo "Visual Studio Code is already installed."
fi

# Install lsof
if ! is_installed lsof; then
    echo "Installing lsof..."
    sudo pacman -S --noconfirm lsof
else
    echo "lsof is already installed."
fi

# Install net-tools
if ! is_installed net-tools; then
    echo "Installing net-tools..."
    sudo pacman -S --noconfirm net-tools
else
    echo "net-tools is already installed."
fi

# Install unzip
if ! is_installed unzip; then
    echo "Installing unzip..."
    sudo pacman -S --noconfirm unzip
else
    echo "unzip is already installed."
fi

# Install MariaDB
if ! is_installed mariadb; then
    echo "Installing MariaDB..."
    sudo pacman -S --noconfirm mariadb
    echo "Initializing MariaDB database..."
    sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    echo "Finish installing MariaDB service."
else
    echo "MariaDB is already installed."
fi

# Final message
echo "All requested software has been installed or is already present."