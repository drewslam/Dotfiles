# ~/.bashrc

# export PS1="wussgood \u@\w?: "
parse_git_branch() {
    git branch 2>/dev/null | sed -n '/\* /s///p'
}
export PS1="\[\e[1;32m\]wussgood \[\e[1;35m\]\u@\w?\[\e[33m\]:\$(parse_git_branch)\[\e[0m\] "

# -- Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
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
clean() {
    cd ~ && clear
}

# Update dnf and flatpak packages at once
update() {
    sudo dnf update && flatpak update
}

# -- Load additional configuration files

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        [ -f "$rc" ] && . "$rc"
    done
fi
unset rc

# -- Misc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# System info log on opening
fastfetch
