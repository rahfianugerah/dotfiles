#!/bin/bash

cat << "EOF"
        .--.
       |o_o |    config-script: run.sh
       |:_/ |    version: 1.1 (arch-linux)
      //   \ \   author(github): rahfianugerah
     (|     | )  repository: rahfianugerah/dotfiles
    /'\_   _/'\
    \___)=(___/
EOF

# Install Google Chrome
if ! pacman -Qi google-chrome &>/dev/null; then
  echo "Installing Google Chrome..."
  echo "Adding repository for Google Chrome..."
  echo -e "\n[custom-google-chrome]\nServer = https://aur.archlinux.org/packages" | sudo tee -a /etc/pacman.conf
  sudo pacman -Sy
  git clone https://aur.archlinux.org/google-chrome.git
  cd google-chrome
  makepkg -si --noconfirm
  cd ..
  rm -rf google-chrome
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

# Install Visual Studio Code
if ! pacman -Qi code &>/dev/null; then
  echo "Installing Visual Studio Code..."
  git clone https://aur.archlinux.org/visual-studio-code-bin.git
  cd visual-studio-code-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf visual-studio-code-bin
else
  echo "Visual Studio Code is already installed."
fi

# Install lsof
if ! pacman -Qi lsof &>/dev/null; then
  echo "Installing lsof..."
  sudo pacman -S lsof
else
  echo "lsof is already installed."
fi

# Install net-tools
if ! pacman -Qi net-tools &>/dev/null; then
  echo "Installing net-tools..."
  sudo pacman -S net-tools
else
  echo "net-tools is already installed."
fi

# Install unzip
if ! pacman -Qi unzip &>/dev/null; then
  echo "Installing unzip..."
  sudo pacman -S unzip
else
  echo "unzip is already installed."
fi

# Final message
echo "All requested software has been installed or is already present."
