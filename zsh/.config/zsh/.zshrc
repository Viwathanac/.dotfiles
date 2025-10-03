# <<ZSH Modules Configuration>>
MODULES_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/modules"
if [[ -d "$MODULES_DIR" ]]; then
    source "$MODULES_DIR/aliases.zsh"
    source "$MODULES_DIR/fzf-macchiato.zsh"
    source "$MODULES_DIR/keybind.zsh"
fi

# <<Setup ZINIT>> 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download ZINIT if there's none
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# <<Plugins>>
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# 	<<<Plugins Snippet>>>
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# <<Auto Completion>>
autoload -Uz compinit && compinit
zinit cdreplay -q

# <<Keybind>>
bindkey -v
bindkey '^n' history-search-forward #Control n
bindkey '^p' history-search-backward #Control p

# <<History>>
HISTSIZE=5000
HISTFILE=~/.histfile 
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory 
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# <<Completion Styling>>
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# <<FZF Shell Integration>>
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
