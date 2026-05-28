#!/bin/bash

# Directorio del repositorio
REPO_DIR="$HOME/repos/kdr/ubuntu-dotfiles-kdr"

echo "Creando enlaces simbólicos (symlinks) para los dotfiles..."

# Función para respaldar archivos actuales si no son enlaces simbólicos
backup_if_needed() {
    local file=$1
    if [ -f "$file" ] && [ ! -L "$file" ]; then
        echo "Respaldando $file a $file.bak"
        mv "$file" "$file.bak"
    fi
}

# 1. Zsh
backup_if_needed "$HOME/.zshrc"
backup_if_needed "$HOME/.zsh_aliases"

ln -sf "$REPO_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO_DIR/.zsh_aliases" "$HOME/.zsh_aliases"
echo "✅ Zsh config enlazada."

# 2. WezTerm
mkdir -p "$HOME/.config/wezterm"
backup_if_needed "$HOME/.config/wezterm/wezterm.lua"

ln -sf "$REPO_DIR/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
echo "✅ WezTerm config enlazada."

echo "¡Todos los enlaces simbólicos han sido creados exitosamente!"
