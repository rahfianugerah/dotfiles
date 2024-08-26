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