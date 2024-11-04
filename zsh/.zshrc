# <<PowerLevel10k Instant Prompt>>
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#FZF Colorscheme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

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
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# <<Auto Completion>>
autoload -Uz compinit && compinit
zinit cdreplay -q

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
# DOESN'T SEEM TO BE WORKING RIGHT NOW
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle 'fzf-tab-complete:cd' fzf-preview 'ls --color $realpath'

# <<Setting Aliases>>
alias vim="nvim"
alias cls="clear"
alias ls="ls -p --color=auto"
alias shutdown="systemctl shutdown"
alias reboot="systemctl reboot"
#Not working: alias pacman="sudo pacman"
alias gs="git status"

# <<FZF Shell Integration>>
eval "$(fzf --zsh)"

