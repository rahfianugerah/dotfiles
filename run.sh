#!/bin/bash

# Check if NVM is installed
if command -v nvm &> /dev/null; then
    echo "NVM is already installed."
else
    echo "NVM is not installed. Installing NVM..."

    # Download and install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

    # Load NVM into the current shell session
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    echo "NVM installation completed."
fi

# Ensure NVM is loaded into the shell
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Check if Node.js is installed
if command -v node &> /dev/null; then
    echo "Node.js is already installed. Skipping Node.js installation."
else
    # Install the latest version of Node.js using nvm
    echo "Installing the latest version of Node.js using NVM..."
    nvm install node

    # Set the installed Node.js version as the default
    nvm alias default node

    echo "Node.js installation completed. The latest version is now the default."
fi

# Install net-tools
if command -v ifconfig &> /dev/null; then
    echo "net-tools is already installed."
else
    echo "Installing net-tools..."
    sudo apt-get install -y net-tools
    echo "net-tools installation completed."
fi

# Install MySQL server
if command -v mysql &> /dev/null; then
    echo "MySQL server is already installed."
else
    echo "Installing MySQL server..."
    sudo apt-get install -y mysql-server
    echo "MySQL server installation completed."
fi

# Check if pip is installed
if command -v pip &> /dev/null; then
    echo "pip is already installed."
else
    echo "pip is not installed. Installing pip..."
    sudo apt-get update
    sudo apt-get install -y python3-pip
    # In case if cannot download python library
    python3 -m pip config set global.break-system-packages true
    echo "pip installation completed."
fi

# Check if Miniconda3 is installed
if command -v conda &> /dev/null; then
    echo "Miniconda3 is already installed. Skipping Miniconda3 installation."
else
    echo "Miniconda3 is not installed. Installing Miniconda3..."

    # Create miniconda3 directory if not exists
    mkdir -p ~/miniconda3

    # Download and install Miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm ~/miniconda3/miniconda.sh

    # Initialize Miniconda for bash and zsh
    ~/miniconda3/bin/conda init bash
    ~/miniconda3/bin/conda init zsh

    echo "Miniconda3 installation completed."
fi

# Check if gcloud is installed
if command -v gcloud &> /dev/null; then
    echo "Google Cloud SDK (gcloud) is already installed."
else
    # Prompt the user for installation
    read -p "Google Cloud SDK (gcloud) is not installed. Do you want to install it? (y/n): " answer
    if [[ "$answer" == [Yy]* ]]; then
        echo "Installing Google Cloud SDK..."

        # Add the Cloud SDK distribution URI as a package source
        echo "Adding Google Cloud SDK repository..."
        echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

        # Import the Google Cloud public key
        sudo apt-get install -y apt-transport-https ca-certificates
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

        # Update and install the Google Cloud SDK
        sudo apt-get update && sudo apt-get install -y google-cloud-sdk

        echo "Google Cloud SDK installation completed."
    else
        echo "Skipping Google Cloud SDK installation."
    fi
fi


cat << "EOF"
 _________________________________________
/ Welcome home sir!, Your setup will be   \
\ ready immediately. Please wait...       /
 -----------------------------------------
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/'\
    \___)=(___/
EOF

# Install Zsh if not already installed
if command -v zsh &> /dev/null; then
    echo "Zsh is already installed."
else
    echo "Zsh is not installed. Installing Zsh..."

    # Install Zsh
    sudo apt-get update
    sudo apt-get install -y zsh

    echo "Zsh installation completed."
fi

# Change the default shell to Zsh
chsh -s $(which zsh)
echo "Default shell changed to Zsh."

# Check if Oh My Zsh is installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed."
else
    echo "Oh My Zsh is not installed. Installing Oh My Zsh..."

    # Install Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Oh My Zsh installation completed."
fi

# Set Zsh theme in .zshrc
echo "Changing the Zsh theme in .zshrc ..."

# Backup the current .zshrc file
cp ~/.zshrc ~/.zshrc.backup

# Modify the theme in .zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="lambda"/' ~/.zshrc