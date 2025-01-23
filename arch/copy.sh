cp "dotfiles/arch/.bashrc" "$HOME/.bashrc"

# Notify that the files have been copied
echo ".bashrc file have been copied to the home directory."

# Refresh the shell
exec "$SHELL"