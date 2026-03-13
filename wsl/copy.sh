# Copy .zshrc and .bashrc to the home directory
cp "dotfiles/wsl/.bashrc" "$HOME/.bashrc"

# Notify that the files have been copied
echo ".bashrc have been copied to the home directory."

# Refresh the shell
exec "$SHELL"
