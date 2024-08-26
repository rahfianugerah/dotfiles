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