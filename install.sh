#!/bin/bash
# Dotfiles installer - creates symlinks from home directory to this repo

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

backup_and_link() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backing up $target to $BACKUP_DIR/"
        mv "$target" "$BACKUP_DIR/"
    fi

    if [ -L "$target" ]; then
        rm "$target"
    fi

    echo "Linking $source -> $target"
    ln -s "$source" "$target"
}

# Shell
backup_and_link "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

# Git
backup_and_link "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"

# Claude Code
mkdir -p "$HOME/.claude"
backup_and_link "$DOTFILES_DIR/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
backup_and_link "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"

echo ""
echo "Done! Existing files backed up to: $BACKUP_DIR"
echo ""
echo "Remember to set your git email:"
echo "  git config --global user.email \"your@email.com\""
