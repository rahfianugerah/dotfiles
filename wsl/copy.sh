# Copy .zshrc and .bashrc to the home directory
cp "dotfiles/deb/.zshrc" "$HOME/.zshrc"
cp "dotfiles/deb/.bashrc" "$HOME/.bashrc"

# Notify that the files have been copied
echo ".zshrc and .bashrc have been copied to the home directory."

# Refresh the shell
exec "$SHELL"
