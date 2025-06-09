# ~/.zshrc

# -- Basic ZSH Configuration
autoload -Uz compinit && compinit   # Enable completion system
zstyle ':completion:*' menu select  # Enable menu-style completion
setopt PROMPT_SUBST                 # Enable prompt substitution

# -- Present current git branch
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# -- Prompt
PROMPT='%F{green}wussgood %F{magenta}%n@%~?%F{yellow}:$(parse_git_branch)%f '

# -- Source global definitions
if [ -f /etc/zshrc ]; then
  source /etc/zshrc
fi

# -- User specific environment

# Add local bin directories and Go path to PATH
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:$PATH"

# Add GOPATH variable
export GOPATH=$HOME/go

# Add path variables for Qt6
export QT_PLUGIN_PATH=/usr/lib/qt6/plugins
export LD_LIBRARY_PATH=/usr/lib/qt6/lib

# -- Aliases

# Launch KDE apps via Flatpak
alias kate="flatpak run org.kde.kate"
alias okular="flatpak run org.kde.okular"

# Open Delve to debug Go projects
alias dlv=$HOME/go/bin/dlv

# -- Functions

# Clear screen and returns to home
function clean() {
  cd ~ && clear
}

# Update dnf and flatpak packages at once
function update() {
  sudo dnf update && flatpak update
}

# -- Load additional configuration files
if [ -d ~/.zshrc.d ]; then
  for rc in ~/.zshrc.d/*; do
    [ -f "$rc" ] && source "$rc"
  done
fi
unset rc

# -- History Settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # Don't save duplicate commands
setopt APPEND_HISTORY         # Append to history file
setopt SHARE_HISTORY          # Share history between sessions

# -- Key Bindings
bindkey -v                    # Use vi keybindings
export KEYTIMEOUT=1

# -- Misc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Be myself 
fastfetch
