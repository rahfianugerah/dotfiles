#!/bin/bash

cat << "EOF"
        .--.
       |o_o |    config-script: run.sh
       |:_/ |    version: 1.0 (arch-linux)
      //   \ \   author(github): rahfianugerah
     (|     | )  repository: rahfianugerah/dotfiles
    /'\_   _/'\
    \___)=(___/
EOF

# Prompt for user name for Git configuration
read -p "Enter your name for Git configuration: " name
# Prompt for user email for Git configuration
read -p "Enter your email for Git configuration: " email
# Prompt for the desired default branch name
read -p "Enter the default branch name: " branch_name

# Set the global Git user name
git config --global user.name "$name"
# Set the global Git user email
git config --global user.email "$email"
# Set the default branch name
git config --global init.defaultBranch "$branch_name"

# Confirmation message
echo "Git configuration was successful!"
echo "User name: $name"
echo "User email: $email"
echo "Default branch name: $branch_name"
