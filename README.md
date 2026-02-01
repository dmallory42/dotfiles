# Dotfiles

Personal configuration files for macOS. Uses symlinks for easy deployment.

## Structure

```
dotfiles/
├── shell/
│   └── zshrc          # Main zsh config
├── git/
│   └── gitconfig      # Git configuration
├── claude/
│   ├── CLAUDE.md      # Claude Code global instructions
│   └── settings.json  # Claude Code settings
├── Brewfile           # Homebrew packages
├── bootstrap.sh       # Install dependencies
└── install.sh         # Symlink installer
```

## Installation

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh  # Install Homebrew, Oh My Zsh, plugins
./install.sh    # Create symlinks
```

## Post-install

Set your git email per machine:
```bash
git config --global user.email "your@email.com"
```

For machine-specific shell config, create `~/.zshrc.local` (not tracked).

## Adding Files

1. Copy file to appropriate folder (without the dot prefix)
2. Update `install.sh` with the symlink mapping
3. Commit and push

## Files NOT to commit

- SSH private keys (`id_*`)
- API keys and secrets
- `.zsh_history`

## Dependencies

- [Oh My Zsh](https://ohmyz.sh/) - Install separately
- [Homebrew](https://brew.sh/) - Install separately
- zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- zsh-syntax-highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
- zsh-nvm: `git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm`
