eval "$(starship init zsh)"

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias dtem='cd $(mktemp -d)'

export PATH="$HOME/.local/bin:$PATH"

# fnm
FNM_PATH="/home/damet/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"

export TERMINAL=ghostty

export MOZ_ENABLE_WAYLAND=1

# opencode
export PATH=/home/damet/.opencode/bin:$PATH


# Ctrl + Arrow word movement
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[OC' forward-word
bindkey '^[OD' backward-word

# bun completions
[ -s "/home/damet/.bun/_bun" ] && source "/home/damet/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias dots=~/dotfiles/scripts/dotfiles.sh
alias gcl=~/dotfiles/scripts/create_git_repo_link

venv() {
    local dir
    dir=$(pwd)

    while [ "$dir" != "/" ]; do
        if [ -f "$dir/venv/bin/activate" ]; then
            source "$dir/venv/bin/activate"
            return
        fi
        dir=$(dirname "$dir")
    done

    echo "No venv found in parent directories"
}

. "$HOME/.local/share/../bin/env"
