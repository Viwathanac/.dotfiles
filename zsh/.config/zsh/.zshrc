# <<PowerLevel10k Instant Prompt>>
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# <<ZSH Modules Configuration>>
MODULES_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/modules"
if [[ -d "$MODULES_DIR" ]]; then
    source "$MODULES_DIR/aliases.zsh"
    source "$MODULES_DIR/fzf-macchiato.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# <<Setup ZINIT>> 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download ZINIT if there's none
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# <<Plugins>>
zinit ice depth=1; zinit light romkatv/powerlevel10k
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

# Set the PATH
export PATH="$XDG_DATA_HOME/scripts/:$PATH"
